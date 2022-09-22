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
	<div class="main">	
		<div id="crud">
			<input type="button" style="float: right;" class="button-nav" value="Link" onClick="location.href='<%=request.getContextPath()%>/link';">
		</div>	
		<div class="sub1">
			<div class="boxes">
				<input type="text" placeholder="아이디" id="name_search" value=""	disabled='disabled'>
			</div>
			<div class="boxes">
				<select id="purpose_search">
					<option value="">Combo Box</option>
					<option value="관광">관광</option>
					<option value="휴양">휴양</option>
				</select>
			</div>
			<div class="boxes">
				<input type="radio" id="남" name="radio_search" value="남"
					checked="checked">남
			</div>
			<div class="boxes">
				<input type="radio" id="여" name="radio_search" value="여">여
			</div>
		</div>
		<div class="sub2">
			<div class="boxes">
				<select id="country_search" name="country" value="">
					<option value="">국가</option>
					<c:forEach var="cvo" items="${cvo}">
						<option value="${cvo.country }">${cvo.country }</option>
					</c:forEach>
				</select>
			</div>
			<div class="boxes">
				<select id="city_search" name="city" value="">

				</select>
			</div>
		</div>
		<div class="crud">
			<input type="button" value="수정 " id="button_mod">
		</div>
	</div>
	
	<script>
		function _GET(search) {
			var obj = {};
			var uri = decodeURI(search);
			uri = uri.slice(1, uri.length);
			var param = uri.split('&');

			for (var i = 0; i < param.length; i++) {
				var devide = param[i].split('=');
				obj[devide[0]] = devide[1];
			}
			return obj;
		}
		window.onload = function() {
			var search = decodeURIComponent(window.location.search);
			var getData = _GET(search);
			var name = document.querySelector('#name_search');
			var purpose = document.querySelector('#purpose_search');
			var radio = document.querySelector('input[name=radio_search]:checked');
			var country = document.querySelector('#country_search');
			
			name.value = getData.name;
			purpose.value = getData.purpose;
			country.value = getData.country;
			$('#city_search').prepend('<option>'+getData.city+'</option>')
			if(getData.sex=="남") {
				
				document.getElementById('남').checked="on"
				
			}else {
				
				document.getElementById('여').checked="on"
				
			}
		}

		$(document).ready(function() {
			$("#country_search").on('change', function() {
				city();
			});
			$("#button_mod").on('click', function() {
				mod();
			});
		});
		function city() {
			$.ajax({
				url : "./city",
				type : "POST",
				data : {
					country : $("#country_search").val()
				},
				success : function(data) {
					$("#city_search").empty();
					$(data).each(
							function(index, item) {

								$('#city_search').append(
										'<option>' + item.city + '</option>')
							});
				},
				error : function() {
					alert("err");
				}
			});
		}
		function mod() {
			if ($("#purpose_search").val() == ""
					|| $("#country_search").val() == ""
					|| $("#city_search").val() == "") {
				alert("값을 다 기입하세요.");
			} else {
				$.ajax({
					url : "./mod",
					type : "POST",
					data : {
						name : $("#name_search").val(),
						purpose : $("#purpose_search").val(),
						radio : $('input[name=radio_search]:checked').val(),
						country : $("#country_search").val(),
						city : $("#city_search").val()

					},
					success : function(data) {
						
						
						alert("수정되었습니다.");
						window.close();

					},
					error : function(request, status, error) {
						alert("code = " + request.status + " message = "
								+ request.responseText + " error = " + error);
					}
				});
			}
		}
	</script>
</body>

</html>