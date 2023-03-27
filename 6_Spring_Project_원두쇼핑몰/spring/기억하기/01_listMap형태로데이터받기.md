## 컨트롤러

```
// 테스트 결과값 확인
List<Map<String, Object>> testMapList = testDao.getTestResultTypeNum(testChooseMap);
```

- 값 확인하기

```
int test_result_num = Integer.parseInt(String.valueOf(testMapList.get(0).get("TEST_RESULT_NUM")));
String test_name = (String) testMapList.get(0).get("TEST_NAME");
String test_img = (String) testMapList.get(0).get("TEST_IMG");
```

## dao

```
// 결과 testNum 가져오기
List<Map<String, Object>> getTestResultTypeNum(Map<String, Integer> testChooseMap);

@Override
public List<Map<String, Object>> getTestResultTypeNum(Map<String, Integer> testChooseMap) {
    return this.sqlSession.selectList("getTestResultTypeNum", testChooseMap);
}
```

## xml

```
<select id="getTestResultTypeNum" parameterType="hashmap" resultType="map">
    select ctr.test_result_num
        , ct.test_name
        , ct.test_img
    from coffee_test ct
    join (select case when #{testRsDecaff} = 0 then 1 else test_num end as test_result_num
            from coffee_test_result
            where test_rs_brew = #{testRsBrew}
            and test_rs_add = #{testRsAdd}
            and test_rs_taste_acid = #{testRsAcid}
            and test_rs_taste = #{testRsTaste} ) ctr
    on ct.test_num = ctr.test_result_num
</select>
```

### controller 

```
@RequestMapping("bean_test_result.do")
public void beanTestResult(HttpSession session, HttpServletResponse response) throws IOException {

    System.out.println("-- bean_test_result.do ----------------------------------------------------------------");
    String[] typesArr = {"testRsBrew", "testRsAdd","testRsDecaff","testRsAcid","testRsTaste"};

    // 타입넘 넘겨주기
    Map<String, Integer> testChooseMap = (Map<String, Integer>) session.getAttribute("testChooseMap");

    System.out.println("-- 세션값확인 ----------------------------------------------------------------------------");
    for (int i = 0; i < testChooseMap.size(); i++) {
        System.out.println(typesArr[i] + " : " + testChooseMap.get(typesArr[i]) );
    }

    // 테스트 결과값 확인
    List<Map<String, Object>> testMapList = testDao.getTestResultTypeNum(testChooseMap);

    // 테스트 결과값 넘겨주기 (결과값 : test_result_num)
    int test_result_num = Integer.parseInt(String.valueOf(testMapList.get(0).get("TEST_RESULT_NUM")));
    String test_name = (String) testMapList.get(0).get("TEST_NAME");
    String test_img = (String) testMapList.get(0).get("TEST_IMG");

    System.out.println("test_result_num : " + test_result_num);

    // 로그인 한 회원이라면 결과값 저장 하기
    if(session.getAttribute("member_num")!=null) {
        int member_num = (Integer) session.getAttribute("member_num");
        System.out.println("로그인한 멤버의 멤버넘 : " + member_num );

        Map<String, Integer> updateMap = new HashMap<String, Integer>();
        updateMap.put("member_num", member_num);
        updateMap.put("test_result_num", test_result_num );

        int result = testDao.updateTestResultTypeNum(updateMap);
        System.out.println("로그인한 회원의 테스트값 수정 결과 : " + result);

        // 세션 수정
        if( (Integer) session.getAttribute("test_num") != test_result_num) {
            session.setAttribute("test_num", test_result_num );
            session.setAttribute("test_img", test_img);
            session.setAttribute("test_name", test_name);
        }
    }

    System.out.println("---------------------------------------------------------------------------------------");


    PrintWriter out = response.getWriter();
    out.println("<script>");
    out.println("location.href='testResult.do?no="+test_result_num+"'");
    out.println("</script>");


}
```
