package com.spring.coffee;

import java.io.File;
import java.io.IOException;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.model.AdminDAO;
import com.spring.model.BoardReplyDTO;
import com.spring.model.CoffeeBeanDTO;
import com.spring.model.CoffeeOrderDTO;
import com.spring.model.FinalAdminDTO;
import com.spring.model.FinalMemberDTO;
import com.spring.model.PageDTO;

@Controller
public class AdminController {

@Inject
private AdminDAO dao;

//한페이지당 보여질 게시물수
private final int rowsize=5;
//DB상의 전체 게시물 수
private int totalRecord=0;

/*
	@RequestMapping("adminlogin.do")
	public String adminlogPage() {
		
		return "./Admin/adminlog";
	}
	
	@RequestMapping("admin_login_check.do")
	public String check_admin(FinalAdminDTO dto,HttpSession session,HttpServletResponse response) throws IOException {
		
		FinalAdminDTO a_dto = this.dao.admin_check(dto);
		
		PrintWriter out = response.getWriter();
		
		if(a_dto != null) {
				session.setAttribute("admin_id", a_dto.getAdmin_id());
			
		}else if(a_dto==null){
			out.println("<script>");
			out.println("alert('로그인안됨;;')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return "./Admin/admin_main";
	}
*/	
	
	@RequestMapping("admin_main.do")
	public String main() {
		return "./Admin/admin_main";
	}
	
	// 관리자 회원 관리 페이지
	@RequestMapping("admin_memeber.do")
	public String member_list(HttpServletRequest request, Model model) {
		
		
		 // 페이징 처리 작업
        int page;    // 현재 페이지 변수

        if(request.getParameter("page") != null) {

            page = Integer.parseInt(request.getParameter("page"));

        }else {

            // 처음으로 게시물 전체 목록을 클릭한 경우.
            page = 1;
        }

        // DB상의 전체 게시물의 수를 확인하는 메서드 호출.
        totalRecord = this.dao.memberList();

        PageDTO dto = new PageDTO(page, this.rowsize,this.totalRecord);
             
        List<FinalMemberDTO> list = this.dao.memberList(dto);
        // 페이지에 해당하는 게시물을 가져오는 메서드 호출.
  
		// 회원 전체 수 저장
		String count = this.dao.getMemberCount();
		System.out.println("count>>"+count);
		model.addAttribute("Count", count);
        

        model.addAttribute("Paging", dto);
			
		model.addAttribute("memberList", list);
		
		return "./Admin/Admin_Member_List";
	}
	
	
	@RequestMapping("admin_cont.do")
	public String admin_cont(@RequestParam("num")int num,@RequestParam("page") int nowPage ,Model model) {
		
		FinalMemberDTO dto = this.dao.admin_cont(num);
		FinalMemberDTO dto2 = this.dao.admin_test(num);
		List<CoffeeOrderDTO> dto1 =this.dao.admin_order(num);
		
		System.out.println(">>>>>>>>>>>"+dto2);
		
		model.addAttribute("member_test", dto2);
		model.addAttribute("member_order", dto1);
		model.addAttribute("member_cont",dto);
		model.addAttribute("page", nowPage);
		
		return "./Admin/Admin_cont";
	}
	
	
	// 관리자 원두 관리 페이지
	@RequestMapping("admin_beans.do")
	public String admin_beans(Model model, HttpServletRequest request) {

		 // 페이징 처리 작업
        int page;    // 현재 페이지 변수

        if(request.getParameter("page") != null) {

            page = Integer.parseInt(request.getParameter("page"));

        }else {

            // 처음으로 게시물 전체 목록을 클릭한 경우.
            page = 1;
        }

        // DB상의 전체 게시물의 수를 확인하는 메서드 호출.
        totalRecord = this.dao.beansList();

        PageDTO dto = new PageDTO(page, this.rowsize,this.totalRecord);		
		
		List<CoffeeBeanDTO> list = this.dao.getBeanList(dto);
		
		// 원두 전체 개수 저장
		String count = this.dao.getBeansCount();
		System.out.println("count>>"+count);
		model.addAttribute("Count", count);
		
		model.addAttribute("beans_list", list);
		model.addAttribute("Paging", dto);

		return "./Admin/Admin_beans_List";
	}

		@RequestMapping("admin_center.do")
		public String order_list(HttpServletRequest request, Model model) {
			
			
			 // 페이징 처리 작업
	        int page;    // 현재 페이지 변수

	        if(request.getParameter("page") != null) {

	            page = Integer.parseInt(request.getParameter("page"));

	        }else {

	            // 처음으로 게시물 전체 목록을 클릭한 경우.
	            page = 1;
	        }

	        // DB상의 전체 게시물의 수를 확인하는 메서드 호출.
	        totalRecord = this.dao.boardList();

	        PageDTO dto = new PageDTO(page, this.rowsize, this.totalRecord);
	             
	        List<FinalMemberDTO> list = this.dao.boardList(dto);
	        // 페이지에 해당하는 게시물을 가져오는 메서드 호출.

	        model.addAttribute("Paging", dto);				
			model.addAttribute("boardList", list);
			
			return "./Admin/Admin_Member_board";
		}

