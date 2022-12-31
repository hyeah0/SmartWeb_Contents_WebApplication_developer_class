package com.spring.coffee;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.model.BeanDAO;
import com.spring.model.CoffeeBeanDTO;
import com.spring.model.CoffeeStarDTO;
import com.spring.model.CoffeeWriteDTO;


@Controller
public class CoffeeBeanController {

	@Inject
	private BeanDAO dao;

	// 모든 원두 목록 리스트
	@RequestMapping("bean_list.do")
	public String list(Model model, CoffeeBeanDTO dto) {
		
		// 원두 목록 리스트
		List<CoffeeBeanDTO> list = this.dao.getBeanList();
		model.addAttribute("List", list);

		
		// 원두 전체 개수 저장
		String count = this.dao.getBeansCount();
		System.out.println("count>>"+count);
		model.addAttribute("Count", count);
		
		
		return "./bean/bean_list";
	}

	// 찜 수정 또는 등록
	@RequestMapping("beans_heart.do")
	public void updateHeart(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int member_num = Integer.valueOf(request.getParameter("member_num"));
		int beans_num = Integer.valueOf(request.getParameter("beans_num"));


		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("member_num", member_num);
		map.put("beans_num", beans_num);


		// 이미 데이터가 있다면 DB 수정, 없을 경우 DB 추가 (0일때는 데이터 없음)
		CoffeeStarDTO dto = this.dao.seHeart(map);
		int insertHeart = dto.getBeans_num();
		int updateHeart = dto.getCoffee_heart();

		// 찜해져있는 상태라면 찜 해제(0), 아닐경우 찜하기(1)
		if (updateHeart == 0) {
			updateHeart = 1;
		} else {
			updateHeart = 0;
		}
		
		map.put("coffee_heart", updateHeart);

		PrintWriter out = response.getWriter();

		if (insertHeart == 0) {
			// 찜 등록
			this.dao.insertHeart(map);
		} else {
			// 찜 수정
			this.dao.updateHeart(map);
		}
		out.println(updateHeart);
	}

	// 정렬할때 찜 많은 순
	@RequestMapping("beans_list_heart.do")
	public String downlist(Model model, CoffeeBeanDTO dto) {

		// 커피 목록 리스트
		List<CoffeeBeanDTO> list = this.dao.getBeanHeartList();
		model.addAttribute("List", list);

		// 원두 전체 개수 저장
		String count = this.dao.getBeansCount();
		System.out.println("count>>"+count);
		model.addAttribute("Count", count);		
		
		return "./bean/bean_list";

	}

	// 정렬 가격이 낮은 순
	@RequestMapping("beans_price_down.do")
	public String priceDownList(Model model, CoffeeBeanDTO dto) {

		// 커피 목록 리스트
		List<CoffeeBeanDTO> list = this.dao.BeanPriceDownList();
		model.addAttribute("List", list);

		// 원두 전체 개수 저장
		String count = this.dao.getBeansCount();
		System.out.println("count>>"+count);
		model.addAttribute("Count", count);		
		
		return "./bean/bean_list";

	}

	// 정렬 가격이 높은 순
	@RequestMapping("beans_price_up.do")
	public String priceUpList(Model model, CoffeeBeanDTO dto) {

		// 커피 목록 리스트
		List<CoffeeBeanDTO> list = this.dao.BeanPriceUpList();
		model.addAttribute("List", list);

		// 원두 전체 개수 저장
		String count = this.dao.getBeansCount();
		System.out.println("count>>"+count);
		model.addAttribute("Count", count);		
		
		return "./bean/bean_list";

		
	}	
	
	// 정렬 별점 5점만
	@RequestMapping("beans_star_5.do")
	public String beansStar5(Model model, CoffeeBeanDTO dto) {
		
		List<CoffeeBeanDTO> list = this.dao.BeanStar5List();
		model.addAttribute("List", list);

		// 원두 전체 개수 저장
		String count = this.dao.getBeansCount();
		System.out.println("count>>"+count);
		model.addAttribute("Count", count);	
		
		return "./bean/bean_list";
	}
	
