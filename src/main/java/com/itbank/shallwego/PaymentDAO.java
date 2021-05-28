package com.itbank.shallwego;

import java.util.List;

public interface PaymentDAO {

	int booking(PaymentDTO pay_dto);

	List<PaymentDTO> selectReservation(int user_idx);

	PaymentDTO selectPay(int room_idx);

	int cancelBooking(PaymentDTO pay_dto);

}
