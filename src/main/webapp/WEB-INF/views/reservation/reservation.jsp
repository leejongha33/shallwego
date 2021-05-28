<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../source.jsp"%>
<link href="${cpath }/resources/css/reservation/reservation.css"
	rel="stylesheet" type="text/css">
<link href="${cpath }/resources/css/board/board.css" rel="stylesheet"
	type="text/css">

<script src="${cpath }/resources/js/reservation/reservation.js"></script>
<script src="${cpath }/resources/js/reservation/reserComple.js"></script>
<script src="${cpath }/resources/js/reservation/reserCancel.js"></script>
<script src="${cpath }/resources/js/reservation/reserStaying.js"></script>

<%@ include file="../header.jsp"%>

<div class="wrap-in back-gray">

	<section class="section">
		<div class="section-in2">

			<div class="rv-left">
				<ul>
					<!-- <li class="on-click rv-menu">예약완료</li>
					<li class="rv-menu">취소된 예약</li>
					<li class="rv-menu">투숙 완료</li> -->
 					<li class="${uri == 'reserComple' ? 'on-click' : '' } rv-menu"><a href="${cpath }/reservation/reserComple">예약완료</a></li>
					<li class="${uri == 'reserCancel' ? 'on-click' : '' } rv-menu"><a href="${cpath }/reservation/reserCancel">취소된 예약</a></li>
					<li class="${uri == 'reserStaying' ? 'on-click' : '' } rv-menu"><a href="${cpath }/reservation/reserStaying">투숙 완료</a></li> 
				</ul>
			</div>


			<div class="rv-right">
			
 			<c:if test="${uri == 'reserComple' }">
				<%@ include file="reserComple.jsp"%>
			</c:if>
			<c:if test="${uri == 'reserCancel' }">
				<%@ include file="reserCancel.jsp"%>
			</c:if>
			<c:if test="${uri == 'reserStaying' }">
				<%@ include file="reserStaying.jsp"%>
			</c:if> 
			
<%-- 			<%@ include file="reserComple.jsp" %>
			<%@ include file="reserCancel.jsp" %>
			<%@ include file="reserStaying.jsp" %> --%>
			
			</div>
		</div>
	</section>

</div>

<%@ include file="../footer.jsp"%>

<script>
const cpath = ${cpath};
</script>


</body>
</html>