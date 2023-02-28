<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import = "java.sql.*" %>

<%-- <%@  --%>
<%-- 	Date nowTime = new Date(); --%>
<%-- 	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss"); --%>
<%--  %> --%>

<!DOCTYPE html>
<html>

<!-- head include -->
<jsp:include page="./common/head.jsp"/>

<!-- css include -->
<link rel="stylesheet" href="./css/userInfo.css">

<body>

<!-- header include -->
<jsp:include page="./common/header.jsp"/>


<% 

try{
	
	String jdbcUrl="jdbc:mysql://localhost:3306/jsp_project?characterEncoding=UTF-8&serverTimezone=UTC";
	String dbId="root";
	String dbPass="root";
 
 	Class.forName("com.mysql.cj.jdbc.Driver");
 	
 	Connection conn=null;
   	PreparedStatement pstmt=null;
   	ResultSet res = null;
   	String str="";
   	
   	conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
   	
   	String email = request.getParameter("user");
   	System.out.println("----------userInfo-----------");
   	System.out.println(email);
   	System.out.println("-----------------------------");
   	
   	//db1
   	String sql = ("select * from member where email = ?");
   	
   	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, email);
	
	res = pstmt.executeQuery();
	res.next();
	
	String nickname = res.getString("nickname");
	String passwd = res.getString("passwd");
%>
	
<!-- main container -->
<main>
	<div class="join_form">
		<form name="join" class="join_box" action="./userinfoeditProcess.jsp?user=<%= email %>" method="post">
		<div class="form-group">
			<div class="form_index">
	       		<h4>회원정보 수정</h4><br>
	       		<hr/>
				email의 경우 변경이 불가합니다.<br>
				변경전 본인의 암호가 정확한지 확인하세요.<br>
				회원삭제는 되돌릴 수 없습니다.<br>
			</div>
			<hr>
		  </div>
		  <div class="form-group">
		    <label for="nickname_label">Nickname</label>
		    <input type="text" name="nickname" class="form-control" id="nickname_label" value="<%= nickname %>">
		    <small id="nicknameHelp" class="form-text text-muted">사용자들에게 보여질 이름입니다.</small>
		  </div>
		  <div class="form-group">
		    <label for="email_label">Email address</label>
		    <input type="email" name="email" class="form-control" id="email_label" aria-describedby="emailHelp" value="<%= email %>" readonly="readonly">
		    <small id="emailHelp" class="form-text text-muted">비밀번호 분실시 email로 재설정 이메일이 발송됩니다.</small>
		  </div>
		  <div class="form-group">
		    <label for="password_label">Password</label>
		    <input type="password" name="passwd" class="form-control" id="password_label" value="<%= passwd %>">
		    <small id="passwordeHelp" class="form-text text-muted">올바르게 입력했는지 확인해주세요.</small>
		  </div>
		  <div class="form-group">
		    <label for="repassword_label">RePassword</label>
		    <input type="password" name="re_passwd" class="form-control" id="repassword_label" value="<%= passwd %>">
		    <small id="repasswordHelp" class="form-text text-muted">다시 한번 입력해 주세요.</small>
		  </div>
		  <div class="submit_btn">
	  		<input type="submit" class="btn btn-primary" value="회원정보 수정"></input>
			</div>
		</form>
	</div>
</main>
	
<%
}catch(Exception e){
	
}

%>

<!-- footer include -->
<jsp:include page="./common/footer.jsp"/>

<!-- bootstrap js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
</body>
</html>