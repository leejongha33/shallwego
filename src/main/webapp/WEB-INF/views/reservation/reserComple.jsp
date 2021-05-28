<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 예약완료 -->
<div class="left">
	<c:if test="${reser.size() == 0 }">
		<div class="rv-right">
			<c:forEach var="items" items="${reser }">
				<c:if test="${items.refund == 1 }">
					<div class="on rv-on rv-right-content">
						<h1>예약정보가 존재하지 않습니다.</h1>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</c:if>

	<c:if test="${reser.size() != 0 }">
		<div class="rv-right">
			<c:forEach var="items" items="${reser }">
				<c:if test="${items.refund == 0 }">
					<div class="on rv-on rv-right-content">
						<div class="rv-right-header">
							<div class="left">
								<span><b>예약번호</b></span> <span><b class="pink-f">${items.payment_idx }</b></span>
							</div>

							<div class="right">
								<span><b class="gray-f">예약날짜</b></span> <span><b
									class="gray-f"> <fmt:formatDate
											value="${items.payment_date }" pattern="yyyy-MM-dd" />

								</b></span>
							</div>
						</div>

						<ul class="content">
							<li>
								<h1>${items.accomm_name }</h1> <a
								href="${cpath }/reservation/booking/${items.payment_idx }"><span
									class="pink-f" style="margin-left: 20px;">예약확인</span></a>
								<h1>&gt;</h1>
							</li>
							<li><span><b class="gray-f">일정</b></span> <span>${items.start }
							</span> <span>${items.end }</span> <span></span></li>
						</ul>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</c:if>
</div>
