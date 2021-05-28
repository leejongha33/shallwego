package com.itbank.shallwego;

import java.util.HashMap;
import java.util.List;

public interface MemberDAO {

	String selectUserid(String userid);

	int insertMember(MemberDTO dto);

	MemberDTO selectMember(MemberDTO user);

	String selectEmail(String email);

	int updatePw(MemberDTO dto);

	int updateCoupon(HashMap<String, String> map);
	
	int selectCouponCount(int user_idx);	

	List<CouponDTO> selectCouponList(int user_idx);

	int updateMember(MemberDTO dto);

	List<TermsDTO> selectTermsList();
}
