package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.shallwego.PaymentDAO;
import com.itbank.shallwego.PaymentDTO;

@Service
public class PaymentService {

	@Autowired
	private PaymentDAO dao;
	
	public int booking(PaymentDTO pay_dto) {
		return dao.booking(pay_dto);
	}

	public List<PaymentDTO> selectReservation(int user_idx) {
		return dao.selectReservation(user_idx);
	}

	public PaymentDTO selectPay(int room_idx) {
		return dao.selectPay(room_idx);
	}

	public int cancelBooking(PaymentDTO pay_dto) {
		return dao.cancelBooking(pay_dto);
	}

}