	// 관리자 원두 상세정보 페이지
	@RequestMapping("admin_beans_cont.do")
	public String admin_bean_cont(@RequestParam("no") int beans_num, Model model) {
		
		CoffeeBeanDTO dto = this.dao.getBeanContent(beans_num);

		model.addAttribute("cont", dto);
		
		String avg = this.dao.starAvg1(beans_num);
		System.out.println("avgavg"+avg);
		model.addAttribute("avg", avg);
		
		int number = this.dao.getbuyNumber(beans_num);
		
		model.addAttribute("num", number);
		
		return "./Admin/Admin_beans_cont";
	}
	
	//관리자 원두 수정 페이지
	  @RequestMapping("admin_beans_modify.do")
	  public String admin_bean_modify(@RequestParam("no") int beans_num, Model model) {
	  
		  CoffeeBeanDTO dto = this.dao.getBeanContent(beans_num);
		  model.addAttribute("cont", dto);

		String avg = this.dao.starAvg1(beans_num);
		System.out.println("avgavg"+avg);
		model.addAttribute("avg", avg);
	  
		int number = this.dao.getbuyNumber(beans_num);
		
		model.addAttribute("num", number);
		
		  return "./Admin/Admin_beans_modify";
	  }
	  
	  // 관리자 원두 수정 페이지
	  @RequestMapping("admin_beans_modify_ok.do")
	  public void admin_bean_modify_ok(CoffeeBeanDTO dto, HttpServletResponse response) throws IOException {
		  
		  int res = this.dao.adminBeanModify(dto);
		  
		  response.setContentType("text/html; charset=UTF-8");
		  
		  PrintWriter out = response.getWriter();
		  
			if(res > 0) {
				out.println("<script>");
				out.println("alert('수정 되었습니다.')");
				out.println("location.href='admin_beans_cont.do?no="+dto.getBeans_num()+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('수정이 실패되었습니다.')");
				out.println("history.back()");
				out.println("</script>");
			}		  
	  }

	  // 관리자 원두 삭제 페이지
	  @RequestMapping("admin_beans_delete.do")
	  public void admin_bean_delete(@RequestParam("no") int beans_num, HttpServletResponse response) throws IOException {
		  
		  int res = this.dao.adminBeanDelete(beans_num);
		  
		  response.setContentType("text/html; charset=UTF-8");
		  
		  PrintWriter out = response.getWriter();
		  
			if(res > 0) {
				out.println("<script>");
				out.println("alert('삭제 되었습니다.')");
				out.println("location.href='admin_beans.do'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('삭제가 실패되었습니다.')");
				out.println("history.back()");
				out.println("</script>");
			}
	  }
	  
	  // 관리자 원두 관리 검색 페이지
	  @RequestMapping("beans_search.do")
	  public String search(@RequestParam("keyword") String keyword, Model model) {
		  
		  List<CoffeeBeanDTO> list = this.dao.searchBeanList(keyword);
	
		  model.addAttribute("beans_list", list);

		  int searchCount = this.dao.searchCount(keyword);
		  
		  model.addAttribute("SearchCount", searchCount);
		  
		  return "./Admin/Admin_beans_Search_list";

	  }
	  
	  // 관리자 회원 관리 검색 페이지
	  @RequestMapping("member_search.do")
	  public String memberSearch(@RequestParam("keyword") String keyword, Model model) {
		  
		  List<FinalMemberDTO> list = this.dao.searchMemberList(keyword);
		  
		  model.addAttribute("memberList", list);
		  
		  int searchCount = this.dao.searchCountMem(keyword);
		  
		  model.addAttribute("SearchCount", searchCount);
		  
		  return "./Admin/Admin_member_Search_list";
		  
	  }
	  
	  // 관리자 원두 추가 페이지
	  @RequestMapping("admin_beans_insert.do")
	  public void admin_beans_insert(CoffeeBeanDTO dto, @RequestParam("beans_num") int beans_num, @RequestParam("beans_count") int beans_count, MultipartHttpServletRequest mRequest,
			  @RequestParam("beans_name") String beans_name, @RequestParam("beans_taste") String beans_taste, @RequestParam("beans_price") int beans_price, @RequestParam("beans_intro") String beans_intro,
			  @RequestParam(value="img", required = false , defaultValue = "") String img, HttpServletResponse response,HttpServletRequest request) throws IOException {
		  
		  Map<String, Object> map = new HashMap<String, Object>();
		  
		  map.put("beans_num", beans_num);
		  map.put("beans_count", beans_count);
		  map.put("beans_name", beans_name);
		  map.put("beans_taste", beans_taste);
		  map.put("beans_price", beans_price);
		  map.put("beans_intro", beans_intro);

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
						map.put("beans_add_image", saveFileName);														
						
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		
		  int res = this.dao.adminBeanInsert(map);
		  
		  System.out.println("res++++"+ res);
		  response.setContentType("text/html; charset=UTF-8");
		  
		  PrintWriter out = response.getWriter();
		  
		  out.println("<script>location.href='"+mRequest.getContextPath()+"/admin_beans.do';</script>");
		  
	  }
	  
	  @RequestMapping("adminboard_cont.do")
	  public String board_cont(@RequestParam("num")int board_num ,Model model ) {
		  
		  FinalMemberDTO dto = this.dao.centerwrite(board_num);
		  
		
		System.out.println(">>>>>>>"+dto.getBoard_cont()); 
		  

		  model.addAttribute("centerCont",dto);
		 
		  
		  return "./Admin/Admin_centerCont";
	  }
	  
	  @RequestMapping("admin_center_ok.do")
	  public void admin_member_modify_ok(@RequestParam("board_num") int board_num,@RequestParam("reply_cont") String reply_cont,FinalMemberDTO dto, HttpServletResponse response) throws IOException {
		
			/* int res = this.dao.admincenterOk(board_num); */
		  
		  Map<String, Object>map = new HashMap<String, Object>();
		 
		  
		  map.put("reply_cont", reply_cont);
		  map.put("board_num", board_num);
		  map.put("admin_num", "");
		  
		 int res = this.dao.admincenterOk(map);
		  
		  response.setContentType("text/html; charset=UTF-8");
		  
		  PrintWriter out = response.getWriter();
		  
			if(res > 0) {
				
				this.dao.updatecenter(board_num);
				out.println("<script>");
				out.println("alert('작성완료')");
				out.println("location.href='admin_center.do'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('작성실패')");
				out.println("history.back()");
				out.println("</script>");
			}		 
			
	  }
	  
	  // 고객센터 답변 페이지
	  @RequestMapping("adminboardgreen_cont.do")
	  public String greenbutton(@RequestParam("num") int board_num,Model model) {
		  
		  FinalMemberDTO dto = this.dao.greenbtn(board_num);
		  FinalMemberDTO dto1 = this.dao.centerwrite(board_num);
		  System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+dto1);
		 
		  model.addAttribute("centerwrite", dto1);
		  model.addAttribute("greenbtn", dto);
		  return "./Admin/Admin_centerGreenBTNCont";
	  }
	  
