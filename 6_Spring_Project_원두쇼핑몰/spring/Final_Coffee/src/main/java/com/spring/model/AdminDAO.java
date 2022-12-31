package com.spring.model;

import java.util.List;
import java.util.Map;

public interface AdminDAO {

	
	FinalAdminDTO admin_check(FinalAdminDTO dto);

	List<FinalMemberDTO> memberList(PageDTO dto);

	int memberList();

	FinalMemberDTO admin_cont(int num);

	List<CoffeeBeanDTO> getBeanList(PageDTO dto);

	int beansList();

	List<CoffeeOrderDTO> admin_order(int num);

	List<FinalMemberDTO> boardList(PageDTO dto);

	String getBeansCount();
	String getMemberCount();

	int boardList();

	String starAvg1(int beans_num);
	
	CoffeeBeanDTO getBeanContent(int no);
	
	int adminBeanModify(CoffeeBeanDTO dto);

	
	int adminBeanDelete(int beans_num);

	
	List<CoffeeBeanDTO> searchBeanList(String keyword);
	List<FinalMemberDTO> searchMemberList(String keyword);
	
	int searchCount(String keyword);
	int searchCountMem(String keyword);
	
	int adminBeanInsert(Map<String, Object> map);


	FinalMemberDTO centerwrite(int board_num);


	int admincenterOk(Map<String, Object> map);

	int updatecenter(int board_num);

	FinalMemberDTO greenbtn(int board_num);

	int afterList();

	List<FinalMemberDTO> after_writeList(PageDTO dto);

	FinalMemberDTO write_cont(int write_num);

	FinalMemberDTO beans_cont(int write_num);

	FinalMemberDTO member_cont(int write_num);

	int wirtedelete(int write_num);

	FinalMemberDTO admin_test(int num);

	int getbuyNumber(int beans_num);


}
