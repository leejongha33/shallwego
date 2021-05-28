<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:if test="${reser.size() == 0 }">
	<div class="rv-right">
		<div class="on rv-on rv-right-content">
			<h1>예약된 정보가 없습니다.</h1>
		</div>
	</div>
</c:if>
<div class="rv-right">
	<c:if test="${reser.size() != 0 }">
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

					<!-- 내용 -->
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


					<%-- <!-- 리뷰 -->
					<ul class="rv-onn rv-comple-rv review-wrap">


						<!-- review_title -->
						<li class="rev-title">
							<h3 class="sub-title">제목</h3> <input class="text01-5 review_val"
							type="text" id="review_title" placeholder="제목을 입력해주세요.">
							<span class="msg" id="titleMsg"></span>
						</li>

						<!-- coustomer_idx -->
						<li class="rev-date">
							<h3 class="sub-title">작성인</h3> <input type="hidden"
							id="customer_idx" value="${login.user_idx } "> <span
							class="gray-f rev-span" id="coustomer_idx">${login.username }</span>
						</li>

						<!-- kindness -->
						<li class="rev-avg-wrap">
							<div class="rev-avg">
								<p>친절도</p>
								<div id="kind-star">
									<span class="star"><i class="fas fa-star"></i></span> <span
										class="star"><i class="fas fa-star"></i></span> <span
										class="star"><i class="fas fa-star"></i></span> <span
										class="star"><i class="fas fa-star"></i></span> <span
										class="star"><i class="fas fa-star"></i></span>
								</div>
							</div> <!-- transportation -->
							<div class="rev-avg">
								<p>편의성</p>
								<div id="trans-star">
									<span class="star"><i class="fas fa-star"></i></span> <span
										class="star"><i class="fas fa-star"></i></span> <span
										class="star"><i class="fas fa-star"></i></span> <span
										class="star"><i class="fas fa-star"></i></span> <span
										class="star"><i class="fas fa-star"></i></span>
								</div>
							</div> <!-- cleanliness -->
							<div class="rev-avg">
								<p>청결도</p>
								<div id="clean-star">
									<span class="star"><i class="fas fa-star"></i></span> <span
										class="star"><i class="fas fa-star"></i></span> <span
										class="star"><i class="fas fa-star"></i></span> <span
										class="star"><i class="fas fa-star"></i></span> <span
										class="star"><i class="fas fa-star"></i></span>
								</div>
							</div> <span class="msg" id="ratingMsg"></span>
						</li>

						<!-- review_content -->
						<li class="rev-write-wrap">
							<h3 class="sub-title">내용</h3> <textarea class="text01 review_val"
								id="review_content"></textarea> <span class="msg"
							id="contentMsg"></span>
						</li>

						<!-- 작성완료 버튼  -->
						<li><input class="btn02 pink-b" type="submit"
							id="rv-write-btn" value="작성완료"></li>
					</ul> --%>

				</div>
				</c:if>
		</c:forEach>
		</c:if>
		<script>

const cpath = '${cpath}';


// 리뷰작성 버튼
/* $("#rv-btn").click(function() {
	$(".rv-comple-rv").show();
}); */

  $(".rv-btn").each(function(index){
	$(this).attr("data-index", index);
}).click(function() {
	console.log("data-index");
	
	var i = $(this).attr("data-index");
	console.log(i);
	$(".rv-comple-rv").removeClass();
	$(".rv-comple-rv").eq(i).addClass("onn");	// 리뷰작성 컨텐츠 
});  



/* 별점 */
	const kindStar = document.getElementById('kind-star').querySelectorAll('span');
	const transStar = document.getElementById('trans-star').querySelectorAll('span');
	const cleanStar = document.getElementById('clean-star').querySelectorAll('span');
	
	var kindval = 0;
	var transval = 0;
	var cleanval = 0;
	
	
	kindStar.forEach((element, index) => {
	    element.onclick = (event) => {
	        for(let i = 0; i < kindStar.length; i++) {			
	        	console.log('aaa');
	            kindStar[i].style.color = (i >= index+1) ? '#d1d1d1' : '#ffc0c0';
	        	kindval = index+1;
	        }
	    }

	});
	transStar.forEach((element, index) => {
		element.onclick = (event) => {
		     for(let i = 0; i < transStar.length; i++) {
		    	 transStar[i].style.color = (i >= index+1) ? '#d1d1d1' : '#ffc0c0';
		    	 transval = index+1;
		     }
		  }

	});
	cleanStar.forEach((element, index) => {
		element.onclick = (event) => {
			    for(let i = 0; i < cleanStar.length; i++) {
			    	cleanStar[i].style.color = (i >= index+1) ? '#d1d1d1' : '#ffc0c0';
			    	cleanval = index+1;
			    }
			 }

	});




   $("#rv-write-btn").click(function(){
      
      const review_title = $("#review_title").val();
      const review_content = $("#review_content").val();
      
      
      if(review_title == null){
         $(".titleMsg").text("제목을 입력해주세요.");
         focus();
      }else if(review_content == null) {
         $(".contentMsg").text("내용을 작성해주세요.");
         focus();
      } else{
         $.ajax({
            
            url : cpath + '/reservation/writeReview',
            method : 'POST',
            data : {
               accomm_idx : $('#accomm_idx').val(),
               room_idx: $("#room_idx").val(),
               customer_idx : $("#customer_idx").val(),
               review_title : $("#review_title").val(),
               kindness : kindval,
               cleanliness : cleanval,
               transportation : transval,
               review_content : $("#review_content").val()
            },
            dataType : 'text',
            success : function(returnValue){
               alert(returnValue);
               $(".rv-comple-rv").hide();
            },
            
            
         });
      }
      
      
      
   });
</script>