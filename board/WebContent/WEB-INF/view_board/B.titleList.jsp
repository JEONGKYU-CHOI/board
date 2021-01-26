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

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>Insert title here</title>
<style>

body {

padding-top: 70px;

padding-bottom: 30px;

}
</style>
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
					<c:when test="${empty TList}">
						<tr><td colspan="5" align="center">게시글이 없습니다.</td></tr>
					</c:when>
					<c:when test="${!empty TList}">
			<c:forEach var="board" items="${TList}">
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
		<a href="/board/listPage" style="float: right;">게시판 가기</a>
		</div>
	</article>
</body>
</html>