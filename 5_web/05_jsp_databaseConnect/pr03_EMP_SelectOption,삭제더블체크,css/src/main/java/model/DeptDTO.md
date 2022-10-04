```
package model;

// 부서 관련 데이터 (부서번호, 부서명, 부서위치 테이블)

public class DeptDTO {

	private int deptno;
	private String dname;
	private String loc;

	// getter, setter method
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}


}
```
