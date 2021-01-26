<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 이미지 -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/lang/summernote-ko-KR.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
crossorigin="anonymous">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta charset="UTF-8">
<title>게시판</title>
<script>
	var result = '${result}';
	if(result === 'registerOK'){
		alert('등록이 완료되었습니다.');
	}
</script>

<script>
$(document).ready(function() {
	 $('#summernote').summernote({
		 toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			height: 450,
			width : 1000,
			minHeight: null,
			maxHeight: null,
			focus: true,
			lang: "ko-KR",
			callbacks: {
				onImageUpload : function(files){
					console.log(files);;
					sendFile(files[0],this);
				}
			}
				
		});
	});
function sendFile(file, editor){
	var data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "summernoteImgUpload",
		enctype: 'multipart/form-data',
		contentType : false,
		processData : false,
		success : function(data){
			var url = decodeURIComponent(data);
			console.log(data);
			console.log(url);
			$(editor).summernote('editor.insertImage',url);
		},
		error: function(){
			alert("서머노트 이미지 업로드 실패");
		}
	});
}
</script>
</head>
<body>

	<h2 style="text-align: center;">게시글 작성</h2><br><br><br>

 	<div style="width: 80%; margin: auto;">

  <form action="/board/insert" method="post" enctype="multipart/form-data">
 	게시글 제목 : <input id="title" type="text" name="boardTitle" style="width: 50%;" placeholder="제목"> <br> 
  	NAME : <input id="name" type="text" name="boardName" style="width: 30%;" placeholder="작성자">
  	PW : <input type="password" name="boardPassword" style="width: 30%;" placeholder="비밀번호"> <br>
  	
  <textarea id="summernote" name="boardContent" ></textarea>
  	<input id="check" type="submit" style="float: right;" value="작성">

  </form>

	</div>
	

</body>
</html>