	  @RequestMapping("admin_after.do")
	  public String  after_Write(Model model,HttpServletRequest request) {
		  	
		  // 페이징 처리 작업
	        int page;    // 현재 페이지 변수

	        if(request.getParameter("page") != null) {

	            page = Integer.parseInt(request.getParameter("page"));

	        }else {

	            // 처음으로 게시물 전체 목록을 클릭한 경우.
	            page = 1;
	        }

	        // DB상의 전체 게시물의 수를 확인하는 메서드 호출.
	        totalRecord = this.dao.afterList();

	        PageDTO dto = new PageDTO(page, this.rowsize, this.totalRecord);
	             
	        List<FinalMemberDTO> list = this.dao.after_writeList(dto);
	        // 페이지에 해당하는 게시물을 가져오는 메서드 호출.

	        model.addAttribute("Paging", dto);				
			model.addAttribute("afterList", list);
			
			System.out.println(">>>>>>>>>"+list);
			
			return"./Admin/Admin_after_write";
	  }
	  
	  @RequestMapping("admin_Write_cont.do")
	  public String writecont(@RequestParam("num")int write_num,Model model) {
		  
		  FinalMemberDTO dto = this.dao.write_cont(write_num);
		  FinalMemberDTO dto1= this.dao.beans_cont(write_num);
		  FinalMemberDTO dto2 =this.dao.member_cont(write_num);
		  
		  model.addAttribute("goback", dto2);
		  model.addAttribute("beans_cont", dto1);
		  model.addAttribute("write_cont", dto);
		 System.out.println(">>>>>>>>>>>>>>>>           "+dto1); 
		  return "./Admin/Admin_write_cont";
	  }
	  
	  @RequestMapping("Admin_write_delete.do")
	  public void write_delete(@RequestParam("num")int write_num,FinalMemberDTO dto,HttpServletResponse response ) throws IOException {
		  
		  int res = this.dao.wirtedelete(write_num); 
		  response.setContentType("text/html; enctype=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			if(res > 0) {
				out.println("<script>");
				out.println("alert('삭제 완료')");
				out.println("location.href='admin_after.do'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('삭제 실패..')");
				out.println("history.back()");
				out.println("</script>");
			}		
	  }
	  
	  
	  
	  
	  
}