	// 정렬 별점 4점만
	@RequestMapping("beans_star_4.do")
	public String beansStar4(Model model, CoffeeBeanDTO dto) {
		
		List<CoffeeBeanDTO> list = this.dao.BeanStar4List();
		model.addAttribute("List", list);
		
		// 원두 전체 개수 저장
		String count = this.dao.getBeansCount();
		System.out.println("count>>"+count);
		model.addAttribute("Count", count);	
		
		return "./bean/bean_list";
	}
	
	// 정렬 별점 3점만
	@RequestMapping("beans_star_3.do")
	public String beansStar3(Model model, CoffeeBeanDTO dto) {
		
		List<CoffeeBeanDTO> list = this.dao.BeanStar3List();
		model.addAttribute("List", list);
		
		// 원두 전체 개수 저장
		String count = this.dao.getBeansCount();
		System.out.println("count>>"+count);
		model.addAttribute("Count", count);	
		
		return "./bean/bean_list";
	}
	
	// 정렬 별점 2점만
	@RequestMapping("beans_star_2.do")
	public String beansStar2(Model model, CoffeeBeanDTO dto) {
		
		List<CoffeeBeanDTO> list = this.dao.BeanStar2List();
		model.addAttribute("List", list);
		
		// 원두 전체 개수 저장
		String count = this.dao.getBeansCount();
		System.out.println("count>>"+count);
		model.addAttribute("Count", count);	
		
		return "./bean/bean_list";
	}
	
	// 정렬 별점 1점만
	@RequestMapping("beans_star_1.do")
	public String beansStar1(Model model, CoffeeBeanDTO dto) {
		
		List<CoffeeBeanDTO> list = this.dao.BeanStar1List();
		model.addAttribute("List", list);
		
		// 원두 전체 개수 저장
		String count = this.dao.getBeansCount();
		System.out.println("count>>"+count);
		model.addAttribute("Count", count);	
		
		return "./bean/bean_list";
	}
	

	// 원두 상세정보 페이지
	@RequestMapping("bean_content.do")
	public String content(@RequestParam("num") int num, @RequestParam("no") int no, Model model) {

		// 커피 목록 리스트
		List<CoffeeBeanDTO> list = this.dao.getBeanList();
		model.addAttribute("List", list);

		// 원두 상세 정보 
		CoffeeBeanDTO dto = this.dao.getBeanContent(num);
		model.addAttribute("Cont", dto);
		
		// 후기글 작성 총 개수
		int count = this.dao.getWriteCount(num);
		dto.setWrite_count(count);
		
		System.out.println("num>>>>>>>>>>>"+num);
		
		int check = this.dao.starCheck(num);
		
		System.out.println("CHkckck>>>"+check);
		
		// 평점 평균을 구할 수 있는지 조건문.
		if(check == 0) {

			dto.setStar_avg(0);
			
		}else if(check != 0) {
			
			// 후기글 평점에 대한 평균 
			int avg = this.dao.starAvg(num);
			System.out.println("avavavav>>"+avg); 
			dto.setStar_avg(avg);				
		}
	
		// 원두 번호에 해당하는 후기글 list
		List<CoffeeWriteDTO> list_1 = this.dao.getWriteList(num);
		model.addAttribute("writeList", list_1);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("member_num", no);
		map.put("beans_num", num);
			
		// 원두 번호에 해당하며 현재 세션 값인 사람이 이미 후기글을 작성했는지 안했는지..
		int writeCheck = this.dao.writeCheck(map);
		System.out.println("writeCheck>>>"+writeCheck);
		model.addAttribute("writeCheck", writeCheck);			
		
		// 상품을 산 사람만 후기글을 남길 수 있게 해보자.
		int buyCheck = this.dao.buyCheck(map);
		model.addAttribute("buyCheck", buyCheck);
		
		return "./bean/bean_content";
	}

