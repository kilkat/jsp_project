<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

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
   	String email = request.getParameter("user");
  	System.out.println("-----------------------------");
  	
  	conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
  	
  	//param value
  	String nickname = request.getParameter("nickname");
  	String passwd = request.getParameter("passwd");
   	
   	
   	//db1
   	String sql = ("update member set nickname=?, passwd=? where email=?");

   	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, nickname);
	pstmt.setString(2, passwd);
	pstmt.setString(3, email);
	
	pstmt.executeUpdate();
   	
	response.sendRedirect("./index.jsp");
	
}catch(Exception e){}

%>