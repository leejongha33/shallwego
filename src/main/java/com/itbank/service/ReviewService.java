package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.shallwego.ReviewDAO;
import com.itbank.shallwego.ReviewDTO;

@Service
public class ReviewService {

	@Autowired
	private ReviewDAO dao;

	public boolean insertReview(ReviewDTO dto) {
		int dbRv = dao.insertReview(dto);
		return dbRv != 0;
	}
	
}
