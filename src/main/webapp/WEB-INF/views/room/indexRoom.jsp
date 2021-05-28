<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../index_source.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="${cpath }/resources/css/search.css" rel="stylesheet" type="text/css">
<link href="${cpath }/resources/css/room/index-room.css" rel="stylesheet" type="text/css">

<script src="${cpath }/resources/js/room/index-room.js"></script>

<%@ include file="../header.jsp"%>

<div class="wrap-in back-white">

	<section class="section">
		<div class="section-in-room">

			<section class="sec-room1">
				<div class="section-in2">


					<!-- search box -->
					<form method="post" action="${cpath }/room/search">
					<ul class="search-box-wrap">
						<li class="search-box"><span class="search-icon glasses"></span>
							<p>
								<input type="text" id="destination" name="destination" value="${map.destination }" placeholder="목적지 또는 호텔명" />
							</p></li>


						<li class="search-box"><span class="search-icon calendar">
						</span> <span class="check">
								<input type="text" id="demo-3_1" name="start" value="${map.start }" class="form-control form-control-sm" style="width:100px; height:40px; float: left; margin-top: 10px; border: 0; text-align: center;" placeholder="check-in"/>
						</span> <span class="check">
                                <h3 style="width: 30px; padding: 10px 10px; float:left;margin: 5px 0 0 0;font-size: 20px;"><span id="nights"></span></h3>
						</span> <span class="check">
                                <input type="text" id="demo-3_2" name="end" value="${map.end }" class="form-control form-control-sm" style="width:100px; height:40px; float: left; margin-top: 10px; border: 0; text-align: center;" placeholder="check-out"/>
						</span></li>

						<li class="search-box"><span class="search-icon people">
						</span> <span class="check2">
								<p>인원</p>
								<h3 style="font-size: 20px;">인원
	                           		<input type="number" name="person" 
	                           			id="person" value="${map.person }" 
	                           				min="1" max="20" 
	                           			style="border: 0px;
	                           					width: 40px;
	                           					font-size: 20px;">명
	                           </h3>
						</span></li>

						<li class="search-box pink">
							<button class="search-btn pink">
								<span class="search-icon glasses2"></span>
							</button>
						</li>

					</ul>
					</form>
				</div>
			</section>

			<div class="filter-top">
				<ul class="img_wrap">
					<li><img src="${cpath }/resources/img/index-room/slide1.png" /></li>
					<li><img src="${cpath }/resources/img/index-room/slide2.png" /></li>
					<li><img src="${cpath }/resources/img/index-room/slide3.png" /></li>
				</ul>

				<div class="slide-btn">
					<img class="left" src="${cpath }/resources/img/icon/left.png">
					<img class="right"
						src="${cpath }/resources/img/icon/right.png">
				</div>
			</div>

			<div class="filter-left">
				<ul class="ft-choice">
					<li><b>1박요금</b>
						<p class="checks etrans">
							<input id="cb1" type="checkbox" /> <label for="cb1">0 ~
								100,000</label>
						</p>
						<p class="checks etrans">
							<input class="cb1" type="checkbox" /> <label for="cb1">100,000
								~ 200,000</label>
						</p>
						<p class="checks etrans">
							<input class="cb1" type="checkbox" /> <label for="cb1">200,000
								~ 300,000</label>
						</p>
						<p class="checks etrans">
							<input class="cb1" type="checkbox" /> <label for="cb1">300,000
								~ 400,000</label>
						</p>
						<p class="checks etrans">
							<input class="cb1" type="checkbox" /> <label for="cb1">400,000
								이상</label>
						</p></li>
					<li><b>숙박시설 및 등급</b>
						<p class="checks etrans">
							<label><input class="tf" type="checkbox" value="5"/> 5성급</label>
						</p>
						<p class="checks etrans">
							<label><input class="tf" type="checkbox" value="4" /> 4성급</label>
						</p>
						<p class="checks etrans">
							<label><input class="tf" type="checkbox" value="3" /> 3성급</label>
						</p>
						<p class="checks etrans">
							<label><input class="tf" type="checkbox" value="2" /> 2성급</label>
						</p>
						<p class="checks etrans">
							<label><input class="tf" type="checkbox" value="1" /> 1성급</label>
						</p></li>
					<li><b>평점</b>
						<p class="checks etrans yellow-f">
							<input class="cb1" type="checkbox" /> <label for="cb1">★★★★★</label>
						</p>
						<p class="checks etrans yellow-f">
							<input class="cb1" type="checkbox" /> <label for="cb1">★★★★☆</label>
						</p>
						<p class="checks etrans yellow-f">
							<input class="cb1" type="checkbox" /> <label for="cb1">★★★☆☆</label>
						</p>
						<p class="checks etrans yellow-f">
							<input class="cb1" type="checkbox" /> <label for="cb1">★★☆☆☆</label>
						</p>
						<p class="checks etrans yellow-f">
							<input class="cb1" type="checkbox" /> <label for="cb1">★☆☆☆☆</label>
						</p></li>
				</ul>
			</div>

			<div class="filter-right">
				<div class="ft-header">
					<h2>서울</h2>
					<ul class="ft-btn-wrap">
						<li class="on-pink">
									<h3>전체</h3>
									<p>All</p>
							</li>
						<li>
									<h3>호텔</h3>
									<p>Hotel</p>
							</li>
						<li>
									<h3>모텔</h3>
									<p>Motel</p>
							</li>
						<li>
									<h3>펜션</h3>
									<p>Pension</p>
							</li>
						<li>
									<h3>게스트하우스</h3>
									<p>Guest House</p>
							</li>
					</ul>
				</div>

				<!-- 객실타입 -->
				
				<div class="ft-right-center">
					<c:forEach var="item" items="${list }">
						<ul class="lodging">
							<li>
								<a href="${cpath }/room/room_detail/${item.accomm_idx }">
									<%-- <c:if test="${item.accomm_type == 1 }">
										<img src="http://192.168.0.184/shallwego/${item.accomm_type }/${item.tier_number }/${item.accomm_name }" />
									</c:if>
									<c:if test="${item.accomm_type != 1 }">
										<img src="http://192.168.0.184/shallwego/${item.accomm_type }/${item.accomm_name }" />
									</c:if> --%>
									
									<img src="${cpath }/resources/img/rooom1.jpg"/>
								</a>
							</li>
							<li>
								<h2>${item.accomm_name}</h2>
								<p>
									<span class=" yellow-f">★★★★★</span> 4.4 (5,403)
								</p>
							</li>
							<c:if test="${item.accomm_type != 2 }">
								<li class="lodging-price hotelPrice"><span>${item.minprice2 }</span>&nbsp;원</li>
							</c:if>
							<c:if test="${item.accomm_type == 2 }">
								<li class="lodging-price">대실 : ${item.room_hire_time }&nbsp;시간 <span>${item.minprice1 }</span>&nbsp;원
								</li>
								<li class="lodging-price">숙박 : ${item.accomm_checkin }부터 <span>${item.minprice2 }</span>&nbsp;원
								</li>
							</c:if>
 							<li class="lodging-btn"><a class="btn01 pink reserBtn"
								href="${cpath }/room/room_detail/${item.accomm_idx }">예약</a></li>
							<li class="address">${item.accomm_address }</li>
						</ul>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>

