<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteBoard</title>

</head>
<body style="text-align: center; margin: 30%; margin-top: 10%;">
	<form class="form-inline" action="/board/delete" method="post">
<div class="form-group mb-2">
	게시글 NO : <input class="form-control-plaintext" type="text" name="id" value="${board.id }" readonly="readonly">
</div>	
<div class="form-group mx-sm-3 mb-2">
	게시글 PW : <input type="password" name="boardPassword" >
</div>
<button type="submit" class="btn btn-primary mb-2" style="float: right;">완료</button>
	</form>
<div>
<a href="/board/listPage">리스트로 가기</a>
</div>

</body>
</html>