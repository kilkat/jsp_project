<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>

<!-- head include -->
<jsp:include page="./common/head.jsp"/>
<script type ="text/javascript" src ="./WEB-INF/js/validation.js"></script>

<!-- css include -->
<link rel="stylesheet" href="./css/join.css">

<body>

<!-- header include -->
<jsp:include page="./common/header.jsp"/>


<!-- main container -->
<main>
	<div class="join_form">
		<form name="join" class="join_box" action="./joinProcess.jsp" method="post">
		<div class="form-group">
			<div class="form_index">
	       		<h4>회원가입</h4><br>
	       		<hr/>
				계정이 이미 있는 경우에는 로그인해주세요.<br>
				가입을 하면 CTF_101 온라인 이용약관, 개인정보취급방침 <br>
				및 개인정보 3자제공에 동의하게 됩니다.<br>
				가입 후 아이디는 변경할 수 없습니다.<br>
			</div>
			<hr>
		  </div>
		  <div class="form-group">
		    <label for="nickname_label">Nickname</label>
		    <input type="text" name="nickname" class="form-control" id="nickname" placeholder="Input Nickname">
		    <small id="nicknameHelp" class="form-text text-muted">사용자들에게 보여질 이름입니다.</small>
		  </div>
		  <div class="form-group">
		    <label for="email_label">Email address</label>
		    <select style="margin-left: 0.5rem" id="emailForm" onchange="emailBox()">
				<option selected>Choose Email</option>
				<option>@naver.com</option>
        		<option>@gmail.com</option>
        		<option>@hanmail.com</option>
        		<option>@cju.ac.kr</option>
			</select>
		    <input type="email" name="email" class="form-control" id="changeInput1" aria-describedby="emailHelp" placeholder="Input Email">
		    <small id="emailHelp" class="form-text text-muted">비밀번호 분실시 email로 재설정 이메일이 발송됩니다.</small>
		  </div>
		  <div class="form-group">
		    <label for="phonenumber_label">Phone number</label>
		    <select style="margin-left: 0.5rem" id="numberForm" onchange="numberBox()">
		    	<option selected>Choose Number</option>
				<option>010</option>
        		<option>011</option>
			</select>
		    <input type="text" name="phoneNumber" class="form-control" id="changeInput2" placeholder="Input Phone number">
		    <small id="repasswordHelp" class="form-text text-muted">전화번호를 - 없이 입력해주세요</small>
		</div>
		  <div class="form-group">
		    <label for="password_label">Password</label>
		    <input type="password" name="passwd" class="form-control" id="password" placeholder="Input Password">
		    <small id="passwordeHelp" class="form-text text-muted">올바르게 입력했는지 확인해주세요.</small>
		  </div>
		  <div class="form-group">
		    <label for="repassword_label">RePassword</label>
		    <input type="password" name="re_passwd" class="form-control" id="repassword" placeholder="Input RePassword">
		    <small id="repasswordHelp" class="form-text text-muted">다시 한번 입력해 주세요.</small>
		  </div>
		  <input type="submit" class="btn btn-primary" value="회원가입" onclick="join()"></input>
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