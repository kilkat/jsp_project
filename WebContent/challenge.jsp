<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.paging" %>

<% String email = ""; %>

<!DOCTYPE html>
<html>

<!-- head include -->
<jsp:include page="./common/head.jsp"/>

<!-- css include -->
<link rel="stylesheet" href="./css/challenge.css">

<body>

<!-- header include -->
<jsp:include page="./common/header.jsp"/>

<!-- main container -->
<main>
	<div class="challenge_title">
		<h2>CJU CTF Challenge</h2>
	</div>
	
	<div class="container">
	<hr>
<!-- 		<table class="table table-striped"> -->
<!-- 		<thead> -->
<!-- 					<tr> -->
<!-- 						<th>번호</th> -->
<!-- 						<th>제목</th> -->
<!-- 						<th>작성자</th> -->
<!-- 						<th>날짜</th> -->
<!-- 						<th>조회수</th> -->
<!-- 					</tr> -->
<!-- 					</thead> -->
<!-- 					<tbody> -->
		
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
		 	   	ResultSet res = null;
		 	   	String str="";
				
		 	   	conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );

		 	   	
		 	 	//db1
		 		String sql = ("set @count = 0");
			 	pstmt = conn.prepareStatement(sql);
			 	pstmt.executeUpdate();
			 	
			 	
			 	//db2
			 	String sql2 = ("update board set board . board_num = @COUNT:=@COUNT+1");
			 	pstmt2 = conn.prepareStatement(sql2);
			 	pstmt2.executeUpdate();
		 	   	
		 	   	
			 	//db3
// 	 			String sql3 = ("select * from board orders limit 10 offset 0");
	 			String sql3 = ("select * from board");
	 			pstmt3 = conn.prepareStatement(sql3);
		 	 	res = pstmt3.executeQuery();
		 	 	
		 	 	while(res.next()){
			 	 	int boardNum = res.getInt("board_num");
			 	 	email = res.getString("email");
			 	 	String nickname = res.getString("nickname");
			 	 	String title = res.getString("title");
			 	 	String category = res.getString("category");
			 	 	String content = res.getString("content");
			 	 	int viewer = res.getInt("viewer");
			 	 	int point = res.getInt("point");
			 	 	String regDate = res.getString("reg_date");
			 	 	%>
			 	 	
<!-- 					<tr> -->
<%-- 						<td><%= boardNum %></td> --%>
<%-- 						<td><a href="challengeView.jsp?num=<%= boardNum %>"><%= title %></a></td> --%>
<%-- 						<td><%= nickname %></td> --%>
<%-- 						<td><%= regDate %></td> --%>
<%-- 						<td><%= viewer %></td> --%>
<!-- 					</tr> -->

						<div class="card" style="width: 18rem;">
	  						<div class="card-body">
		    					<h5 class="card-title"><a href="challengeView.jsp?num=<%= boardNum %>"><%= title %></a></h5>
		    					<p class="card-text">point: <%= point %>
		    					<br>Category: <%= category %></p>
		    					<a href="challengeView.jsp?num=<%= boardNum %>" class="btn btn-primary">Go <%= title %> Page</a></a>
  							</div>
						</div>
						
					
		 	 	<% }
		 	 	
			}catch(Exception e){
				
			}
		%>
		
<!-- 		</tbody> -->
<!-- 				</table> -->
		<hr/>
		<% 
		      String user_email = (String) session.getAttribute("user_email");
		      if(user_email != null){ %>
				<div class="btn">
					<a class="btn btn-primary pull-right" href="./challengeCreate.jsp">글쓰기</a>
				</div>
		<% } %>
		
	</div>
	
<!-- <div class="page_wrap"> -->
<!--    <div class="page_nation"> -->
<%--    	<c:url var="action" value="/board"/> --%>
   	
<%-- 	<c:if test="${param.prev}"> --%>
<%--     	<a href="${action}?page=${param.beginPage-1}">prev</a> --%>
<%-- 	</c:if> --%>
	
<%-- 	<c:forEach begin="${param.beginPage}" end="${param.endPage}" step="1" var="index"> --%>
<%--     	<c:choose> --%>
<%--     		<c:when test="${param.page==index}"> --%>
<%--     			${index} --%>
<%--     		</c:when> --%>
    		
<%--     		<c:otherwise> --%>
<%--     			<a href="${action}?page=${index}">${index}</a> --%>
<%--     		</c:otherwise> --%>
<%--     	</c:choose> --%>
<%-- 	</c:forEach> --%>
	
<%-- 	<c:if test="${param.next}"> --%>
<%--     <a href="${action}?page=${param.endPage+1}">next</a> --%>
<%-- 	</c:if> --%>
<!--    </div> -->
<!-- </div> -->
</main>

<!-- footer include -->
<jsp:include page="./common/footer.jsp"/>

<!-- bootstrap js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
</body>
</html>