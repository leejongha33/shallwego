<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 1:1문의 -->
<div class="inquiry">
	<!-- 1:1문의 버튼 -->
	<ul class="qa-btn-wrap">
		<li class="on-bottom qa-btn">나의 문의내역</li>
		<li class="qa-btn">새 문의 작성</li>
	</ul>

	<!-- 나의 문의내역 -->
	<ul class="on myqa-list qa-con-none qa-content-wrap">

		<!-- 리스트에 값이 있으면 -->
		<c:if test="${!empty inquiryList }">
			<c:forEach var="inquiry" items="${inquiryList }">

				<!-- delete가 0(존재하는 게시글)인 친구만 보이게 한다 -->
			<c:if test="${inquiry.deleted == 0 }">
				<form method="POST" id="myinquiry" action="${cpath }/board/deleteInquiry">

					<input type="hidden" name="inquiry_idx" value="${inquiry.inquiry_idx }" />
							
					<!-- 내 게시글이 있을경우 -->
					<li class="myqa-on qa-write">
						<div class="qa-content">
							<!-- 제목 : 질문있어용 ㅠㅠ-->
							<h3 class="myqa-title-main">${inquiry.inquiry_title }</h3>
							<!-- 작성날짜 : 2021-04-04 -->
							<p class="gray-f">${inquiry.date }</p>
						</div>
					</li>

			<!-- 내 게시글 상세보기 -->
			<div class="myqa-list-sub qa-content-wrap">
				<!-- 나의 문의글 -->
				<div class="qa-content">
					<div class="myqa-title">
						<!-- 내 질문 제목 -->
						<input type="hidden" id="inquiry_idx" name="inquiry_idx"
							value="${inquiry.inquiry_idx }" />
						<h2>${inquiry.inquiry_title }</h2>
					</div>
					<div class="myqa-date">
						<p class="gray-f">
							<span>작성일&nbsp;&nbsp;|</span> <span>${inquiry.date }</span>
							<!-- 작성된 날짜 -->
						</p>
					</div>
					<div class="myqa-content">
						<p>${inquiry.inquiry_content }</p>
						<!-- 작성내용 -->
					</div>
				</div>
					
				<!-- 이전버튼 -->
				<div class="board-left-btn">
					<input type="submit" id="inquiry-del-btn"
						class="btn02 pink-b" value="삭제" />
					<input type="button" id="inquiry_before_btn" class="btn02 pink"
						value="이전" /> 
				</div>

			</form>	
				<div class="qa-comment-wrap">
				<!-- 댓글 출력문 -->
					<!-- 댓글이 있으면 -->
					<c:if test="${!empty reply }">
						<div class="qa-comment">
							<p class="myqa-writer">
								<span id="answer_writer"><b>${reply.answer_writer }</b></span>
								<!-- 작성자 : 관리자 -->
								<span id="answer_date">${reply.date }</span>
								<!-- 작성날짜 : 2021-04-04 -->
							</p>
							<p class="answer_content">${reply.answer_content }</p>
							<!-- 작성내용 : 안녕하세요 고갱님 ^^ -->
						</div>
					</c:if>

					<!-- 댓글이 없으면 -->
					<c:if test="${empty reply }">
						<div class="qa-comment">등록된 댓글이 없습니다.</div>
					</c:if>

					<!-- position 1 = 관리자 -->
					<c:if test="${login.position == 1 }">
						<!-- 댓글 입력문(관리자만 보여야함) -->
						<div class="qa-comment-write">

							<input type="hidden" id="inquiry_idx" name="inquiry_idx"
								value="${login.user_idx }" /> <input type="hidden"
								id="answer_writer" name="answer_writer"
								value="${login.user_idx }" />

							<!-- 댓글 내용 : answer_content -->
							<textarea class="text01" id="answer_content"
								name="answer_content"></textarea>

							<!-- 댓글 버튼 -->
							<button class="btn01 pink" id="qa-comment-btn">작성</button>
						</div>
					</c:if>
				</div>
				
