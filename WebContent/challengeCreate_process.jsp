<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("utf-8"); %>

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
 	   	
 		int board_num = 0;
 		System.out.println(board_num);
 		
 		String email = (String) session.getAttribute("user_email");
 		System.out.println(email);
 		
 		conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
 		String sql = ("select nickname from member where email=?");
 		pstmt = conn.prepareStatement(sql);
 		pstmt.setString(1, email);
 		res = pstmt.executeQuery();
 		res.next();
 		
 		String nickname = res.getString("nickname");
 	 	System.out.println(nickname);
 	 	
 		String title = request.getParameter("title");
 		System.out.println(title);
 		
 		String content = request.getParameter("content");
 		System.out.println(content);
 		
 		int viewer = 0;
 		System.out.println(viewer);
 		
 		Timestamp register = new Timestamp(System.currentTimeMillis());
 		System.out.println(register); 		
 		
		conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	 	
 	 	String sql2= "insert into board values (?,?,?,?,?,?,?)";
 	 	pstmt=conn.prepareStatement(sql2);
 	 	pstmt.setInt(1,board_num);
	 	pstmt.setString(2,email);
	    pstmt.setString(3,nickname);
	    pstmt.setString(4,title);
	    pstmt.setString(5,content);
	    pstmt.setInt(6,viewer);
	    pstmt.setTimestamp(7,register);
	 	pstmt.executeUpdate();
	 	
		response.sendRedirect("./challenge.jsp");
 		
 	}catch(Exception e){ 
		e.printStackTrace();
		out.println("조회를 실패했습니다");
 	}
// finally{
//  		if(pstmt != null) 
// 		try{pstmt.close();}catch(SQLException sqle){}
//  		if(conn != null) 
// 		try{conn.close();}catch(SQLException sqle){}
//  	}

%>