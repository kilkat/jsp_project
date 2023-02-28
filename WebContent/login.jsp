<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>

<!-- head include -->
<jsp:include page="./common/head.jsp"/>

<!-- css include -->
<link rel="stylesheet" href="./css/login.css">

<body>

<!-- header include -->
<jsp:include page="./common/header.jsp"/>


<!-- main container -->
<main>
	<div class="login_form">
		<form name="login" class="login_box" action="./loginProcess.jsp" method="post" name="loginProcess">
		<div class="form-group">
			<div class="form_index">
	       		<h4>로그인</h4><br>
			</div>
			<hr>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail1">Email address</label>
		    <input type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
		    <small id="emailHelp" class="form-text text-muted">로그인 양식에 맞춰 작성해 주세요.</small>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">Password</label>
		    <input type="password" name="passwd" class="form-control" id="password" placeholder="Password">
		  </div>
		  <div class="form-group">
		  	<input type="submit" class="btn btn-primary" value="로그인" onclick="loginValidation()">
	  		</div>
		</form>
	</div>
</main>

<!-- footer include -->
<jsp:include page="./common/footer.jsp"/>

<!-- bootstrap js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
</body>
</html>