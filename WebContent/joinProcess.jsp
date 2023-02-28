<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<%  
	
	String jdbcUrl="jdbc:mysql://localhost:3306/jsp_project?characterEncoding=UTF-8&serverTimezone=UTC";
	String dbId="root";
	String dbPass="root";
 
 	Class.forName("com.mysql.cj.jdbc.Driver");
	
	String nickname = request.getParameter("nickname");
	String email = request.getParameter("email");
	String phoneNumber = request.getParameter("phoneNumber");
	String passwd = request.getParameter("passwd");
	Timestamp register = new Timestamp(System.currentTimeMillis());
	
// 	System.out.println(nickname);
// 	System.out.println(email);
// 	System.out.println(passwd);
// 	System.out.println(register);
	
 	Connection conn=null;
   	PreparedStatement pstmt=null;
   	String str="";
   	try{
 		conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	 	
 	 	String sql= "insert into member values (?,?,?,?,?,?,?,?)";
 	 	pstmt=conn.prepareStatement(sql);
 	 	pstmt.setInt(1, 1);
	 	pstmt.setString(2,nickname);
	    pstmt.setString(3,email);
	    pstmt.setString(4,phoneNumber);
	 	pstmt.setString(5,passwd);
	 	pstmt.setInt(6, 1); //admin_auth
	 	pstmt.setInt(7, 0);
	 	pstmt.setTimestamp(8,register);
	 	pstmt.executeUpdate();
	 	
		response.sendRedirect("./index.jsp");
	 	
	}catch(Exception e){ 
		e.printStackTrace();
		out.println("member 테이블에 새로운 레코드를 추가에 실패했습니다");
 	}finally{
 		if(pstmt != null) 
		try{pstmt.close();}catch(SQLException sqle){}
 		if(conn != null) 
		try{conn.close();}catch(SQLException sqle){}
 	}
%>