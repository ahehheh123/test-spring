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
	<div class="top">
		<div class="top-left">		
			<h1>Grid그리드2</h1>
		</div>
		<div class="top-right">
			<div class="top-boxes">
				<input type="radio" id="kor" name="radio_search_national" value="kor">kor
			</div>
			<div class="top-boxes">
				<input type="radio" id="eng" name="radio_search_national" value="eng" checked="checked">eng
			</div>		
		</div>
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
				<tbody id="search_eng">

				</tbody>
			</table>
		</div>
		<div id="board_eng">
		</div>
	</div>		
		<script>
		$(document).ready(function () {
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
		/*
		function all() {
			$.ajax({
				url: "./all",
				type: "GET",
				success: function(data) {
					$("#label").empty();
					$("#thead").empty();
					$("#search").empty();
					$("#label").prepend('<input type="checkbox" value="Check Box">');
					$("#thead").prepend('<th>choice</th><th>ID</th><th>purpose</th>' +
										'<th>sex</th><th>country</th><th>city</th>')
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
		*/
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
					$("#search_eng").empty();
					$("#board_eng").empty();
					var map = data[0];
					for(var key in map){
						$(map[key]).each(function(){						
							if(this.radio=="male") {
								$("#search_eng").append('<tr bgcolor="#87CEFA">' + '<td>' + '<input type="checkbox" name="del_name_eng" value="'+this.name+'">' + '</td>'
				                		+ '<td>'+this.name+'</td>' + '<td>'+this.purpose+'</td>' 
				                		+ '<td>'+this.radio+'</td>' + '<td>'+this.country+'</td>' 
				                		+ '<td>'+this.city+'</td>' + '</tr>');	
							}else {
								$("#search_eng").append('<tr bgcolor="#CD5C5C">' + '<td>' + '<input type="checkbox" name="del_name_eng" value="'+this.name+'">' + '</td>'
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
								$("#board_eng").append('<a id="page" href="#" onclick="page_eng(this)" style="text-decoration:none; color:red;">['+i+']</a>')								
							}
							if(this.prev){	
								var a = this.startPage-1;
								console.log(a);
								$("#board_eng").prepend('<a id="prev" href="#" onclick="prev_eng('+a+')" style="text-decoration:none; color:black;">[prev]</a>')
								
							}							
							if(this.next){
								var a = this.endPage+1;
								console.log(a);
								$("#board_eng").append('<a id="next" href="#" onclick="next_eng('+a+')" style="text-decoration:none; color:black;">[next]</a>')
								
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
					$("#search_eng").empty();
					$("#board_eng").empty();
					var map = data[0];
					for(var key in map){
						$(map[key]).each(function(){						
							if(this.radio=="male") {
								$("#search_eng").append('<tr bgcolor="#87CEFA">' + '<td>' + '<input type="checkbox" name="del_name_eng" value="'+this.name+'">' + '</td>'
				                		+ '<td>'+this.name+'</td>' + '<td>'+this.purpose+'</td>' 
				                		+ '<td>'+this.radio+'</td>' + '<td>'+this.country+'</td>' 
				                		+ '<td>'+this.city+'</td>' + '</tr>');	
							}else {
								$("#search_eng").append('<tr bgcolor="#CD5C5C">' + '<td>' + '<input type="checkbox" name="del_name_eng" value="'+this.name+'">' + '</td>'
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
								$("#board_eng").append('<a id="page" href="#" onclick="page_eng(this)" style="text-decoration:none; color:red;">['+i+']</a>')								
							}
							if(this.prev){	
								var a = this.startPage-1;
								console.log(a);
								$("#board_eng").prepend('<a id="prev" href="#" onclick="prev_eng('+a+')" style="text-decoration:none; color:black;">[prev]</a>')
								
							}							
							if(this.next){
								var a = this.endPage+1;
								console.log(a);
								$("#board_eng").append('<a id="next" href="#" onclick="next_eng('+a+')" style="text-decoration:none; color:black;">[next]</a>')
								
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
					$("#search_eng").empty();
					$("#board_eng").empty();
					var map = data[0];
					for(var key in map){
						$(map[key]).each(function(){						
							if(this.radio=="male") {
								$("#search_eng").append('<tr bgcolor="#87CEFA">' + '<td>' + '<input type="checkbox" name="del_name_eng" value="'+this.name+'">' + '</td>'
				                		+ '<td>'+this.name+'</td>' + '<td>'+this.purpose+'</td>' 
				                		+ '<td>'+this.radio+'</td>' + '<td>'+this.country+'</td>' 
				                		+ '<td>'+this.city+'</td>' + '</tr>');	
							}else {
								$("#search_eng").append('<tr bgcolor="#CD5C5C">' + '<td>' + '<input type="checkbox" name="del_name_eng" value="'+this.name+'">' + '</td>'
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
								$("#board_eng").append('<a id="page" href="#" onclick="page_eng(this)" style="text-decoration:none; color:red;">['+i+']</a>')								
							}
							if(this.prev){	
								var a = this.startPage-1;
								console.log(a);
								$("#board_eng").prepend('<a id="prev" href="#" onclick="prev_eng('+a+')" style="text-decoration:none; color:black;">[prev]</a>')
								
							}							
							if(this.next){
								var a = this.endPage+1;
								console.log(a);
								$("#board_eng").append('<a id="next" href="#" onclick="next_eng('+a+')" style="text-decoration:none; color:black;">[next]</a>')
								
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
					$("#search_eng").empty();
					$("#board_eng").empty();
					var map = data[0];
					for(var key in map){
						$(map[key]).each(function(){						
							if(this.radio=="male") {
								$("#search_eng").append('<tr bgcolor="#87CEFA">' + '<td>' + '<input type="checkbox" name="del_name_eng" value="'+this.name+'">' + '</td>'
				                		+ '<td>'+this.name+'</td>' + '<td>'+this.purpose+'</td>' 
				                		+ '<td>'+this.radio+'</td>' + '<td>'+this.country+'</td>' 
				                		+ '<td>'+this.city+'</td>' + '</tr>');	
							}else {
								$("#search_eng").append('<tr bgcolor="#CD5C5C">' + '<td>' + '<input type="checkbox" name="del_name_eng" value="'+this.name+'">' + '</td>'
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
								$("#board_eng").append('<a id="page" href="#" onclick="page_eng(this)" style="text-decoration:none; color:red;">['+i+']</a>')								
							}
							if(this.prev){	
								var a = this.startPage-1;
								console.log(a);
								$("#board_eng").prepend('<a id="prev" href="#" onclick="prev_eng('+a+')" style="text-decoration:none; color:black;">[prev]</a>')
								
							}							
							if(this.next){
								var a = this.endPage+1;
								console.log(a);
								$("#board_eng").append('<a id="next" href="#" onclick="next_eng('+a+')" style="text-decoration:none; color:black;">[next]</a>')
								
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
						"del_name_eng" : delArray
				}				
				$.ajax({
					url: "./del_eng",
					type: "POST",
					data: {
						del_name_eng : delArray				
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
