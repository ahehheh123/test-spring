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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Grid Test</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
</head>
<body>
	<div class="top">
		<div class="top-left">
			<h1>Grid그리드</h1>
		</div>
		<div class="top-right">
			<div class="top-boxes">
				<input type="radio" id="kor" name="radio_search_national"
					value="kor" checked="checked">kor
			</div>
			<div class="top-boxes">
				<input type="radio" id="eng" name="radio_search_national"
					value="eng">eng
			</div>
		</div>
	</div>
	<div id="main_kor" class="main" style="position: absolute; visibility: visible; background-color: white;">
		<div class="sub1">
			<div class="boxes">
				<input type="text" placeholder="아이디" id="name_search" value="">
			</div>
			<div class="boxes">
				<select id="purpose_search">
					<option value="">Combo Box</option>
					<option value="관광">관광</option>
					<option value="휴양">휴양</option>
				</select>
			</div>
			<div class="boxes">
				<input type="radio" id="남" name="radio_search" value="남">남
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
				<select id="city_table" onClick="city_select('OPEN')">
					<option>도시</option>
				</select>
				<div id="Div"
					style="position: absolute; visibility: hidden; background-color: white;">
				</div>
			</div>
			<div class="boxes">
				<input type="text" placeholder="시작">
			</div>
			<div class="boxes">
				<input type="text" placeholder="끝">
			</div>
		</div>
		<div class="crud">
			<form action="./excel" method="get">
				<input type="button" value="추가 " id="button_add"> <input
					type="button" value="조회" id="button_search"> <input
					type="button" value="저장" id="button_save" disabled='disabled'>
				<input type="button" value="삭제" id="button_del"> <input
					type="submit" value="엑셀 다운" id="button_excel">
			</form>
		</div>
		<div class="check">
			<table id="list" style="width: 750px;">
				<thead id="thead" style="border-bottom: 1px solid black;">
					<tr>
						<th width="10%">선택</th>
						<th width="20%">아이디</th>
						<th width="15%">목적</th>
						<th width="15%">성별</th>
						<th colspan="2" width="40%">장소</th>
					</tr>
					<tr>
						<th width="10%"></th>
						<th width="20%"></th>
						<th width="15%"></th>
						<th width="15%"></th>
						<th width="15%">국가</th>
						<th width="15%">도시</th>
					</tr>
				</thead>
				<tbody id="search" style="visibility: visible;">

				</tbody>
			</table>
		</div>
		<div id="board" style="visibility: visible;"></div>
	</div>
	<div class="main">
		<div class="sub1">
			<div class="boxes">
				<input type="text" placeholder="ID" id="name_search_eng" value="">
			</div>
			<div class="boxes">
				<select id="purpose_search_eng">
					<option value="">purpose</option>
					<option value="tourism">tourism</option>
					<option value="tourism">travel</option>
				</select>
			</div>
			<div class="boxes">
				<input type="radio" id="male" name="radio_search_eng" value="male">male
			</div>
			<div class="boxes">
				<input type="radio" id="female" name="radio_search_eng" value="female">female
			</div>
		</div>
		<div class="sub2">
			<div class="boxes">
				<select id="country_search_eng" name="country" value="">
					<option value="">country</option>
					<c:forEach var="cvo_eng" items="${cvo_eng}">
						<option value="${cvo_eng.country }">${cvo_eng.country }</option>
					</c:forEach>
				</select>
			</div>
			<div class="boxes">
				<select id="city_table_eng" onClick="city_select_eng('OPEN')">
					<option>city</option>
				</select>
				<div id="Div_eng" style="position:absolute; visibility:hidden; background-color:white;">
				</div>
			</div>
			<div class="boxes">
				<input type="text" placeholder="start">
			</div>
			<div class="boxes">
				<input type="text" placeholder="end">
			</div>
		</div>
		<div class="crud">
			<form action="./excel" method="get">				
				<input type="button" value="add " id="button_add_eng"> 
				<input type="button" value="search" id="button_search_eng"> 
				<input type="button" value="save" id="button_save_eng" disabled='disabled'>
				<input type="button" value="delete" id="button_del_eng">
		        <input type="submit" value="excel download" id="button_excel">
	        </form>
		</div>
		<div class="check">
			<table id="list_eng" style="width:750px;">
				<thead id="thead_eng" style="border-bottom: 1px solid black;">
					<tr>
						<th width="10%">choice</th>
						<th width="20%">ID</th>
						<th width="15%">purpose</th>
						<th width="15%">sex</th>
						<th colspan="2"  width="40%">place</th>						
					</tr>
					<tr>
						<th width="10%"></th>
						<th width="20%"></th>
						<th width="15%"></th>
						<th width="15%"></th>
						<th width="15%">country</th>
						<th width="15%">city</th>
					</tr>
				</thead>

			</table>
		</div>
	</div>
	<script>
		$(document).ready(function () {
			$(document).on('click', "#button_save", function() {
				save();
			});
			$(document).on('click',"#button_search", function() {
				btnDisabled();	
				search();							
			});
			$(document).on('change', "#country_search", function() {
				city_search();
			});
			$(document).on('change', "#country", function() {
				city();
			});
			$(document).on('click', "#city_table", function() {
				city_select('OPEN');
			});
			$(document).on('click', "#city_table_end", function() {
				city_select('CLOSE');
			});
			$(document).on('click', "#city", function() {
				city_add('OPEN');
			});
			$(document).on('click', "#city2", function() {
				city_add('CLOSE');
			});
			$(document).on('click', "#city3", function() {
				city_add2('OPEN');
			});
			$(document).on('click', "#city4", function() {
				city_add2('CLOSE');
			});
			$(document).on('click', "#button_del", function() {
				del();				
			});
			
			$(document).on('click',"#button_add", function() {
				const target = document.getElementById('button_save');
				  target.disabled = false;
				
				add();				
			});
			$(document).on("click", "input[name='radio_search']", function(){
			    thisRadio = $(this);
			    if (thisRadio.hasClass("imChecked")) {
			        thisRadio.removeClass("imChecked");
			        thisRadio.prop('checked', false);
			    } else { 
			        thisRadio.prop('checked', true);
			        thisRadio.addClass("imChecked");
			    };
			});
			$(document).on("change","input[name='radio_search_national']", function(){
				
				national($('input[name=radio_search_national]:checked').val());				
				
			})
			$(document).on('dblclick', "#list tr", function() {
				var tdArr = new Array();	
				var tr = $(this);
				var td = tr.children();
				
				td.each(function(i){
					tdArr.push(td.eq(i).text());
				});

				var no = td.eq(0).text();
				var name = td.eq(1).text();
				var purpose = td.eq(2).text();
				var sex = td.eq(3).text();
				var country = td.eq(4).text();
				var city = td.eq(5).text();
				
				var popup;
				
				popup = window.open("user_pop_up?name="+name+"&purpose="+encodeURIComponent(purpose)+"&sex="+encodeURIComponent(sex)+"&country="+encodeURIComponent(country)+"&city="+encodeURIComponent(city)
						,"user_pop_up","width=850px,height=650px, top=200px, left=125px;");
				
				popup.addEventListener('beforeunload', function() {
					
					$.ajax({
						url: "./mod_table",
						type: "GET",
						data: {
							name: name				
						},
						success: function(data) {
							
							$(td.eq(2).text(data[0].purpose));
							$(td.eq(3).text(data[0].radio));
							$(td.eq(4).text(data[0].country));
							$(td.eq(5).text(data[0].city));

				        },
						error: function(){
							alert("err");
						}
					});
				});
			});	
			$(document).on('click',"input[name=city_save_all]",  function(){
			    if($("input[name=city_save_all]").prop("checked")){
			        $("input[name=city_save]").prop("checked",true);   // 전체 체크
			    }else{
			        $("input[name=city_save]").prop("checked",false);  // 전체 체크 해제
			    }
			});
			$(document).on('click',"input[name=city_search_all]",  function(){
			    if($("input[name=city_search_all]").prop("checked")){
			        $("input[name=city_search]").prop("checked",true);   // 전체 체크
			    }else{
			        $("input[name=city_search]").prop("checked",false);  // 전체 체크 해제
			    }
			});	
			
			$(document).on('click', "#button_save_eng", function() {
				save_eng();
			});
			$(document).on('click',"#button_search_eng", function() {
				btnDisabled_eng();	
				search_eng();							
			});
			$(document).on('change', "#country_search_eng", function() {
				city_search_eng();
			});
			$(document).on('change', "#country_eng", function() {
				city_eng();
			});
			$(document).on('click', "#city_table_eng", function() {
				city_select_eng('OPEN');
			});
			$(document).on('click', "#city_table_end_eng", function() {
				city_select_eng('CLOSE');
			});
			$(document).on('click', "#city_eng", function() {
				city_add_eng('OPEN');
			});
			$(document).on('click', "#city2_eng", function() {
				city_add_eng('CLOSE');
			});
			$(document).on('click', "#city3_eng", function() {
				city_add2_eng('OPEN');
			});
			$(document).on('click', "#city4_eng", function() {
				city_add2_eng('CLOSE');
			});
			$(document).on('click', "#button_del_eng", function() {
				del_eng();				
			});
			
			$(document).on('click',"#button_add_eng", function() {
				const target = document.getElementById('button_save_eng');
				  target.disabled = false;
				
				add_eng();				
			});
			$(document).on("click", "input[name='radio_search_eng']", function(){
			    thisRadio = $(this);
			    if (thisRadio.hasClass("imChecked")) {
			        thisRadio.removeClass("imChecked");
			        thisRadio.prop('checked', false);
			    } else { 
			        thisRadio.prop('checked', true);
			        thisRadio.addClass("imChecked");
			    };
			});

			$(document).on('dblclick', "#list_eng tr", function() {
				var tdArr = new Array();	
				var tr = $(this);
				var td = tr.children();
				
				td.each(function(i){
					tdArr.push(td.eq(i).text());
				});

				var no = td.eq(0).text();
				var name = td.eq(1).text();
				var purpose = td.eq(2).text();
				var sex = td.eq(3).text();
				var country = td.eq(4).text();
				var city = td.eq(5).text();
				
				var popup;
				
				popup = window.open("user_pop_up?name="+name+"&purpose="+encodeURIComponent(purpose)+"&sex="+encodeURIComponent(sex)+"&country="+encodeURIComponent(country)+"&city="+encodeURIComponent(city)
						,"user_pop_up","width=850px,height=650px, top=200px, left=125px;");
				
				popup.addEventListener('beforeunload', function() {
					
					$.ajax({
						url: "./mod_table",
						type: "GET",
						data: {
							name: name				
						},
						success: function(data) {
							
							$(td.eq(2).text(data[0].purpose));
							$(td.eq(3).text(data[0].radio));
							$(td.eq(4).text(data[0].country));
							$(td.eq(5).text(data[0].city));

				        },
						error: function(){
							alert("err");
						}
					});
				});
			});	
			$(document).on('click',"input[name=city_save_all_eng]",  function(){
			    if($("input[name=city_save_all_eng]").prop("checked")){
			        $("input[name=city_save_eng]").prop("checked",true);   // 전체 체크
			    }else{
			        $("input[name=city_save_eng]").prop("checked",false);  // 전체 체크 해제
			    }
			});
			$(document).on('click',"input[name=city_search_all_eng]",  function(){
			    if($("input[name=city_search_all_eng]").prop("checked")){
			        $("input[name=city_search_eng]").prop("checked",true);   // 전체 체크
			    }else{
			        $("input[name=city_search_eng]").prop("checked",false);  // 전체 체크 해제
			    }
			});	
		});
		function all() {
			$.ajax({
				url: "./all",
				type: "GET",
				success: function(data) {
					$("#label").empty();
					$("#thead").empty();
					$("#search").empty();
					$("#label").prepend('<input type="checkbox" value="Check Box">');
					$("#thead").prepend('<th>선택</th><th>아이디</th><th>목적</th>' +
										'<th>성별</th><th>국가</th><th>도시</th>')
					$(data).each(function(index, item) {
		                $('#search').append('<tr id="click">' + '<td>' + '<input type="checkbox" name="del_name" value="' + item.name + '">' + '</td>'
		                		+ '<td>' + item.name + '</td>' + '<td>' + item.purpose + '</td>' 
		                		+ '<td>' + item.radio + '</td>' + '<td>' + item.country + '</td>' 
		                		+ '<td>' + item.city + '</td>' + '</tr>' + '<br>');		                
		            });				
		        },
				error: function(){
					alert("err");
				}
			});
		}
		function city_select(value) {

			if(value=="OPEN") {
		     	Div.style.visibility="visible";
		    }else {
		    	Div.style.visibility="hidden";	
		    };

		}
		function city_add(value) {

			if(value=="OPEN") {				
		     	Div2.style.visibility="visible";
		    }else {
		    	Div2.style.visibility="hidden";	
		    };

		}
		function city_add2(value) {

			if(value=="OPEN") {				
		     	Div3.style.visibility="visible";
		    }else {
		    	Div3.style.visibility="hidden";	
		    };

		}
		function save() {

			var cityArray = [];
			$('input[name="city_save"]:checked').each(function(i){			
				cityArray.push($(this).val());				
			});
			if($("#name").val()=="" || $("#purpose").val()=="" || cityArray.length==0) {
				alert("값을 다 기입하세요.");
			}else {	
				$.ajax({
					url: "./save",
					type: "POST",
					data: {
							name:$("#name").val(),
							purpose:$("#purpose").val(),
							radio:$('input[name=sex]:checked').val(),
							country:$("#country").val(),
							cityArray : cityArray
					},
					success: function(data){
						const target = document.getElementById('button_add');
						target.disabled = false;
						/*
						if($('input[name=sex]:checked').val()=="남") {							
							$('#search').prepend('<tr bgcolor="#87CEFA">' + '<td>' + '<input type="checkbox" name="del_name" value="' + $("#name").val() + '">' + '</td>'
			                		+ '<td>' + $("#name").val() + '</td>' + '<td>' + $("#purpose").val() + '</td>' 
			                		+ '<td>' + $('input[name=sex]:checked').val() + '</td>' + '<td>' + $("#country").val() + '</td>' 
			                		+ '<td>'+data+'</td>' + '</tr>');							
						}else{							
							$('#search').prepend('<tr bgcolor="#CD5C5C">' + '<td>' + '<input type="checkbox" name="del_name" value="' + $("#name").val() + '">' + '</td>'
			                		+ '<td>' + $("#name").val() + '</td>' + '<td>' + $("#purpose").val() + '</td>' 
			                		+ '<td>' + $('input[name=sex]:checked').val() + '</td>' + '<td>' + $("#country").val() + '</td>' 
			                		+ '<td>'+data+'</td>' + '</tr>');							 
						}
						$("#add").remove();
						*/
						search();
						
						alert("저장되었습니다.");
					},
					error: function(){
						alert("이미 존재하는 아이디입니다.");
					}
				});				
			}			
		}
		function search() {
			$("#search").show();
		    
			const target = document.getElementById('button_add');
			target.disabled = false;
			var cityArray = [];
			cityArray[0] = "";
			$('input[name="city_search"]:checked').each(function(i){			
				cityArray.push($(this).val());				
			});
			$.ajax({
				url: "./search",
				type: "POST",				
				data: {					
					name:$("#name_search").val(),
					purpose:$("#purpose_search").val(),
					radio:$('input[name=radio_search]:checked').val(),
					country:$("#country_search").val(),
					cityArray : cityArray	
				},
				success: function(data) {
					$("#search").empty();
					$("#board").empty();
					var map = data[0];
					for(var key in map){
						$(map[key]).each(function(){						
							if(this.radio=="남") {
								$("#search").append('<tr bgcolor="#87CEFA">' + '<td>' + '<input type="checkbox" name="del_name" value="'+this.name+'">' + '</td>'
				                		+ '<td>'+this.name+'</td>' + '<td>'+this.purpose+'</td>' 
				                		+ '<td>'+this.radio+'</td>' + '<td>'+this.country+'</td>' 
				                		+ '<td>'+this.city+'</td>' + '</tr>');	
							}else {
								$("#search").append('<tr bgcolor="#CD5C5C">' + '<td>' + '<input type="checkbox" name="del_name" value="'+this.name+'">' + '</td>'
				                		+ '<td>'+this.name+'</td>' + '<td>'+this.purpose+'</td>' 
				                		+ '<td>'+this.radio+'</td>' + '<td>'+this.country+'</td>' 
				                		+ '<td>'+this.city+'</td>' + '</tr>');									
							}							
						})
					}
					var page = data[1];
					for(var key in page){
						$(page[key]).each(function(){	
							for(var i=this.startPage; i<=this.endPage; i++){								
								$("#board").append('<a id="page" href="#" onclick="page(this)" style="text-decoration:none; color:red;">['+i+']</a>')								
							}
							if(this.prev){	
								var a = this.startPage-1;
								console.log(a);
								$("#board").prepend('<a id="prev" href="#" onclick="prev('+a+')" style="text-decoration:none; color:black;">[prev]</a>')
								
							}							
							if(this.next){
								var a = this.endPage+1;
								console.log(a);
								$("#board").append('<a id="next" href="#" onclick="next('+a+')" style="text-decoration:none; color:black;">[next]</a>')
								
							}
						})
					}
				},
		        error: function(request,status,error){
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error
							);
				}
			});
		}
		function page(a) {
			var aa = $(a).text();
			var aaa = aa.replace("[","");
			var aaaa = aaa.replace("]","");
			const target = document.getElementById('button_add');
			target.disabled = false;
			var cityArray = [];
			cityArray[0] = "";
			$('input[name="city_search"]:checked').each(function(i){			
				cityArray.push($(this).val());				
			});
			$.ajax({
				url: "./search",
				type: "POST",				
				data: {					
					name:$("#name_search").val(),
					purpose:$("#purpose_search").val(),
					radio:$('input[name=radio_search]:checked').val(),
					country:$("#country_search").val(),
					cityArray : cityArray,
					page : aaaa
				},
				success: function(data) {
					$("#search").empty();
					$("#board").empty();
					var map = data[0];
					for(var key in map){
						$(map[key]).each(function(){						
							if(this.radio=="남") {
								$("#search").append('<tr bgcolor="#87CEFA">' + '<td>' + '<input type="checkbox" name="del_name" value="'+this.name+'">' + '</td>'
				                		+ '<td>'+this.name+'</td>' + '<td>'+this.purpose+'</td>' 
				                		+ '<td>'+this.radio+'</td>' + '<td>'+this.country+'</td>' 
				                		+ '<td>'+this.city+'</td>' + '</tr>');	
							}else {
								$("#search").append('<tr bgcolor="#CD5C5C">' + '<td>' + '<input type="checkbox" name="del_name" value="'+this.name+'">' + '</td>'
				                		+ '<td>'+this.name+'</td>' + '<td>'+this.purpose+'</td>' 
				                		+ '<td>'+this.radio+'</td>' + '<td>'+this.country+'</td>' 
				                		+ '<td>'+this.city+'</td>' + '</tr>');									
							}							
						})
					}
					var page = data[1];
					for(var key in page){
						$(page[key]).each(function(){	
							for(var i=this.startPage; i<=this.endPage; i++){								
								$("#board").append('<a id="page" href="#" onclick="page(this)" style="text-decoration:none; color:red;">['+i+']</a>')								
							}
							if(this.prev){	
								var a = this.startPage-1;
								console.log(a);
								$("#board").prepend('<a id="prev" href="#" onclick="prev('+a+')" style="text-decoration:none; color:black;">[prev]</a>')
								
							}							
							if(this.next){
								var a = this.endPage+1;
								console.log(a);
								$("#board").append('<a id="next" href="#" onclick="next('+a+')" style="text-decoration:none; color:black;">[next]</a>')
								
							}
						})
					}
				},
		        error: function(request,status,error){
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error
							);
				}
			});
		}
		function next(a) {
			const target = document.getElementById('button_add');
			target.disabled = false;
			var cityArray = [];
			cityArray[0] = "";
			$('input[name="city_search"]:checked').each(function(i){			
				cityArray.push($(this).val());				
			});
			$.ajax({
				url: "./search",
				type: "POST",				
				data: {					
					name:$("#name_search").val(),
					purpose:$("#purpose_search").val(),
					radio:$('input[name=radio_search]:checked').val(),
					country:$("#country_search").val(),
					cityArray : cityArray,	
					page : a
				},
				success: function(data) {
					$("#search").empty();
					$("#board").empty();
					var map = data[0];
					for(var key in map){
						$(map[key]).each(function(){						
							if(this.radio=="남") {
								$("#search").append('<tr bgcolor="#87CEFA">' + '<td>' + '<input type="checkbox" name="del_name" value="'+this.name+'">' + '</td>'
				                		+ '<td>'+this.name+'</td>' + '<td>'+this.purpose+'</td>' 
				                		+ '<td>'+this.radio+'</td>' + '<td>'+this.country+'</td>' 
				                		+ '<td>'+this.city+'</td>' + '</tr>');	
							}else {
								$("#search").append('<tr bgcolor="#CD5C5C">' + '<td>' + '<input type="checkbox" name="del_name" value="'+this.name+'">' + '</td>'
				                		+ '<td>'+this.name+'</td>' + '<td>'+this.purpose+'</td>' 
				                		+ '<td>'+this.radio+'</td>' + '<td>'+this.country+'</td>' 
				                		+ '<td>'+this.city+'</td>' + '</tr>');									
							}							
						})
					}
					var page = data[1];
					for(var key in page){
						$(page[key]).each(function(){	
							for(var i=this.startPage; i<=this.endPage; i++){								
								$("#board").append('<a id="page" href="#" onclick="page(this)" style="text-decoration:none; color:red;">['+i+']</a>')								
							}
							if(this.prev){	
								var a = this.startPage-1;
								console.log(a);
								$("#board").prepend('<a id="prev" href="#" onclick="prev('+a+')" style="text-decoration:none; color:black;">[prev]</a>')
								
							}							
							if(this.next){
								var a = this.endPage+1;
								console.log(a);
								$("#board").append('<a id="next" href="#" onclick="next('+a+')" style="text-decoration:none; color:black;">[next]</a>')
								
							}
						})
					}
				},
		        error: function(request,status,error){
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error
							);
				}
			});
		}
		function prev(a) {
			const target = document.getElementById('button_add');
			target.disabled = false;
			var cityArray = [];
			cityArray[0] = "";
			$('input[name="city_search"]:checked').each(function(i){			
				cityArray.push($(this).val());				
			});
			$.ajax({
				url: "./search",
				type: "POST",				
				data: {					
					name:$("#name_search").val(),
					purpose:$("#purpose_search").val(),
					radio:$('input[name=radio_search]:checked').val(),
					country:$("#country_search").val(),
					cityArray : cityArray,
					page : a
				},
				success: function(data) {
					$("#search").empty();
					$("#board").empty();
					var map = data[0];
					for(var key in map){
						$(map[key]).each(function(){						
							if(this.radio=="남") {
								$("#search").append('<tr bgcolor="#87CEFA">' + '<td>' + '<input type="checkbox" name="del_name" value="'+this.name+'">' + '</td>'
				                		+ '<td>'+this.name+'</td>' + '<td>'+this.purpose+'</td>' 
				                		+ '<td>'+this.radio+'</td>' + '<td>'+this.country+'</td>' 
				                		+ '<td>'+this.city+'</td>' + '</tr>');	
							}else {
								$("#search").append('<tr bgcolor="#CD5C5C">' + '<td>' + '<input type="checkbox" name="del_name" value="'+this.name+'">' + '</td>'
				                		+ '<td>'+this.name+'</td>' + '<td>'+this.purpose+'</td>' 
				                		+ '<td>'+this.radio+'</td>' + '<td>'+this.country+'</td>' 
				                		+ '<td>'+this.city+'</td>' + '</tr>');									
							}							
						})
					}
					var page = data[1];
					for(var key in page){
						$(page[key]).each(function(){	
							for(var i=this.startPage; i<=this.endPage; i++){								
								$("#board").append('<a id="page" href="#" onclick="page(this)" style="text-decoration:none; color:red;">['+i+']</a>')								
							}
							if(this.prev){	
								var a = this.startPage-1;
								console.log(a);
								$("#board").prepend('<a id="prev" href="#" onclick="prev('+a+')" style="text-decoration:none; color:black;">[prev]</a>')
								
							}							
							if(this.next){
								var a = this.endPage+1;
								console.log(a);
								$("#board").append('<a id="next" href="#" onclick="next('+a+')" style="text-decoration:none; color:black;">[next]</a>')
								
							}
						})
					}
				},
		        error: function(request,status,error){
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error
							);
				}
			});
		}
					
					
					/*
					for(var i=0; i<data[0].length; i++){
						
						if(data[0].search[i].radio=="남") {
							$("#search").append('<tr bgcolor="#87CEFA">' + '<td>' + '<input type="checkbox" name="del_name" value="'+data[0].search[i].name+'">' + '</td>'
	                		+ '<td>'+data[0].search[i].name+'</td>' + '<td>'+data[0].search[i].purpose+'</td>' 
	                		+ '<td>'+data[0].search[i].radio+'</td>' + '<td>'+data.grid_vo[i].country+'</td>' 
	                		+ '<td>'+data[0].search[i].city+'</td>' + '</tr>');	
						}else {
							$("#search").append('<tr bgcolor="#CD5C5C">' + '<td>' + '<input type="checkbox" name="del_name" value="'+data.grid_vo[i].name+'">' + '</td>'
			                		+ '<td>'+data.grid_vo[i].name+'</td>' + '<td>'+data.grid_vo[i].purpose+'</td>' 
			                		+ '<td>'+data.grid_vo[i].radio+'</td>' + '<td>'+data.grid_vo[i].country+'</td>' 
			                		+ '<td>'+data.grid_vo[i].city+'</td>' + '</tr>');	
							
						}
					}
					
					for(var i=data.pvo.startPage; i<=data.pvo.endPage; i++){
						
						$("#board").append('<a style="text-decoration:none; color:red;">['+i+']</a>')
						
					}
					if(data.pvo.prev){
						
						$("#board").prepend('<a style="text-decoration:none; color:black;">[prev]</a>')
						
					}
					
					if(data.pvo.next){
						
						$("#board").append('<a style="text-decoration:none; color:black;">[next]</a>')
						
					}
					*/
					
					
				/*	$("#search").empty();
					$(data).each(function(index, item) {
						if(item.radio=="남") {
							$('#search').append('<tr bgcolor="#87CEFA">' + '<td>' + '<input type="checkbox" name="del_name" value="' + item.name + '">' + '</td>'
			                		+ '<td>' + item.name + '</td>' + '<td>' + item.purpose + '</td>' 
			                		+ '<td>' + item.radio + '</td>' + '<td>' + item.country + '</td>' 
			                		+ '<td>' + item.city + '</td>' + '</tr>');	
							
						}else {							
							$('#search').append('<tr bgcolor="#CD5C5C">' + '<td>' + '<input type="checkbox" name="del_name" value="' + item.name + '">' + '</td>'
			                		+ '<td>' + item.name + '</td>' + '<td>' + item.purpose + '</td>' 
			                		+ '<td>' + item.radio + '</td>' + '<td>' + item.country + '</td>' 
			                		+ '<td>' + item.city + '</td>' + '</tr>');	
							
						}
					})
				*/

		function city_search() {
			$.ajax({
				url: "./city_search",
				type: "GET",
				data: {
					country:$("#country_search").val()					
				},
				success: function(data) {

					$("#Div").empty();
					$('#Div').prepend('<ul><li id="ccc"><input name="city_search_all" type="checkbox">전체</li></ul><div><input type="button" value="닫기" id="city_table_end"></div>');
					$(data).each(function(index, item) {

						$("#ccc").after('<li><input name="city_search" type="checkbox" value="'+item.city+'">'+item.city+'</li>');
						
					});
					
					
					
		        },
				error: function(){
					alert("err");
				}
			});
		}
		function city() {
			$.ajax({
				url: "./city",
				type: "GET",
				data: {
					country:$("#country").val()					
				},
				success: function(data) {

					$("#city_change").empty();
					$('#city_change').prepend('<select id="city3" name="city"><option>도시</option></select>'+
							'<div id="Div3" style="position:absolute; visibility:hidden; background-color:white;">'+
							'<ul><li id="cc"><input name="city_save_all" type="checkbox">전체</li></ul><div><input type="button" value="닫기" id="city4"></div></div>');
					$(data).each(function(index, item) {

						$("#cc").after('<li><input name="city_save" type="checkbox" value="'+item.city+'">'+item.city+'</li>');
						
					});
		        },
				error: function(){
					alert("err");
				}
			});
		}
		function del() {			
			var delArray = [];
			$('input[name="del_name"]:checked').each(function(i){				
				delArray.push($(this).val());	
			});			
			if(delArray.length>=1){				
				var objParams = {
						"del_name" : delArray
				}				
				$.ajax({
					url: "./del",
					type: "POST",
					data: {
						del_name : delArray				
					},
					success: function(data) {
						
						$('input[name="del_name"]:checked').closest('tr').remove();
						alert("삭제되었습니다.");
						
			        },
					error: function(request,status,error){
						alert("code = "+ request.status + " message = " + request.responseText + " error = " + error
								);
					}
				});
			}else {
								
				alert("선택해주세요.")

			}
		}

		function add() {
			
			$.ajax({
				url: "./add",
				type: "GET",				
				success: function(data) {
					const target = document.getElementById('button_add');
					target.disabled = true;
					$('#search').prepend('<tr id="add"><td><input type="checkbox" disabled="disabled"></td><td><input type="text" placeholder="아이디" id="name" style="width:100px;"></td>' + 
							'<td><select id="purpose">' +
							'<option value="">Combo Box</option>' +
							'<option value="관광">관광</option>' +
							'<option value="휴양">휴양</option></select></td>' +
							'<td><input type="radio" id="sex" name="sex" value="남" checked="checked">남' +
							'<input type="radio" id="sex" name="sex" value="여">여</td>' +
							'<td><select id="country" name="country"><option value="">국가</option><c:forEach var="cvo" items="${cvo}">' +
							'<option value="${cvo.country }">${cvo.country }</option></c:forEach></select></td>' +
							'<td id="city_change"><select id="city" name="city"><option>도시</option></select>' +
							'<div id="Div2" style="position:absolute; visibility:hidden; background-color:white;">');
							
							
		        },
				error: function(){
					alert("err");
				}
			});
		}
		function deselect() {
			$("input:radio[name='radio_search']").prop('checked', false);
		}
		function btnDisabled()  {
			  const target = document.getElementById('button_save');
			  target.disabled = true;
		};
		
		function national(value) {
			
			if(value=="kor") {
				$.ajax({
					url: "./",
					type: "GET",
					success: function(data) {
						main_kor.style.visibility="visible";
				     	main_eng.style.visibility="hidden";					
						
			        },
					error: function(){
						alert("err");
					}
				});
		     		
		    }else {
		    	$.ajax({
					url: "./",
					type: "GET",
					success: function(data) {
						main_kor.style.visibility="hidden";
				     	main_eng.style.visibility="visible";				
						
			        },
					error: function(){
						alert("err");
					}
				});
		    		
		    };
		}
		function city_select_eng(value) {

			if(value=="OPEN") {
		     	Div_eng.style.visibility="visible";
		    }else {
		    	Div_eng.style.visibility="hidden";	
		    };

		}
		function city_add_eng(value) {

			if(value=="OPEN") {				
		     	Div2_eng.style.visibility="visible";
		    }else {
		    	Div2_eng.style.visibility="hidden";	
		    };

		}
		function city_add2_eng(value) {

			if(value=="OPEN") {				
		     	Div3_eng.style.visibility="visible";
		    }else {
		    	Div3_eng.style.visibility="hidden";	
		    };

		}
		function save_eng() {

			var cityArray = [];
			$('input[name="city_save_eng"]:checked').each(function(i){			
				cityArray.push($(this).val());				
			});
			if($("#name_eng").val()=="" || $("#purpose_eng").val()=="" || cityArray.length==0) {
				alert("Please enter all");
			}else {	
				$.ajax({
					url: "./save_eng",
					type: "POST",
					data: {
							name:$("#name_eng").val(),
							purpose:$("#purpose_eng").val(),
							radio:$('input[name=sex_eng]:checked').val(),
							country:$("#country_eng").val(),
							cityArray : cityArray
					},
					success: function(data){
						const target = document.getElementById('button_add_eng');
						target.disabled = false;
						search_eng();						
						alert("Save done");
					},
					error: function(){
						alert("This ID already exists");
					}
				});				
			}			
		}
		function search_eng() {
			
			const target = document.getElementById('button_add_eng');
			target.disabled = false;
			var cityArray = [];
			cityArray[0] = "";
			$('input[name="city_search_eng"]:checked').each(function(i){			
				cityArray.push($(this).val());				
			});
			$.ajax({
				url: "./search_eng",
				type: "POST",				
				data: {					
					name:$("#name_search_eng").val(),
					purpose:$("#purpose_search_eng").val(),
					radio:$('input[name=radio_search_eng]:checked').val(),
					country:$("#country_search_eng").val(),
					cityArray : cityArray	
				},
				success: function(data) {
					$("#search").empty();
					$("#board").empty();
					var map = data[0];
					for(var key in map){
						$(map[key]).each(function(){						
							if(this.radio=="male") {
								$("#search").append('<tr bgcolor="#87CEFA">' + '<td>' + '<input type="checkbox" name="del_name_eng" value="'+this.name+'">' + '</td>'
				                		+ '<td>'+this.name+'</td>' + '<td>'+this.purpose+'</td>' 
				                		+ '<td>'+this.radio+'</td>' + '<td>'+this.country+'</td>' 
				                		+ '<td>'+this.city+'</td>' + '</tr>');	
							}else {
								$("#search").append('<tr bgcolor="#CD5C5C">' + '<td>' + '<input type="checkbox" name="del_name_eng" value="'+this.name+'">' + '</td>'
				                		+ '<td>'+this.name+'</td>' + '<td>'+this.purpose+'</td>' 
				                		+ '<td>'+this.radio+'</td>' + '<td>'+this.country+'</td>' 
				                		+ '<td>'+this.city+'</td>' + '</tr>');									
							}							
						})
					}
					var page = data[1];
					for(var key in page){
						$(page[key]).each(function(){	
							for(var i=this.startPage; i<=this.endPage; i++){								
								$("#board").append('<a id="page" href="#" onclick="page_eng(this)" style="text-decoration:none; color:red;">['+i+']</a>')								
							}
							if(this.prev){	
								var a = this.startPage-1;
								console.log(a);
								$("#board").prepend('<a id="prev" href="#" onclick="prev_eng('+a+')" style="text-decoration:none; color:black;">[prev]</a>')
								
							}							
							if(this.next){
								var a = this.endPage+1;
								console.log(a);
								$("#board").append('<a id="next" href="#" onclick="next_eng('+a+')" style="text-decoration:none; color:black;">[next]</a>')
								
							}
						})
					}
				},
		        error: function(request,status,error){
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error
							);
				}
			});
		}
		function page_eng(a) {
			var aa = $(a).text();
			var aaa = aa.replace("[","");
			var aaaa = aaa.replace("]","");
			const target = document.getElementById('button_add_eng');
			target.disabled = false;
			var cityArray = [];
			cityArray[0] = "";
			$('input[name="city_search_eng"]:checked').each(function(i){			
				cityArray.push($(this).val());				
			});
			$.ajax({
				url: "./search_eng",
				type: "POST",				
				data: {					
					name:$("#name_search_eng").val(),
					purpose:$("#purpose_search_eng").val(),
					radio:$('input[name=radio_search_eng]:checked').val(),
					country:$("#country_search_eng").val(),
					cityArray : cityArray,
					page : aaaa
				},
				success: function(data) {
					$("#search").empty();
					$("#board").empty();
					var map = data[0];
					for(var key in map){
						$(map[key]).each(function(){						
							if(this.radio=="male") {
								$("#search").append('<tr bgcolor="#87CEFA">' + '<td>' + '<input type="checkbox" name="del_name_eng" value="'+this.name+'">' + '</td>'
				                		+ '<td>'+this.name+'</td>' + '<td>'+this.purpose+'</td>' 
				                		+ '<td>'+this.radio+'</td>' + '<td>'+this.country+'</td>' 
				                		+ '<td>'+this.city+'</td>' + '</tr>');	
							}else {
								$("#search").append('<tr bgcolor="#CD5C5C">' + '<td>' + '<input type="checkbox" name="del_name_eng" value="'+this.name+'">' + '</td>'
				                		+ '<td>'+this.name+'</td>' + '<td>'+this.purpose+'</td>' 
				                		+ '<td>'+this.radio+'</td>' + '<td>'+this.country+'</td>' 
				                		+ '<td>'+this.city+'</td>' + '</tr>');									
							}							
						})
					}
					var page = data[1];
					for(var key in page){
						$(page[key]).each(function(){	
							for(var i=this.startPage; i<=this.endPage; i++){								
								$("#board").append('<a id="page" href="#" onclick="page_eng(this)" style="text-decoration:none; color:red;">['+i+']</a>')								
							}
							if(this.prev){	
								var a = this.startPage-1;
								console.log(a);
								$("#board").prepend('<a id="prev" href="#" onclick="prev_eng('+a+')" style="text-decoration:none; color:black;">[prev]</a>')
								
							}							
							if(this.next){
								var a = this.endPage+1;
								console.log(a);
								$("#board").append('<a id="next" href="#" onclick="next_eng('+a+')" style="text-decoration:none; color:black;">[next]</a>')
								
							}
						})
					}
				},
		        error: function(request,status,error){
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error
							);
				}
			});
		}
		function next_eng(a) {
			const target = document.getElementById('button_add_eng');
			target.disabled = false;
			var cityArray = [];
			cityArray[0] = "";
			$('input[name="city_search_eng"]:checked').each(function(i){			
				cityArray.push($(this).val());				
			});
			$.ajax({
				url: "./search_eng",
				type: "POST",				
				data: {					
					name:$("#name_search_eng").val(),
					purpose:$("#purpose_search_eng").val(),
					radio:$('input[name=radio_search_eng]:checked').val(),
					country:$("#country_search_eng").val(),
					cityArray : cityArray,	
					page : a
				},
				success: function(data) {
					$("#search").empty();
					$("#board").empty();
					var map = data[0];
					for(var key in map){
						$(map[key]).each(function(){						
							if(this.radio=="male") {
								$("#search").append('<tr bgcolor="#87CEFA">' + '<td>' + '<input type="checkbox" name="del_name_eng" value="'+this.name+'">' + '</td>'
				                		+ '<td>'+this.name+'</td>' + '<td>'+this.purpose+'</td>' 
				                		+ '<td>'+this.radio+'</td>' + '<td>'+this.country+'</td>' 
				                		+ '<td>'+this.city+'</td>' + '</tr>');	
							}else {
								$("#search").append('<tr bgcolor="#CD5C5C">' + '<td>' + '<input type="checkbox" name="del_name_eng" value="'+this.name+'">' + '</td>'
				                		+ '<td>'+this.name+'</td>' + '<td>'+this.purpose+'</td>' 
				                		+ '<td>'+this.radio+'</td>' + '<td>'+this.country+'</td>' 
				                		+ '<td>'+this.city+'</td>' + '</tr>');									
							}							
						})
					}
					var page = data[1];
					for(var key in page){
						$(page[key]).each(function(){	
							for(var i=this.startPage; i<=this.endPage; i++){								
								$("#board").append('<a id="page" href="#" onclick="page_eng(this)" style="text-decoration:none; color:red;">['+i+']</a>')								
							}
							if(this.prev){	
								var a = this.startPage-1;
								console.log(a);
								$("#board").prepend('<a id="prev" href="#" onclick="prev_eng('+a+')" style="text-decoration:none; color:black;">[prev]</a>')
								
							}							
							if(this.next){
								var a = this.endPage+1;
								console.log(a);
								$("#board").append('<a id="next" href="#" onclick="next_eng('+a+')" style="text-decoration:none; color:black;">[next]</a>')
								
							}
						})
					}
				},
		        error: function(request,status,error){
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error
							);
				}
			});
		}
		function prev_eng(a) {
			const target = document.getElementById('button_add_eng');
			target.disabled = false;
			var cityArray = [];
			cityArray[0] = "";
			$('input[name="city_search_eng"]:checked').each(function(i){			
				cityArray.push($(this).val());				
			});
			$.ajax({
				url: "./search_eng",
				type: "POST",				
				data: {					
					name:$("#name_search_eng").val(),
					purpose:$("#purpose_search_eng").val(),
					radio:$('input[name=radio_search_eng]:checked').val(),
					country:$("#country_search_eng").val(),
					cityArray : cityArray,
					page : a
				},
				success: function(data) {
					$("#search").empty();
					$("#board").empty();
					var map = data[0];
					for(var key in map){
						$(map[key]).each(function(){						
							if(this.radio=="male") {
								$("#search").append('<tr bgcolor="#87CEFA">' + '<td>' + '<input type="checkbox" name="del_name_eng" value="'+this.name+'">' + '</td>'
				                		+ '<td>'+this.name+'</td>' + '<td>'+this.purpose+'</td>' 
				                		+ '<td>'+this.radio+'</td>' + '<td>'+this.country+'</td>' 
				                		+ '<td>'+this.city+'</td>' + '</tr>');	
							}else {
								$("#search").append('<tr bgcolor="#CD5C5C">' + '<td>' + '<input type="checkbox" name="del_name_eng" value="'+this.name+'">' + '</td>'
				                		+ '<td>'+this.name+'</td>' + '<td>'+this.purpose+'</td>' 
				                		+ '<td>'+this.radio+'</td>' + '<td>'+this.country+'</td>' 
				                		+ '<td>'+this.city+'</td>' + '</tr>');									
							}							
						})
					}
					var page = data[1];
					for(var key in page){
						$(page[key]).each(function(){	
							for(var i=this.startPage; i<=this.endPage; i++){								
								$("#board").append('<a id="page" href="#" onclick="page_eng(this)" style="text-decoration:none; color:red;">['+i+']</a>')								
							}
							if(this.prev){	
								var a = this.startPage-1;
								console.log(a);
								$("#board").prepend('<a id="prev" href="#" onclick="prev_eng('+a+')" style="text-decoration:none; color:black;">[prev]</a>')
								
							}							
							if(this.next){
								var a = this.endPage+1;
								console.log(a);
								$("#board").append('<a id="next" href="#" onclick="next_eng('+a+')" style="text-decoration:none; color:black;">[next]</a>')
								
							}
						})
					}
				},
		        error: function(request,status,error){
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error
							);
				}
			});
		}

		function city_search_eng() {
			$.ajax({
				url: "./city_search_eng",
				type: "GET",
				data: {
					country:$("#country_search_eng").val()					
				},
				success: function(data) {

					$("#Div_eng").empty();
					$('#Div_eng').prepend('<ul><li id="ccc_eng"><input name="city_search_all_eng" type="checkbox">전체</li></ul><div><input type="button" value="닫기" id="city_table_end_eng"></div>');
					$(data).each(function(index, item) {

						$("#ccc_eng").after('<li><input name="city_search_eng" type="checkbox" value="'+item.city+'">'+item.city+'</li>');
						
					});
					
					
					
		        },
				error: function(){
					alert("err");
				}
			});
		}
		function city_eng() {
			$.ajax({
				url: "./city_eng",
				type: "GET",
				data: {
					country:$("#country_eng").val()					
				},
				success: function(data) {

					$("#city_change_eng").empty();
					$('#city_change_eng').prepend('<select id="city3_eng" name="city"><option>city</option></select>'+
							'<div id="Div3_eng" style="position:absolute; visibility:hidden; background-color:white;">'+
							'<ul><li id="cc_eng"><input name="city_save_all_eng" type="checkbox">전체</li></ul><div><input type="button" value="닫기" id="city4"></div></div>');
					$(data).each(function(index, item) {

						$("#cc_eng").after('<li><input name="city_save_eng" type="checkbox" value="'+item.city+'">'+item.city+'</li>');
						
					});
		        },
				error: function(){
					alert("err");
				}
			});
		}
		function del_eng() {			
			var delArray = [];
			$('input[name="del_name_eng"]:checked').each(function(i){				
				delArray.push($(this).val());	
			});			
			if(delArray.length>=1){				
				var objParams = {
						"del_name" : delArray
				}				
				$.ajax({
					url: "./del_eng",
					type: "POST",
					data: {
						del_name : delArray				
					},
					success: function(data) {
						
						$('input[name="del_name_eng"]:checked').closest('tr').remove();
						alert("Delete done.");
						
			        },
					error: function(request,status,error){
						alert("code = "+ request.status + " message = " + request.responseText + " error = " + error
								);
					}
				});
			}else {
								
				alert("choice please.")

			}
		}

		function add_eng() {
			
			$.ajax({
				url: "./add_eng",
				type: "GET",				
				success: function(data) {
					const target = document.getElementById('button_add_eng');
					target.disabled = true;
					$('#search_eng').prepend('<tr id="add_eng"><td><input type="checkbox" disabled="disabled"></td><td><input type="text" placeholder="ID" id="name_eng" style="width:100px;"></td>' + 
							'<td><select id="purpose_eng">' +
							'<option value="">Combo Box</option>' +
							'<option value="tourism">tourism</option>' +
							'<option value="tourism">travel</option></select></td>' +
							'<td><input type="radio" id="sex_eng" name="sex_eng" value="male" checked="checked">male' +
							'<input type="radio" id="sex_eng" name="sex_eng" value="female">female</td>' +
							'<td><select id="country_eng" name="country_eng"><option value="">country</option><c:forEach var="cvo_eng" items="${cvo_eng}">' +
							'<option value="${cvo_eng.country }">${cvo_eng.country }</option></c:forEach></select></td>' +
							'<td id="city_change_eng"><select id="city_eng" name="city_eng"><option>city</option></select>' +
							'<div id="Div2_eng" style="position:absolute; visibility:hidden; background-color:white;">');
							
							
		        },
				error: function(){
					alert("err");
				}
			});
		}
		function deselect() {
			$("input:radio[name='radio_search_eng']").prop('checked', false);
		}
		function btnDisabled_eng()  {
			  const target = document.getElementById('button_save_eng');
			  target.disabled = true;
		};
	</script>
</body>
</html>
