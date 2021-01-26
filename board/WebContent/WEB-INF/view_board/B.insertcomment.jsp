<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<h2 style="text-align: center;">게시글 작성</h2><br><br><br>

 	<div style="width: 80%; margin: auto;">

  <form action="/board/insertcomment" method="post">
  	게시글 번호 : <input type="number" name="boardId" value="${board.id} " readonly="readonly">
 	댓글 제목 : <input id="title" type="text" name="boardTitle" style="width: 50%;"> 
  	댓글 내용 : <input id="name" type="text" name="boardName" style="width: 30%;"> <br>
  <textarea id="summernote" name="boardContent"></textarea>
  	<input type="submit" style="float: right;" value="작성">
</form>

	</div>
	



</body>
</html>