<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	String email = request.getParameter("email");
	String passwd = request.getParameter("passwd");
	
	if(email.equals("") || email == null ){ 
%>
		<script>
			alert('아이디를 입력하세요.');
			location.href = "./login.jsp";
		</script>
<%
return; 	
}else if(passwd.equals("") || passwd == null){
%>
		<script>
			alert('비밀번호를 입력하세요.');
			location.href = "./login.jsp";
		</script>
<%
return;
} 
%>

<%
	String jdbcUrl="jdbc:mysql://localhost:3306/jsp_project?characterEncoding=UTF-8&serverTimezone=UTC";
	String dbId="root";
	String dbPass="root";
 
 	Class.forName("com.mysql.cj.jdbc.Driver");
	
	System.out.println("입력받은 ID : " + email);
	System.out.println("입력받은 PW : " + passwd);
	
 	Connection conn=null;
   	PreparedStatement pstmt=null;
   	String str="";
   	
   	try{
   		
 		conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	 	
 	 	String sql= "select * from member where email = ? && passwd = ?";
 	 	
 	 	pstmt=conn.prepareStatement(sql);
	    pstmt.setString(1,email);
	 	pstmt.setString(2,passwd);
	 	
	 	ResultSet rs = pstmt.executeQuery();
	 	if(rs.next()){
	 		
	 		session.setAttribute("user_email", email);
	 		
	 		String user_email = (String) session.getAttribute("user_email");
	 		System.out.println("eamil_session : " + user_email);
	 		
	 		response.sendRedirect("./index.jsp");
	 		
	 	}else{
	 		
	 		response.sendRedirect("./login.jsp");
	 		
	 	}
		
   	}catch(Exception e){
   		
   	}
%>	
