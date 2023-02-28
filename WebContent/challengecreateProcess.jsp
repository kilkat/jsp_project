<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<% 
String saveFolder = application.getRealPath("./upload");
String encType = "EUC-KR";
int maxSize = 5 * 1024 * 1024;
%>

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
 	   	String str="";
 	   	
 		int board_num = 0;
 		
 		String email = (String) session.getAttribute("user_email");
 		
 		conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
 		
 		String sql = ("select nickname from member where email=?");
 		pstmt = conn.prepareStatement(sql);
 		pstmt.setString(1, email);
 		res = pstmt.executeQuery();
 		res.next();
 		
 		String nickname = res.getString("nickname");
 	 	
 		String title = request.getParameter("title");
 		
 		String category = request.getParameter("category");
 		
 		String content = request.getParameter("content").replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>","");
 		System.out.println(content);
 		
 		int viewer = 0;
 		
 		String flag = request.getParameter("flag");
 		
 		int point = Integer.parseInt(request.getParameter("point"));
 		
 		Timestamp register = new Timestamp(System.currentTimeMillis());
 		
 		
 		//db2
 		String sql2= "insert into board values (?,?,?,?,?,?,?,?,?,?)";
 	 	pstmt2=conn.prepareStatement(sql2);
 	 	pstmt2.setInt(1,board_num);
	 	pstmt2.setString(2,email);
	    pstmt2.setString(3,nickname);
	    pstmt2.setString(4,title);
	    pstmt2.setString(5,category);
	    pstmt2.setString(6,content);
	    pstmt2.setInt(7,viewer);
	    pstmt2.setString(8,flag);
	    pstmt2.setInt(9,point);
	    pstmt2.setTimestamp(10,register);
	 	pstmt2.executeUpdate();
 		
	 	
	 	//db3
 		String sql3 = ("set @count = 0");
	 	pstmt3 = conn.prepareStatement(sql3);
	 	pstmt3.executeUpdate();
	 	
	 	
	 	//db4
	 	String sql4 = ("update board set board . board_num = @COUNT:=@COUNT+1");
	 	pstmt4 = conn.prepareStatement(sql4);
	 	pstmt4.executeUpdate();
	 	
	 	//file upload
// 	 	MultipartRequest multi = null;
//         multi = new MultipartRequest(request, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());
//         String user = multi.getParameter("user");
//         String title = multi.getParameter("title");
        
//         out.println("user: " + user + "<br/>");
//         out.println("title: " + title + "<br/>");
//         out.println("<hr>");
        
//         String fileName = multi.getFilesystemName("uploadFile");
//         String original = multi.getOriginalFileName("uploadFile");
//         String type = multi.getContentType("uploadFile");
//         File f = multi.getFile("uploadFile");
 		
 	 	
	 	
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
