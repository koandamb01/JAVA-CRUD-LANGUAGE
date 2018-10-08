<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@ page import = "java.io.*,java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<style>
	form{
		display: inline;
	}
</style>
<title>Language MVC</title>
</head>
<body>
	<div class="container">
		<h1>All Books</h1>
		<table class="table table-striped">
		    <thead class="thead-dark">
		        <tr>
		            <th>Name</th>
		            <th>Creator</th>
		            <th>Version</th>
		            <th>Actions</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach items="${languages}" var="lang">
		        <tr>
		            <td>${lang.name}</td>
		            <td>${lang.creator}</td>
		            <td>${lang.currentVersion}</td>
		            <td>
		            	<a href="/language/${lang.id}/edit" class="btn btn-sm btn-warning">Edit Language</a>
		            	<a href="/language/${lang.id}/show" class="btn  btn-sm btn-primary">Show Language</a>
		            	<form action="/language/${lang.id}" method="POST">
		            		<input type="hidden" name="_method" value="delete">
						    <input type="submit" value="Delete" class="btn  btn-sm btn-danger">
						</form>
		            </td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
		
		<br><hr><br>
		<div class="row">
			<div class="col-md-6">
				<form:form action="/newLanguage" method="post" modelAttribute="language">
			    <div class="form-group">
			        <form:label path="name">Name:</form:label>
			        <form:errors path="name" class="text-danger"/>
			        <form:input path="name" class="form-control"/>
			    </div>
			    
			    <div class="form-group">
			        <form:label path="creator">Creator: </form:label>
			        <form:errors path="creator" class="text-danger"/>
			        <form:textarea path="creator" class="form-control"/>
			    </div>
			    
			   <div class="form-group">
			        <form:label path="currentVersion">Version: </form:label>
			        <form:errors path="currentVersion" class="text-danger"/>
			        <form:input path="currentVersion" class="form-control"/>
			    </div>   
			    
			    <input type="submit" value="Submit" class="btn btn-primary"/>
			</form:form>    
			</div>
		</div>
		
	</div>
</body>
</html>
