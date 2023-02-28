<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>

<!-- head include -->
<jsp:include page="./common/head.jsp"/>

<!-- css include -->
<link rel="stylesheet" href="./css/index.css">

<!-- bootstrap include -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<body>

<!-- header include -->
<jsp:include page="./common/header.jsp"/>

<!-- main container -->
<main>
	<div class="main_img_container">
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		 <ol class="carousel-indicators">
		   <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		   <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		   <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		 </ol>
		 <div class="carousel-inner">
		   <div class="carousel-item active">
		     <img src="./img/img2.jpg" class="d-block w-100" alt="..." style="height:35rem">
		   </div>
		   <div class="carousel-item">
		     <img src="./img/img3.jpg" class="d-block w-100" alt="..." style="height:35rem">
		   </div>
		   <div class="carousel-item">
		     <img src="./img/img4.jpg" class="d-block w-100" alt="..." style="height:35rem">
		   </div>
		 </div>
		 <button class="carousel-control-prev" type="button" data-target="#carouselExampleIndicators" data-slide="prev">
		   <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		   <span class="sr-only">Previous</span>
		 </button>
		 <button class="carousel-control-next" type="button" data-target="#carouselExampleIndicators" data-slide="next">
		   <span class="carousel-control-next-icon" aria-hidden="true"></span>
		   <span class="sr-only">Next</span>
		 </button>
		</div>
	</div>
	
	<div class="main_content_container">
		<h3 class="main_content_title">CJU CTF_101</h3>
		<hr>
			<div class="main_content">
				청주대학교 CTF_101에 오신것을 환영합니다.<br>
				본인의 Hacking 실력을 측정해 보세요!<br>
				"No hacking, No life"
			</div>
	</div>
</main>

<!-- footer include -->
<jsp:include page="./common/footer.jsp"/>

<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>