<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="resources/css/main.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>Grid Test</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
</head>
<body>
	<h1>상세페이지</h1>
	<div class="check">
		<table id="list" style="width: 750px;">
			<thead id="thead" style="border-bottom: 1px solid black;">
				<tr>
					<th width="10%">NO</th>
					<th width="20%">아이디</th>
					<th width="15%">목적</th>
					<th width="15%">성별</th>
					<th width="15%">국가</th>
					<th width="15%">도시</th>
				</tr>
			</thead>
			<tbody id="search">
				<c:forEach var="grid_vo" items="${grid_vo}">
					<tr>
						<td>${grid_vo.no }</td>
						<td>${grid_vo.name }</td>
						<td>${grid_vo.purpose }</td>
						<td>${grid_vo.radio }</td>
						<td>${grid_vo.country }</td>
						<td>${grid_vo.city }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>





</body>
</html>