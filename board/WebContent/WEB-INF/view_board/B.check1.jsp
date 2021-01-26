<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="text-align: center; margin: 30%; margin-top: 10%;">
	<form class="form-inline" action="/board/update1" method="get">
<div class="form-group mb-2">
	댓글 NO : <input type="text" name="id" value="${comment.id }">
</div>
<div class="form-group mx-sm-3 mb-2">	
	댓글 PW : <input type="password" name="commentPassword" >
</div>	
<button type="submit" class="btn btn-primary mb-2" style="float: right;">완료</button>
	</form>
<div>
<a href="/board/listPage">리스트로 가기</a>
</div>
</body>
</html>           