<!-- 			</div> -->

			</c:if>
		</c:forEach>
	</c:if>

		<!-- 내 게시글 리스트에 값이 없으면 -->
		<c:if test="${empty inquiryList }">
			<!-- 내 게시글이 null일 경우 -->
			<li class="qa-write-null">
				<div class="qa-content">
					<a href="#">
						<h1>등록된 1:1 문의가 없습니다.</h1>
						<p class="gray-f">
							떠나볼까는 회원님들의 소중한 의견에 귀기울여</br> 신속하고 정확하게 답변드리도록 하겠습니다.
						</p>
					</a>
				</div>
			</li>
		</c:if>
	</ul>

	<!-- 새 문의 작성 ***************************** -->
	<ul class="qa-con-none qa-content-wrap">
		<li>
			<ul class="qa-content qa-new">
				<li>
					<h3 class="gray-f">떠나볼까? 이용 중 불편하신 점을 문의주시면 최대한 빠른 시일내에 답변
						드리겠습니다.</h3>
				</li>
				<form method="POST" id="new-qa-write">
					<input type="hidden" id="customer_idx" value="${login.user_idx }">
					<li class="qa_category">
						<h3>카테고리 유형</h3> <select id="qa_category" class="text01">

							<option>카테고리 유형</option>
							<c:forEach var="qaCategory" items="${qaCategory}">
								<option value="${qaCategory.IC_IDX}">${qaCategory.IC_NAME }</option>
							</c:forEach>

					</select>
					</li>

					<li class="qa_inquiry">
						<h3>문의 유형</h3> <select id="qa_inquiry" class="text01">

							<option>문의 유형</option>
							<c:forEach var="accommType" items="${accommType}">
								<option value="${accommType.ACCOMM_TYPE_IDX }">${accommType.ACCOMM_TYPE }</option>
							</c:forEach>

					</select>
					</li>

					<li>
						<h3>문의제목</h3>
						<div class="">
							<input class="text01 gray-f" id="myqa_title" type="text"
								placeholder="필수항목 입니다." />
						</div>

					</li>
					<li>
						<h3>문의내용</h3>
						<div class="">
							<input class="text01 gray-f questions" id="myqa-content"
								type="text" placeholder="필수항목 입니다." />
						</div>

					</li>
					<li><input type="submit" id="write-btn" class="btn03 pink"
						value="작성완료" /></li>
				</form>
			</ul>
		</li>
	</ul>
</div>

<script>
	//(1:1문의)작성완료 클릭 
	$("#new-qa-write").submit(function(event) { // 작성하기 버튼을 클릭하면 이벤트 작동 
		event.preventDefault(); // form태그가 돌아가지 않게 이벤트 막는다. 
		console.log('event')
		$.ajax({
			url : cpath + '/board/writeQa',
			method : 'POST',
			data : {
				accomm_type : $('#qa_category').val(), // 카테고리 유형 
				ic_idx : $('#qa_inquiry').val(), // 문의 유형 
				inquiry_title : $('#myqa_title').val(), // 문의제목
				inquiry_content : $('#myqa-content').val(), // 문의내용
				customer_idx : $('#customer_idx').val()
			},
			dataType : 'text',
			success : function(qaRegist) {
				console.log('뿌에에에');
				alert(qaRegist);
				if (qaRegist == '게시글이 등록되었습니다.') {
					location.replace(cpath + '/board/inquiry');
				} else {
					console.log('김하윤 ㅋㅋㅋㅋ');
				}
			}
		});

	});
</script>

<script>
	// 댓글 작성하기 
	$("#qa-comment-btn").click(function() { // 작성하기 버튼을 클릭하면 이벤트 작동 
		console.log('댓글작성 젭알 ㅜ')
		$.ajax({
			url : cpath + '/board/qaReply',
			method : 'POST',
			data : {
				inquiry_idx : $('#inquiry_idx').val(), // 카테고리 유형 
				answer_writer : $('#answer_writer').val(), // 문의 유형 
				answer_content : $('#answer_content').val()
			},
			dataType : 'text',
			success : function(qaRegist) {
				console.log('뿌에에에');
			}
		});

	});
	
	/*	JSON
	$("#qa-comment-btn").click(function() {
	 		console.log(1);
	 		
	 		const inquiry_idx = $('#inquiry_idx').val();
	 		const answer_writer = $('#answer_writer').val();
	 		const answer_content = $('#answer_content').val();
	 		
	 		console.log(inquiry_idx, answer_writer, answer_content);
	 		
	 		const url = cpath + '/board/qaReply';
	 		const opt = {
	 				method: 'POST',
	 				body: JSON.stringify({
	 					inquiry_idx : inquiry_idx, 		// 게시판 인덱스 
	 					answer_writer : answer_writer, 	// 댓글 작성자 
	 					answer_content : answer_content // 댓글 내용
	 				}),
	 				headers:{
	 					'Content-type': 'application/json;charset=utf8'
	 				}
	 		};
	 		fetch(url, opt)
	 		.then(resp => resp.text())
	 		.then(text => {
	 			if (text === '댓글을 입력해주세요.') {
						alert(returnValue);
				}
	 		});

		}); 
	 		 */
	
</script>