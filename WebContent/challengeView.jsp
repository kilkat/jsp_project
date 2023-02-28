<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.sql.*" %>

<% 
String content = "";
int viewer = 0;
String userEmail = (String) session.getAttribute("user_email");
String email ="";
String nickname ="";
int adminAuth = 0;
int point = 0;
String category = "";
%>


<% System.out.println("userEmail Session : " + userEmail); %>

<!DOCTYPE html>
<html>

<!-- head include -->
<jsp:include page="./common/head.jsp"/>

<!-- css include -->
<link rel="stylesheet" href="./css/challenge_view.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<body>

<!-- header include -->
<jsp:include page="./common/header.jsp"/>

<body>

<!-- main container -->
<main>

<%
try{
				
				String jdbcUrl="jdbc:mysql://localhost:3306/jsp_project?characterEncoding=UTF-8&serverTimezone=UTC";
		 		String dbId="root";
	 			String dbPass="root";
		 	 
		 	 	Class.forName("com.mysql.cj.jdbc.Driver");
		 	 	
		 	 	Connection conn=null;
		 	   	PreparedStatement pstmt=null;
		 	   	PreparedStatement pstmt2=null;
		 	   	PreparedStatement pstmt3=null;
		 	   	PreparedStatement pstmt4=null;
		 	   	ResultSet res = null;
		 	   	ResultSet res2 = null;
		 	   	ResultSet res3 = null;
		 	   	String str="";
		 	   	
		 	   	String param = request.getParameter("num");
		 	   	
		 	  	conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
		 	  	
				
		 	  	//db1
		 	  	String sql = ("select * from board where board_num = ?");
	 			
	 			pstmt = conn.prepareStatement(sql);
	 			pstmt.setString(1, param);
	 			
		 	 	res = pstmt.executeQuery();
		 	 	res.next();
		 	 	viewer = res.getInt("viewer");
		 	 	email = res.getString("email");
		 	 	nickname = res.getString("nickname");
		 	 	category = res.getString("category");
		 	 	point = res.getInt("point");
		 	 	
		 	  	
				
		 	 	//db2
		 	 	String sql2 = ("update board set viewer = ? where board_num = ?");
	 			
	 			pstmt2 = conn.prepareStatement(sql2);
	 			viewer += 1;
	 			
	 			
	 			pstmt2.setInt(1, viewer);
	 			pstmt2.setString(2, param);
	 			
		 	 	pstmt2.executeUpdate();
				
	 			
		 	 	//db3
		 	 	
		 	 	String sql3 = ("select * from board where board_num = ?");
	 			
	 			pstmt3 = conn.prepareStatement(sql3);
	 			pstmt3.setString(1, param);
	 			
		 	 	res2 = pstmt3.executeQuery();
		 	 	
		 	 	
		 	 	while(res2.next()){
			 	 	int boardNum = res2.getInt("board_num");
			 	 	email = res2.getString("email");
			 	 	nickname = res2.getString("nickname");
			 	 	String title = res2.getString("title");
			 	 	content = res2.getString("content");
			 	 	viewer = res2.getInt("viewer");
			 	 	String flag = res2.getString("flag");
			 	 	String regDate = res.getString("reg_date");
			 	 	
			 	 	%>
 	
 	<div class="main">
	<div class="challenge_title">
		<h3><%= title %></h3>
		<hr>
		
		<div class="board_detail">
			<h8><b>작성자:</b> <%= nickname %></h8>
			<br><h8><b>조회수:</b> <%= viewer %></h8>
			<br><h8><b>카테고리:</b> <%= category %></h8>
			<br><h8><b>포인트:</b> <%= point %></h8>
			<br><h8><b>작성일자:</b> <%= regDate %></h8>
		</div>
	<hr>
	</div>
	

	<div class="container">
				<input type="text" name="content" class="form-control mt-4 mb-2" id="content" readonly>
	<hr>
	</div>
	 
	<div class="flag">
	<% 
	

	
	//db4
	 	userEmail = (String) session.getAttribute("user_email");
	 	
	 	String sql4 = ("select admin_auth from member where email = ?");
	 	
	 	pstmt4 = conn.prepareStatement(sql4);
		pstmt4.setString(1, userEmail);
	
	 	res3 = pstmt4.executeQuery();
	 	res3.next();
		
	 	adminAuth = res3.getInt("admin_auth");
	
		if(userEmail.equals(email) || adminAuth == 1){ %>
		<input type="text" name="content" class="form-control mt-4 mb-2" id="content"
		value="<%= flag %>" readonly>
		<% } %>	
		<div class="btn_area">
		<%	 	 	
		if(userEmail.equals(email) || adminAuth == 1){
		%>
			<div class="btn">
				<a class="btn btn-danger pull-right" href="./challengedeleteProcess.jsp?num=<%= boardNum %>">삭제</a>
			</div>
			<div class="btn">
				<a class="btn btn-primary pull-right" href="./challengeEdit.jsp?num=<%= boardNum %>">수정</a>
			</div>
		<% } %>
		<% if(userEmail != null){%>
			<div class="btn">
				<a class="btn btn-success  pull-right" href="./challengeSolve.jsp?num=<%= boardNum %>">도전</a>
			</div>
		<% } %>
		</div>
	</div>
</div>

	<% }
	 	
}catch(Exception e){
	
}
%>
</main>


<!-- footer include -->
<jsp:include page="./common/footer.jsp"/>

</body>

<!-- bootstrap js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

<script>
var content = "<%= content %>"
var strippedHtml = content.replace(/<[^>]+>/g, '');

document.getElementById("content").value=strippedHtml;

</script>

</html>