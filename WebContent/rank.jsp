<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>

<!-- head include -->
<jsp:include page="./common/head.jsp"/>

<!-- css include -->
<link rel="stylesheet" href="./css/rank.css">

<body>

<!-- header include -->
<jsp:include page="./common/header.jsp"/>

<!-- main container -->
<main>
	<div class="rank_title">
		<h2> Coding_101 TOP 10 </h2>
	</div>
	
	<div class="rank">
		<div class="container">
			<table class="table table-striped">
				<thead>
				<tr>
					<th>등수</th>
					<th>닉네임</th>
					<th>포인트</th>
					<th>가입 날짜</th>
				</tr>
				</thead>
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
 	   	
	 	//db1
 	   	conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
		String sql = ("select * from member order by point desc limit 10");
		pstmt = conn.prepareStatement(sql);
 	 	res = pstmt.executeQuery();
 	 	int count = 1;
 	 	
 	 	while(res.next()){
	 	 	String nickname = res.getString("nickname");
	 	 	String point = res.getString("point");
	 	 	String regDate = res.getString("reg_date");
	 	 	
	 	 	
%>
				
				<tr>
					<td><%= count %></td>
					<td><%= nickname %></td>
					<td><%= point %></td>
					<td><%= regDate %></td>
				</tr>
					
		 	 	<%
	 	 	count += 1;
		 	
 	 	}
		 	 	
			}catch(Exception e){
				
			}
		%>
			</table>
		</div>
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