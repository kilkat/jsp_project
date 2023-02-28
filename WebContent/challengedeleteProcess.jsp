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
	   	PreparedStatement pstmt2=null;
	   	PreparedStatement pstmt3=null;
	   	ResultSet res = null;
	   	String str="";
	   	
	   	String param = request.getParameter("num");
		
	   	conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
		String sql = ("delete from board where board_num = ?");
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, param);
	 	pstmt.executeUpdate();
	 	
	 	String sql2 = ("set @count = 0");
	 	pstmt2 = conn.prepareStatement(sql2);
	 	pstmt2.executeUpdate();
	 	
	 	String sql3 = ("update board set board . board_num = @COUNT:=@COUNT+1");
	 	pstmt3 = conn.prepareStatement(sql3);
	 	pstmt3.executeUpdate();
	 	
	 	response.sendRedirect("./challenge.jsp");
	 	
}catch(Exception e){
	
}
%>