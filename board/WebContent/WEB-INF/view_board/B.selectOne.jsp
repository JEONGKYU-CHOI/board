<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<title>Insert title here</title>
<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<script type="text/javascript">
window.addEventListener("DOMContentLoaded",function(){
	var deleteList = document.querySelectorAll("a[href^=delete]");
	deleteList.forEach(function(element){
		element.onclick = function(){
			if(!confirm("정말 삭제 하실겁니까?")){
				return false;
			}
		}
	});
	})
</script>
<style>

body {

padding-top: 70px;

padding-bottom: 30px;

}
</style>
</head>
<body style="text-align: center; margin-left: 20%; margin-right: 20%;">

	<h2>조회된 게시글 내용</h2>
	<section class="rounded-top" style="background-color: lightgray; width: auto; height: auto; padding: 20px;">
	<div style="width: auto%; height: auto; padding-bottom: 50px;" >
		<div style="text-align: center;">${board.boardTitle}</div>
		
		<div>
		<div style="float: left;">${board.boardName}</div>
		
		<div style="float: right;"><fmt:formatDate value="${board.wdate}" pattern="yyyy-MM-dd HH:mm"/> / ${board.boardView }</div>
		</div>
		<hr style="background-color: white; height: 5px; margin: 0px;">
	</div>
	
	<div style="width: auto%; height: auto;">
		${board.boardContent} <br>
		${board.boardImg }
	</div>
		<hr style="background-color: white; height: 5px; margin: 0px;">	
		<span style="height: 10px; font-size: medium; float: left">
			<a href="/board/check?id=${board.id }">수정</a>
			<a> / </a>
			<a href="/board/delete?id=${board.id }">삭제</a>
			<a> / </a>
			<a href="/board/listPage">게시판 가기</a>
		</span>
		
	</section>
<!-- 	<article>
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
			
			
			<tbody>
			
			<tr>
				<td>${board.id}</td>
				 
				<td>${board.boardTitle}</td>
					
				<td>${board.boardContent}</td>
				
				<td>${board.boardName}</td>
				
				<td>${board.wdate}</td>
				
				<td>${board.udate}</td>	
			</tr>
		</tbody>
		
		</table>
				
	
			<a href="/board/check?id=${board.id }">수정</a>
			<a href="/board/delete?id=${board.id }">삭제</a>
			<a href="/board/listPage">게시판 가기</a>
		<hr> -->
			<hr>
			
			<h2>댓글 리스트</h2>
				<section class="rounded-0" style="background-color: lightgray; width: auto; height: auto; padding: 20px;">
				<c:forEach var="comment" items="${cList}">
					<div style="height: auto; text-align: center;">
					${comment.commentContent}
					</div>
					<div style="height: 20px;">
						<div style="position: static; text-align:right; font-size: small; float: right">ID : ${comment.commentName} / DATE : 
						<fmt:formatDate value="${comment.wdate}" pattern="yyyy-MM-dd HH:mm" />
						</div>
						
				<span style="height: 10px; font-size: small; float: left">
					<a href="/board/check1?id=${comment.id }">수정</a>
					<a> / </a>
					<a href="/board/delete1?id=${comment.id }">삭제</a>
				</span>
					</div>
				<hr style="background-color: white; height: 5px; margin: 0px;">
				</c:forEach>
				</section>
				
<!-- 			<table id="board" border="1">
			<thead>
				<tr>
					<th>댓글 번호</th>
				
				 	<th>게시글 번호</th>
				
				 	<th>댓글 제목</th>
				
				 	<th>댓글 내용</th>
				
				 	<th>댓글 작성자</th>
				
				 	<th>댓글 작성일시</th>
				
				 	<th>댓글 수정일시</th>
				</tr>
			</thead>
			
			<tbody>
			<tr>
				<td>${comment.id}</td>
			
				<td>${comment.boardId}</td>
				 
				<td>${comment.commentTitle}</td>
					
				<td>${comment.commentContent}</td>
				
				<td>${comment.commentName}</td>
				
				<td>
				<fmt:formatDate value="${comment.wdate}" pattern="yyyy-MM-dd HH:mm" />
				</td>
				
				<td>
				<fmt:formatDate value="${comment.udate}" pattern="yyyy-MM-dd HH:mm" />
				</td>	
				
			</tr>	
				
			</tbody>
			</table>
	 -->	

</body>
		<hr>
	<footer>	

		<h2 style="text-align: center;">댓글 작성</h2><br>
		<section class="rounded-bottom" style="background-color: lightgray; width: auto; height: auto; padding: 20px;">
	    <form action="/board/insertcomment" method="post">
		<div style="width: auto; margin: 10px;">
  	<div style="width: 25%; float: reft; text-align: reft;">
  	<input type="hidden" name="boardId" value="${board.id}">
  	NAME : <input id="name" type="text" name="commentName"> <br> <br>
  	 	
 	PWord : <input type="password" name="commentPassword"> <br> <br>
 	</div>
 		<span style="height: 10px; font-size: small; float: left"></span>
 		<div>
  <textarea style="width: 100%; height: auto; float: reft; text-align: reft;"  id="content" rows="5" cols="50" name="commentContent" placeholder="게시글 또는 댓글로 문의 부탁드립니다. 감사합니다.♥"></textarea>
				</div>
			</div>
  	<input type="submit" style="float: right;" value="작성">
		</form>
	</section>


	

	</footer>
</html>