	// 후기글 추가
	@RequestMapping("write_insert.do")
	public void writeinsert(MultipartHttpServletRequest mRequest,CoffeeWriteDTO wdto,
			@RequestParam("beans_num") int beans_num, @RequestParam(value="img", required = false , defaultValue = "") String img,
			@RequestParam("write_cont") String write_cont, @RequestParam("member_id") String member_id, @RequestParam("coffee_star") int coffee_star,@RequestParam("member_num") int member_num, HttpServletResponse response,HttpServletRequest request) throws IOException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("beans_num", beans_num);
		map.put("member_id", member_id);
		map.put("write_cont", write_cont);
		map.put("member_num", member_num);
		map.put("coffee_star", coffee_star);
		
	  	String uploadPath = request.getRealPath("/resources/res/img/"); 
		System.out.println(uploadPath);
		
		// 업로드된 파일들의 이름 목록을 제공하는 메서드.
		Iterator<String> iterator = mRequest.getFileNames();
		System.out.println("iterator : " + iterator);
	      // 실제 폴더를 만들어 보자.
       
        String homedir = uploadPath;
        System.out.println("homedir : " + homedir);

        File path1 = new File(homedir);
        System.out.println("path1 : " + path1);

        if(!path1.exists()) {
            path1.mkdirs();
        }
		while(iterator.hasNext()) {
			String uploadFileName = iterator.next();
			System.out.println("uploadFileName : " + uploadFileName);
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			System.out.println("mFile : " + mFile);
			
			String originalFileName = mFile.getOriginalFilename();
			System.out.println("originalFileName : " + originalFileName);
			
			// 실제 파일을 만들어 보자.(파일복사느낌임)
			String saveFileName = originalFileName;
			System.out.println("saveFileName : " + saveFileName);
			
			if(!saveFileName.equals(null)) {
				saveFileName = System.currentTimeMillis()+"_"+saveFileName;		// 현재 시간을 천분의 1초단위로 계산하고 있는 메소드래..
				System.out.println("saveFileName : "+saveFileName);
				
				try {
					// ...................\\resources\\upload\\2022-11-25\\실제파일
					File origin = new File(uploadPath+"/"+saveFileName);
					
					// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드.
					if(!img.equals("")) new File(img).delete();
					
					mFile.transferTo(origin);
					map.put("write_img", saveFileName);														
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		// 후기글 작성
		int res = this.dao.seWrite(map);
		
		int check = this.dao.checkWrite(map);
		System.out.println("check>>>>"+check);
		
		if(check == 0) {
			System.out.println("insert로 하겟슴다");
			// 후기글 작성하면서 별점도 같이 추가
			int dto = this.dao.insertWriteStar(map);
		}else if(check > 0){
			System.out.println("update로 하겠슴다.");
			int dto_u = this.dao.updateWriteStar(map);
		}
		
		response.setContentType("text/html; enctype=UTF-8");
		
		PrintWriter out=response.getWriter();
		
		out.println("<script>location.href='"+mRequest.getContextPath()+"/bean_content.do?num="+beans_num+"&no="+member_num+"';</script>");

	}
	
	// 후기글 삭제 하는 메서드.
	@RequestMapping("write_delete.do")
	public void deleteWrite(@RequestParam("m_num") int member_num, @RequestParam("no") int write_num, @RequestParam("num") int beans_num, HttpServletResponse response) throws IOException {
		
		int res = this.dao.deleteWrite(write_num);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("member_num", member_num);
		map.put("beans_num", beans_num);
		
		int check = this.dao.deleteStar(map);
		
		System.out.println("check...."+check);
		
		response.setContentType("text/html; enctype=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			out.println("<script>");
			out.println("alert('삭제 완료')");
			out.println("location.href='bean_content.do?num="+beans_num+"&no="+member_num+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('삭제 실패..')");
			out.println("history.back()");
			out.println("</script>");
		}		
				
	}

}
