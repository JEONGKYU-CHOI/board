<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateComment</title>
</head>
<body>

		<h2 style="text-align: center;">댓글 수정</h2><br><br><br>	
		<div style="width: 80%; margin: auto;">
	  <form action="/board/update1" method="post">
  	댓글 번호 : <input type="number" name="id" value="${comment.id }" readonly="readonly"> <br>
  	댓글 작성자 : <input id="name" type="text" name="commentName" style="width: 30%;" value="${comment.commentName}"> <br>
 	댓글 제목 : <input id="title" type="text" name="commentTitle" style="width: 50%;" value="${comment.commentTitle}"> <br> 
 	<textarea style="width: 1000px; height: 200px"  id="content" rows="5" cols="50" name="commentContent" placeholder="content">${comment.commentContent}</textarea> <br>
  	<input type="submit" style="float: right;" value="작성">
</form>
		</div>
	
	
</body>
</html>