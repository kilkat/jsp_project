<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.sql.*" %>

<% String content =""; %>
<% int boardNum = 0; %>

<!DOCTYPE html>
<html>

<!-- head include -->
<jsp:include page="./common/head.jsp"/>

<!-- css include -->
<link rel="stylesheet" href="./css/challengeEdit.css">

<!-- summernote include -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="./summernote/summernote-lite.js"></script>
<script src="./summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="./summernote/summernote-lite.css">
<!--  -->

<body>

<!-- header include -->
<jsp:include page="./common/header.jsp"/>


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
	   	
	  	conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	  	
		String sql = ("select * from board where board_num = ?");
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, param);
		
	 	res = pstmt.executeQuery();
	 	while(res.next()){
	 	
 	 	boardNum = res.getInt("board_num");
 	 	System.out.println(boardNum);
 	 	String email = res.getString("email");
 	 	String nickname = res.getString("nickname");
 	 	String title = res.getString("title");
 	 	content = res.getString("content");
 	 	int viewer = res.getInt("viewer");
		String testcase1 = res.getString("testcase1");
		String testcase2 = res.getString("testcase2");
		String testcase3 = res.getString("testcase3");
 	 	String regDate = res.getString("reg_date");
 	 	
%>

<!-- main container -->
<main>
	<form name="challengeeditProcess" class="create_box" action="./challengeeditProcess.jsp?num=<%= boardNum %>" method="post">
		<div class="challenge_title">
			<input type="text" name="title" class="form-control mt-4 mb-2"
			placeholder="제목을 입력해주세요." required value="<%= title %>">
		</div>
		
		<div class="container">
			<hr>
	  			<textarea class="summernote" name="content" id="content"></textarea>
	  		<hr>
		</div>
		
		<div class="test_case">
			<input type="text" name="testcase1" class="form-control mt-4 mb-2"
			value="<%= testcase1 %>">
			<input type="text" name="testcase2" class="form-control mt-4 mb-2"
			value="<%= testcase2 %>">
			<input type="text" name="testcase3" class="form-control mt-4 mb-2"
			value="<%= testcase3 %>">
			<input type="submit" class="btn btn-success mb-3" value="수정">
		</div>
	</form>
</main>
<% } %>
<% }catch(Exception e){ %>
<% } %>

<script>
var content = "<%= content %>"
console.log(content);
var strippedHtml = content.replace(/<[^>]+>/g, '');

document.getElementById("content").value=strippedHtml;
</script>

<!-- summernote 설정 -->
<script>
	$('.summernote').summernote({
		  height: 500,
		  minHeight: 500,
		  maxHeight: 500,
		  lang: "ko-KR"
		});
</script>

<!-- footer include -->
<jsp:include page="./common/footer.jsp"/>

<!-- bootstrap js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
</body>
</html>