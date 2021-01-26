<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->

<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
crossorigin="anonymous">

<title>Insert title here</title>
<style>

body {

padding-top: 70px;

padding-bottom: 30px;

}
</style>
<script>
	$(document).on('click', '#insertBoard', function(e){
		e.preventDefault();
		location.href = "${pageContext.request.contextPath}/board/insertform";
	});
</script>
</head>
<body style="text-align: center; ">
	<h2>게시판</h2>
	<article>
	<div class="container">
		<div class="table-responsive">
			
		<table class="table table-striped table-sm">
			<colgroup>

			<col style="width:5%;" />

			<col style="width:auto;" />

			<col style="width:15%;" />

			<col style="width:20%;" />

			<col style="width:10%;" />

			</colgroup>
	
			<thead style="text-align: center;">
				<tr>
				 	<th>NO</th>
				
				 	<th>글 제목</th>
				 					
				 	<th>작성자</th>
				
				 	<th>작성일</th>
				
				 	<th>조회수</th>
				</tr>
			</thead>
			
			<tbody style="text-align: center;">
				<c:choose>
					<c:when test="${empty bList}">
						<tr><td colspan="5" align="center">게시글이 없습니다.</td></tr>
					</c:when>
					<c:when test="${!empty bList}">
			<c:forEach var="board" items="${bList}">
			<tr>
				<td><a href="one?id=${board.id }">${board.id}</a></td>
				 
				<td><a href="one?id=${board.id }">${board.boardTitle}</a></td>
				
				<td><a href="one?id=${board.id }">${board.boardName}</a></td>
				
				<td>
				<fmt:formatDate value="${board.wdate}" pattern="yyyy-MM-dd HH:mm" />
				</td>
				
				<td>${board.boardView }</td>	
			</tr>	
				
		</c:forEach>
		</c:when>
		</c:choose>
			</tbody>
			</table>
			</div>
		</div>
	</article>
			

			
			
			<footer>
		<div>
			 <c:if test="${page.prev}">
 				<span>[ <a href="/board/listPage?num=${page.startPageNum - 1}">이전</a> ]</span>
			</c:if>

			<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
  				<span>
  					<c:if test="${select != num}">
   						<a href="/board/listPage?num=${num}">${num}</a>
   					</c:if>	 
   					<c:if test="${select == num}">
   						<b>${num }</b>
   					</c:if>
 				</span>
			</c:forEach>

			<c:if test="${page.next}">
 				<span>[ <a href="/board/listPage?num=${page.endPageNum + 1}">다음</a> ]</span>
			</c:if>
		</div>
		
		
 		  	<!--<c:forEach begin="1" end="${pageNum}" var="num">
    			<span>
     				<a href="/board/listPage?num=${num}">${num}</a>
  				</span>
 			</c:forEach> -->
 		<!-- <c:if test="${member != null }">  -->
		<!-- </c:if>  --> 
 			<div>
 				<button type="button" class="btn btn-sm btn-primary" id="insertBoard">글쓰러 가기</button>
 			</div>
 			<a href="/board/insertform">게시글 쓰러가기</a>
		
		 <div>
 	<form action="/board/title" method="get">
 	
		<input type="text" name="boardTitle" placeholder="제목을 입력하세요">
		
		<input type="submit" value="검색">
	</form>
	
 </div>	
			</footer>

</body>
</html>