<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<% String boardNum = ""; %>

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
	   	String param = request.getParameter("num");
	   	boardNum = param;
	   	System.out.println("-----------------------------");
	   	
	   	conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	   	
	   	String title = request.getParameter("title");
	   	String content = request.getParameter("content");
	   	String testcase1 = request.getParameter("testcase1");
	   	String testcase2 = request.getParameter("testcase2");
	   	String testcase3 = request.getParameter("testcase3");
	  	
	   	//db1
		String sql = ("update board set title=?, content=?, testcase1=?, testcase2=?, testcase3=? where board_num=?");
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, testcase1);
		pstmt.setString(4, testcase2);
		pstmt.setString(5, testcase3);
		pstmt.setString(6, param);
		
	 	pstmt.executeUpdate();
	 	
		response.sendRedirect("./challengeView.jsp?num=" + boardNum);
%>
<% }catch(Exception e){ %>
<% } %>