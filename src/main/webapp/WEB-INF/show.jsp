<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@ page import = "java.io.*,java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<title>Language MVC</title>
</head>
<body>
	<div class="container">
		<h1>Language Detail</h1>
		<div class="row">
			<div class="col-md-6">
				<ul class="list-group">
				  <li class="list-group-item d-flex justify-content-between align-items-center">
				    Name:<span class="badge badge-pill">${language.name}</span>
				  </li>
				  <li class="list-group-item d-flex justify-content-between align-items-center">
				    Creator: <span class="badge badge-pill">${language.creator}</span>
				  </li>
				  <li class="list-group-item d-flex justify-content-between align-items-center">
				    Version: <span class="badge badge-pill">${language.currentVersion}</span>
				  </li>
				</ul>
			</div>
		</div>
		<br>
		<a href="/" class="btn btn-sm btn-primary">Go Back</a>
	</div>
</body>
</html>
