<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>

<!-- head include -->
<jsp:include page="./common/head.jsp"/>

<!-- css include -->
<link rel="stylesheet" href="./css/challenge_create.css">

<!-- summernote include -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="./summernote/summernote-lite.js"></script>
<script src="./summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="./summernote/summernote-lite.css">
<!--  -->

<body>

<!-- header include -->
<jsp:include page="./common/header.jsp"/>

<!-- main container -->
<main>
	<form name="challenge_create" class="create_box" action="./challengecreateProcess.jsp" method="post" enctype="multipart/form-data">
		<div class="challenge_title">
			<input type="text" name="title" class="form-control mt-4 mb-2"
			placeholder="제목을 입력해주세요." required>
			<div class="category">
			<hr>
			<label for="category">Category : </label>
		    <input type="radio" id="category" name="category" value="pwnable"> Pwnable
		    <input type="radio" id="category" name="category" value="web_hacking"> Web Hacking
		    <input type="radio" id="category" name="category" value="system_hacking"> System Hacking
		    <input type="text" name="point" class="form-control mt-4 mb-2"
			placeholder="point를 입력해주세요." required>
		</div>
		</div>
		
		<div class="container">
			<hr>
				<input type="file" name="uploadFile">
	  			<textarea class="summernote" name="content" id="content"></textarea>
	  		<hr>
		</div>
		
		<div class="test_case">
			<input type="text" name="flag" class="form-control mt-4 mb-2"
			placeholder="flag">
			<input type="submit" class="btn btn-success mb-3" onclick="submit" value="제출하기" style="margin-top: 2rem;
	float: right;">
		</div>
	</form>
</main>

<!-- summernote 설정 -->
<script>
function submit(){
	challenge_create.submit();
}
</script>
<script>
	$('.summernote').summernote({
		  height: 500,
		  minHeight: 500,
		  maxHeight: 500,
		  lang: "ko-KR"
		});
</script>

<!-- footer include -->
<jsp:include page="./common/footer.jsp"/>

<!-- bootstrap js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
</body>
</html>