</div>

<script>

// .ft-btn-wrap li : All / 호텔 / 모텔 ...
// .on-pink : 분홍 불 
$(".ft-btn-wrap li").each(function(index){
   $(this).attr("data-index", index);
}).click(function(){
   
   var i = $(this).attr("data-index");

   $(".ft-btn-wrap li").removeClass("on-pink");
   $(".ft-btn-wrap li").eq(i).addClass("on-pink");
    
});   
</script>

<script>
      const filterBox = Array.from(document.querySelectorAll('.tf'));      // 성급 필터 체크박스
      const accomms = document.querySelectorAll('.lodging');   // 전체 숙소목록
      
      const filterHandler = function(event) {
         const checkedBoxs = filterBox.filter(box => box.checked == true);
         
         accomms.forEach(div => {
            console.log(div.childNodes);
            
            if(checkedBoxs.length == 0 || checkedBoxs.length == 5) {
                    div.style.display = 'block';
                    return;
                }
            
                div.style.display = 'none';
                
                checkedBoxs.forEach(box => {
                    if(div.firstElementChild.value == box.value) {
                        div.style.display = 'block';
                    }
                });
         })
      };
      
      filterBox.forEach(box => onclick = filterHandler);
   </script>

<script async src="https://buttons.github.io/buttons.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="https://unpkg.com/lightpick@latest/lightpick.js"></script>
<script src="${cpath }/resources/js/demo.js"></script>

<%@ include file="../footer.jsp"%>


</body>
</html>