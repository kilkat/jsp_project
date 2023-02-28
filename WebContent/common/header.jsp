<header>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="nav_img_title">
			<a class="navbar-brand" href="./index.jsp">
		    	<img src="./img/favicon.ico" width="30" height="30" class="d-inline-block align-top" alt="">
		  	</a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			  <a class="navbar-brand" href="./index.jsp">CJU_Coding101</a>
		</div>
		  <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
		    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
		      <li class="nav-item">
		        <a class="nav-link" href="./index.jsp">HOME</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="./rank.jsp">RANK</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="./challenge.jsp">CHALLENGE</a>
		      </li>
		      <% 
		      String user_email = (String) session.getAttribute("user_email");
		      if(user_email == null){ %>
		      <li class="nav-item">
		        <a class="nav-link" href="./login.jsp">LOGIN</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="./join.jsp">JOIN</a>
		      </li>
		      <% } else{ %>
		      <li class="nav-item">
		        <a class="nav-link" href="./logout.jsp">Logout</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link text-info" href="./userInfo.jsp?user=<%= user_email %>"><%= user_email %></a>
		      </li>
		      <% } %>
		      
		    </ul>
		    <div class="nav_serch">
			    <form class="form-inline my-2 my-lg-0">
			      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
			      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			    </form>
		    </div>
		  </div>
	</nav>
</header>