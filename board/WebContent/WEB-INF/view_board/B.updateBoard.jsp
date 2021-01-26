<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>updateBoard</title>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,  
	        focus: true, 
	        lang : 'ko-KR',
	        callbacks: {
	        	onImageUpload: function(files, editor, welEditable) {
	        	            for (var i = files.length - 1; i >= 0; i--) {
	        	             sendFile(files[i], this);
	        	            }
	        	        }
	        	}
	  });
	});
function sendFile(file, el) {
	var form_data = new FormData();
	       form_data.append('file', file);
	       $.ajax({
	         data: form_data,
	         type: "POST",
	         url: './profileImage.mpf',
	         cache: false,
	         contentType: false,
	         enctype: 'multipart/form-data',
	         processData: false,
	         success: function(img_name) {
	           $(el).summernote('editor.insertImage', img_name);
	         }
	       });
	    }
</script>



</head>
<body>
  	

	<h2 style="text-align: center;">게시글 수정</h2><br><br><br>

 	<div style="width: 80%; margin: auto;">

  <form action="/board/update" method="post">
  	<input type="hidden" name="id" style="width: 10%;" value="${board.id}" readonly="readonly"> <br>
  	게시글 작성자 : <input type="text" name="boardName" style="width: 30%;" value="${board.boardName}" readonly="readonly"> <br>
 	게시글 제목 : <input type="text" name="boardTitle" style="width: 50%;" value="${board.boardTitle}">
  	
	<textarea id="summernote" name="boardContent">${board.boardContent}</textarea>
  	<input type="submit" style="float: right;" value="수정">
</form>

	</div>       
</body>
</html>