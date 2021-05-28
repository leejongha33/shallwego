package com.itbank.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.service.ReviewService;
import com.itbank.shallwego.ReviewDTO;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService rs;
	
	
	// 리뷰 등록 
//	@PostMapping("/memberInfo")
//	public String review(ReviewDTO dto) {
//		ModelAndView mav = new ModelAndView("member/memberInfo");
//		int row = rs.insertReview(dto);
//		return "member/memberInfo";
//	}
	
	@PostMapping(value = "/reservation/writeReview", produces = "application/text;charset=utf8")
	@ResponseBody
	public String review(ReviewDTO dto) {
		System.out.println("dto 1 : " + dto.getAccomm_idx());
		System.out.println("dto 2 : " + dto.getRoom_idx());
		boolean regist = rs.insertReview(dto);
		return regist ? "리뷰가 등록되었습니다." : "리뷰 등록에 실패하셨습니다.";
	}
	
}
