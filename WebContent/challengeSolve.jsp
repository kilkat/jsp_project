<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>

<!-- head include -->
<jsp:include page="./common/head.jsp"/>

<!-- css include -->
<link rel="stylesheet" href="./css/challengeSolve.css">

<!-- bootstrap include -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<body>

<!-- header include -->
<jsp:include page="./common/header.jsp"/>

<!-- main container -->
<main>
	<div class="solveContaniner">
		<div class="solveContent">
			<h4>Proof Your Flag</h4>
			<form class="inputFlag">
				<input type="text" name="flag" class="form-control mt-4 mb-2">
				<input type="submit" class="btn btn-success" value="확인">
			</form>
		</div>
	</div>
</main>

<!-- footer include -->
<jsp:include page="./common/footer.jsp"/>

<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>