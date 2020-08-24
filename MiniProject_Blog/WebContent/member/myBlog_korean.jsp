<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JUNG BLOG</title>
	<link rel="shortcut icon" href="img/favicon.ico">
	<link rel="icon" href="img/favicon.ico">
	<style>
		.loading {
   		 	width:100%;
    		height:100%;
    		position:fixed;
    		left:0px;
    		top:0px;
    		background:#fff;
    		z-index: 9999;
		}
		
		body {
        	margin: 0px;
        	padding: 0px;
        	width: 100%;
        	height: auto;
      	}
      	
      	h1 {
      		text-align: center;
      		font-weight: bold;
      		font-size: 30px;
      	}
      	
      	.hrAll {
      		width: 350px;
      		margin: 0 auto;
      	}
      	
      	.blog_fixed {
        	position: fixed;
        	z-index: 9999;
        	background-color: black;
        	top: 0px;
      	}
		
		.header_language {
			width: 100%;
			float: left;
			background-color: black;
      	}
      	
      	.header_language button {
      		background-color: black;
      		color: white;
			border: none;
			outline: 0;
			cursor: pointer;
		}
		
		.header_login {
			float: right;
			color: white;
			padding-right: 10px;
		}
      	
      	.header_login a {
			text-decoration: none;
			color: white;
			font-size: 13px;
		}
      	
      	.header_menu {
        	width: 100%;
        	background-color: black;
        	text-align: center;
       		padding: 10px 0px;
      	}
      	
      	.header_menu ul li {
      		display: inline;
      		list-style: none;
      		padding: 0 15px;
      	}
      	
      	.header_menu li a {
      		color: white;
      		text-decoration: none
      	}
      	
      	a:hover, button:hover {
      		font-weight: bold;
      	}
      	
        .section_home {
        	width: 100%;
        	height: 1000px;
        	margin-top : 0;
        }
        
		.mySlides {
			display: none;
		}
		
		.mySlides img {
			width: 100%;
			height: 900px;
			vertical-align: middle;
		}

		.slideshow-container {
  			width: 100%;
  			height: 900px;
  			margin: auto;
		}
		
		.mainLogo {
			margin-top: -700px;
			position: absolute;
			width: 100%;
			height: 400px;
			color: white;
			text-align: center;
			font-size: 50px;
			font-weight: bold;
		}
		
		.mainLogo hr {
			color: white;
			width: 800px;
		}
		
		.mainLogo b {
			font-size: 25px;
		}
		
		.textBoxAll {
      		margin-top: -340px;
      		margin-left: -170px;
      		width: 100%;
      		height: 200px;
      		color: white;
      		text-align: center;
      	}
      	
      	.textBoxAll ul li {
      		display: inline-block;
      		list-style: none;
      		padding: 0 150px;
      	}
      	
      	.textBox {
      		position: absolute;
      		width: 300px;
      		height: 150px;
      		border-radius: 15px 15px 15px 15px;
      		background-color: rgba( 0, 0, 0, 0.5 );
      	}
      	
      	.textBox img {
      		float: left;
      		padding-top: 10px;
      		padding-left: 15px;
      	} 
      	
      	.textBoxTitle {
      		float: right;
      		padding-top: 28px;
      		padding-right: 42px;
      		font-size: 18px;
      		font-weight: bold;
      	}
      	
      	.textBoxContent {
      		clear: both;
      		padding: 2px 0 0 0; 
      		text-align: center;
      	}
      	
      	.slideDot {
      		margin-top: -25px;
      		width: 100%;
      		height: 250px;
      	}

		.dot {
  			width: 30px;
  			height: 30px;
 			margin: 180px 4px;
  			background-color: #bbb;
  			border-radius: 50%;
  			display: inline-block;
  			transition: background-color 0.6s ease;
		}

		.active {
  			background-color: #717171;
		}

		.fade {
  			-webkit-animation-name: fade;
  			-webkit-animation-duration: 1.5s;
  			animation-name: fade;
  			animation-duration: 1.5s;
		}
	
		@-webkit-keyframes fade {
  			from {opacity: .4} 
  			to {opacity: 1}
		}

		@keyframes fade {
  			from {opacity: .4} 
  			to {opacity: 1}
		}

		@media only screen and (max-width: 300px) {
  			.text {font-size: 11px}
		}
		
		.section_aboutMe {
			width: 100%;
        	height: 630px;
		}
		
		.section_aboutMe_main {
			width: 100%;
			height: 600px;
			text-align: center;
		}
		
		.section_aboutMe_main img {
			padding-top: 30px;
		}
		
		.section_aboutMe_introduce {
			width: 23%;
			height: 200px;
			text-align: center;
			margin: auto;
			margin-top: -500px;
			margin-bottom: 300px;
			background-color: rgba( 0, 0, 0, 0.0 );
		}
		
		#modal_opne_btn {
			border: none;
			width: 50px;
			height: 50px;
			padding-top: 80px;
			padding-left: 70px;
		}
		
		#modal_close_btn {
			background-color: white;
			border: 1px solid black;
			border-radius: 15px 15px 15px 15px;
		}
		
		#modal {
			display: none;
  			position: relative;
 	 		width: 100%;
  			height: 100%;
  			z-index: 1;
		}

		.modal_content {
  			width: 400px;
  			height: auto;
  			margin: 0 auto;
  			padding: 20px 25px;
  			background: #fff;
  			border: 2px solid #666;
		}

		.modal_layer {
  			position:fixed;
  			top:0;
  			left:0;
 	 		width:100%;
  			height:100%;
  			background:rgba(0, 0, 0, 0.5);
  			z-index:-1;
		}
		
		.section_aboutMe_Writing01 {
			width: 100%;
			height: 130px;
			color: black;
		}
		
		.section_aboutMe_Writing02 {
			margin-top: -130px;
			text-align: center;
		}
		
		.section_aboutMe_Writing02 b {
			font-size: 20px;
		}
		
		.section_myInterest {
			width: 100%;
        	height: 850px;
		}
		
		.section_myInterest_main {
			width: 100%;
			height: 600px;
		}
		
		.section_myInterest_main_photo {
			text-align: center;
			margin-top: 50px;
		}
		
		.section_myInterest_main_photo img {
			border-radius: 15px 15px 15px 15px;
		}
		
		.section_myInterest_list {
			width: 100%;
			height: 50px;
        	text-align: center;
        	margin-top: 20px;
		}
		
		.section_myInterest_list ul {
			padding-top: 15px;
			padding-left: 0;
		}
		
		.section_myInterest_list ul li {
			list-style: none;
			display: inline-block;
			padding: 0 12px;
			font-weight: bold;
			font-size: 20px;
		}
		
		.section_myInterest_list ul li button {
			background-color: white;
			border: none;
			outline: 0;
			font-size: 20px;
		}
		
		.section_myInterest_contents {
			padding-top: 18px;
			text-align: center;
		}
		
		.section_myPortFolio {
			width: 100%;
			height:auto;
        	overflow:hidden;
		}
		
		.section_myPortFolio_introduce {
			width: 100%;
			height: 50px;
			text-align: center;
			margin: 0 auto;
			margin-top: 30px;
		}
		
		.section_myPortFolio_main {
			width: 100%;
			height: auto;
			text-align: center;
			margin: 0 auto;
			margin-top: 30px;
		}
		
		.section_myPortFolio_div1, 
		.section_myPortFolio_div2, 
		.section_myPortFolio_div3, 
		.section_myPortFolio_div4 {
			width: 400px;
			height: 50px;
			margin: 0 auto;
			text-align: center;
			background-color: black;
			color: white;
			cursor: pointer;
			font-size: 18px;
			padding-top: 20px;
			margin-top: 10px;
		}
		
		.section_myPortFolio_content1
		.section_myPortFolio_content2
		.section_myPortFolio_content3
		.section_myPortFolio_content4 {
			width: 400px;
			height: auto;
			margin: 0 auto;
		}
		
		.section_myPortFolio_main button {
			border: 1px solid black;
			outline: 0;
			background-color: white;
			font-size: 15px;
		}
		
		.section_contactMe {
			width: 100%;
        	height: 500px;
        	margin-top: 30px;
		}
		
		.section_contactMe_content {
			width: 100%;
			height: 30px;
			padding-top: 15px;
			margin: 0 auto;
        	text-align: center;
		}
		
		.section_contactMe_main {
			width: 100%;
        	height: 345px;
        	padding-top: 35px;
        	margin: 0 auto;
        	text-align: center;
		}
		
		.section_contactMe01 {
			display: inline-block;
			padding: 20px 10px; 
		}
		
		.section_contactMe02 {
			padding-top: 20px;
		}
		
		.section_contactMe_button {
			padding-top: 20px;
		}
		
		.section_contactMe_button input {
			background-color: white;
			border: 1px solid black;
			border-radius: 15px 15px 15px 15px;
			font-size: 15px;
		}
		
		.section_contactMe_button input:hover {
			font-weight: bold;
		}
		
		.footer {
			width: 100%;
			height: 220px;
			background-color: black;
		}
		
		.footer_icon_div {
			padding-top: 50px;
			width: 100%;
			height: 30px;
			text-align: center;
		}
		
		.footer_icon_div ul {
			padding-left: 160px;
		}
		
		.footer_icon_div ul li {
			list-style: none;
			display: inline-block;
			padding: 0 5px;
		}
		
		.footer_content {
			padding-top: 30px;
			width: 100%;
			height: 20px;
			color: white;
			text-align: center;
			font-size: 15px;
		}
		
		.footer_content span {
			color: yellow;
		}
		
		.footer_topBtn_div {
			padding-top: 10px;
			width: 100%;
			height: 20px;
		}
		
		#topBtn {
  			margin: 0 auto;
  			width: 40px;
  			height: 40px;
  			line-height: 40px;
  			display: block;
  			background: black;
  			color: white;
  			font-size: 35px;
  			text-align: center;
  			border-radius: 5px;
		}
		
	</style>
	<script src="http://code.jquery.com/jquery-3.5.1.js"></script> 
	<script>
		$(document).ready(function() {
			$('#btn_k').click(function() {
				$(location).attr('href','BlogKorean.me');
			});
		
			$('#btn_e').click(function() {
				$(location).attr('href','BlogEnglish.me');
			});
			
			$('#go_login').click(function() {
				$(location).attr('href','MemberLogin.me');
			});
			
			$('#go_signUp').click(function() {
				$(location).attr('href','MemberJoin.me');
			});
			
		});	
	
		$( document ).ready( function() {
			$(".loading").fadeOut();
	        var jbOffset = $( ".header_menu" ).offset();
	        $( window ).scroll( function() {
	          if ( $( document ).scrollTop() > jbOffset.top ) {
	            $(".header_menu").addClass("blog_fixed");
	          }
	          else {
	            $(".header_menu").removeClass("blog_fixed");
	          }
	        });
	    });
		
		var slideIndex = 0;
		
		$( document ).ready( function() {
			showSlides();
		});

		function showSlides() {
		    var i;
		    var slides = document.getElementsByClassName("mySlides");
		    var dots = document.getElementsByClassName("dot");
		    for (i = 0; i < slides.length; i++) {
		       slides[i].style.display = "none";  
		    }
		    slideIndex++;
		    if (slideIndex > slides.length) {slideIndex = 1}    
		    for (i = 0; i < dots.length; i++) {
		        dots[i].className = dots[i].className.replace(" active", "");
		    }
		    slides[slideIndex-1].style.display = "block";  
		    dots[slideIndex-1].className += " active";
		    setTimeout(showSlides, 4000); 
		}
		
		$(document).ready(function() {
			$("#modal_opne_btn").click(function(){
			    $("#modal").fadeIn();
			});

			$("#modal_close_btn").click(function(){
			    $("#modal").fadeOut();
			});
		});
		
		$(document).ready(function(){
			$(".btn1").on("click",function(){
				$(".photo img").attr({"src":"img/interest1.jpg"});
			});
		
			$(".btn2").on("click",function(){
				$(".photo img").attr({"src":"img/interest2.jpg"});
			});
			
			$(".btn3").on("click",function(){
				$(".photo img").attr({"src":"img/interest3.jpg"});
			});
			
			$(".btn4").on("click",function(){
				$(".photo img").attr({"src":"img/interest4.jpg"});
			});
		});
		
		$(document).ready(function(){
			var topEle = $('#topBtn');
			var delay = 500;
		
			topEle.on('click', function() {
		  		$('html, body').stop().animate({scrollTop: 0}, delay);
			});
		});
		
		$(document).ready( function() {
			$('.section_myPortFolio_div1').click( function() {
	    		$('.section_myPortFolio_content1').slideToggle(500);
 			});
	    });
		
		$(document).ready( function() {
			$('.section_myPortFolio_div2').click( function() {
	    		$('.section_myPortFolio_content2').slideToggle(500);
 			});
	    });
		
		$(document).ready( function() {
			$('.section_myPortFolio_div3').click( function() {
	    		$('.section_myPortFolio_content3').slideToggle(500);
 			});
	    });
		
		$(document).ready( function() {
			$('.section_myPortFolio_div4').click( function() {
	    		$('.section_myPortFolio_content4').slideToggle(500);
 			});
	    });
	</script>
</head>
<body>
	<div class="loading">
	</div>
	<header>
		<div class="header_language">
			<button id="btn_k">한국어</button>
			<button id="btn_e">English</button>
			<div class="header_login">
			<%
				String id = null;

				if(session.getAttribute("id") != null) {
					id = (String)session.getAttribute("id");
					out.println("<b>" + id + "님 환영합니다!</b>");
					if(id.equals("admin")) {
						out.println("<a href='MemberListAction.me'>회원관리</a>");
					} else {
						out.println("<a>내 정보</a>");
					}
					out.println("<a href='MemberLogoutAction.me'>로그아웃</a>");
				} else if(session.getAttribute("id") == null) {
					out.println("<button id='go_login'>로그인</button>");
					out.println("<button id='go_signUp'>회원가입</button>");
				}
			%>
			</div>
    	</div>
    	<div class="header_menu">
      		<ul>
      			<li><a href="#HOME">홈</a></li>
      			<li><a href="#ABOUT ME">내 정보</a></li>
      			<li><a href="#MY INTEREST">관심사</a></li>
      			<li><a href="#MY PORTFOLIO">포트폴리오</a></li>
      			<li><a href="BoardList.bo">게시판</a></li>
      			<li><a href="#CONTECT ME">연락주세요</a></li>
      		</ul>
    	</div>
	</header>
	<section id="HOME">
		<div class="section_home">
			<div class="slideshow-container">
				<div class="mySlides fade">
					<img src="img/1.png">
				</div>
				<div class="mySlides fade">
					<img src="img/2.png">
				</div>
				<div class="mySlides fade">
					<img src="img/3.png">
				</div>
				<div class="mainLogo">
					<hr>
					<span>JUNG BLOG에 오신걸 환영합니다!</span><br>
					<span>누구나 환영합니다.</span>
					<hr>
					<b>MADE BY JUNG</b>
				</div>
				<div class="textBoxAll">
					<ul>
						<li>
							<div class="textBox">
								<img src="img/icon_coffee.png" width="50" height="50">
								<div class="textBoxTitle">
									<span>편안하게 즐기세요!</span>
								</div>
								<div class="textBoxContent">
									<p>밤을 파란 가득 멀리 우는 때 까닭입니다. 프랑시스 라이너 그리워 쓸쓸함과 까닭입니다. 
									</p>
								</div>
							</div>
						</li>
						<li>
							<div class="textBox">
								<img src="img/icon_share.png" width="50" height="50">
								<div class="textBoxTitle">
									<span>정보를 공유해요.</span>
								</div>
								<div class="textBoxContent">
									<p>밤을 파란 가득 멀리 우는 때 까닭입니다. 프랑시스 라이너 그리워 쓸쓸함과 까닭입니다. 
									</p>
								</div>
							</div>
						</li>
						<li>
							<div class="textBox">
								<img src="img/icon_mail.png" width="50" height="50">
								<div class="textBoxTitle">
									<span>저와 함께 소통해요.</span>
								</div>
								<div class="textBoxContent">
									<p>밤을 파란 가득 멀리 우는 때 까닭입니다. 프랑시스 라이너 그리워 쓸쓸함과 까닭입니다. 
									</p>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div class="slideDot" style="text-align: center">
					<span class="dot"></span> 
					<span class="dot"></span> 
					<span class="dot"></span>
				</div>
			</div>
		</div>
	</section>
	<section>
		<div class="section_aboutMe">
			<div id="ABOUT ME"><h1>내 정보</h1></div>
			<div class="hrAll"><hr></div>
			<div class="section_aboutMe_main">
				<img src="img/com.png" width="600" height="400">
			</div>
			<div class="section_aboutMe_introduce">
				<img src="img/icon_txt.png" id="modal_opne_btn" style="cursor:pointer">
				<div id="modal">
    				<div class="modal_content">
						<table>
							<tr>
								<th colspan="4" rowspan="5"><img src="img/JUNG.jpg" 
									width="150" height="200">
								</th>
								<th>이름</th>
								<td>정승헌</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>1994.11.15</td>
							</tr>
							<tr>
								<th>직업</th>
								<td>학생</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>서울 노원구</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>rmaqhql@naver.com</td>
							</tr>
						</table>
						<button type="button" id="modal_close_btn">닫기</button>
    				</div>
    				<div class="modal_layer">
    				</div>
				</div>
			</div>
			<div class="section_aboutMe_Writing01">
				<div class="section_aboutMe_Writing02">
					<b>파일을 눌러보세요.</b><br><br>
					<span>재미있는 일이 일어날 것입니다!</span>
				</div>
			</div>
		</div>		
	</section>
	<section>
		<div class="section_myInterest">
			<div id="MY INTEREST"><h1>관심사</h1></div>
			<div class="hrAll"><hr></div>
			<div class="section_myInterest_main_photo">
				<div class="photo">
    	 			<img src="img/interest1.jpg" width="800" height="600">
   				</div>
   			</div>
   			<div class="section_myInterest_list">
   				<ul>
					<li><button class="btn1" style="cursor:pointer">해외여행</button></li>
					<li><button class="btn2" style="cursor:pointer">축구</button></li>
					<li><button class="btn3" style="cursor:pointer">음식</button></li>
					<li><button class="btn4" style="cursor:pointer">운동</button></li>
				</ul>
			</div>
			<div class="section_myInterest_contents">
				<span>내 관심사를 선택하세요!</span>
			</div>
		</div>
	</section>
	<section>
		<div class="section_myPortFolio">
			<div id="MY PORTFOLIO"><h1>포트폴리오</h1></div>
			<div class="hrAll"><hr></div>
			<div class="section_myPortFolio_introduce">
				<p>나의 포트폴리오입니다. 충분하지 않지만,<br>
				  고쳐야 할 부분에 대한 연락을 주시면 감사합니다.
				</p>
			</div>
			<div class="section_myPortFolio_main">
				<div class="section_myPortFolio_div1">
					<strong>&#43; 도서관 프로그램</strong>
				</div>
				<div class="section_myPortFolio_content1" style="display:none">
					<br><b>사용한 언어</b><br><br>
					<span>1. JAVA</span><br>
					<span>2. ORACLE</span><br><br>
					<span>간단한 도서 대여 프로그램 입니다.</span><br><br>
					<button style="cursor:pointer">GO!</button><br><br>
				</div>
				<div class="section_myPortFolio_div2">
					<strong>&#43; 나의 이력서</strong>
				</div>
				<div class="section_myPortFolio_content2" style="display:none">
					<br><b>사용한 언어</b><br><br>
					<span>1. HTML5</span><br>
					<span>2. CSS3</span><br><br>
					<span>간단하게 나의 이력서를 만들어보았습니다.</span><br><br>
					<button style="cursor:pointer"
					         onclick="location.href='./member/myResume.html'">
					         GO!
					</button><br><br>
				</div>
				<div class="section_myPortFolio_div3">
					<strong>&#43; 준비중</strong>
				</div>
				<div class="section_myPortFolio_content3" style="display:none">
					<br><b>사용한 언어</b><br><br>
					<button style="cursor:pointer">GO!</button><br><br>
				</div>
				<div class="section_myPortFolio_div4">
					<strong>&#43; 준비중</strong>
				</div>
				<div class="section_myPortFolio_content4" style="display:none">
					<br><b>사용한 언어</b><br><br>
					<button style="cursor:pointer">GO!</button><br><br>
				</div>
			</div>
		</div>
	</section>
	<section>
		<div class="section_contectMe">
			<div id="CONTECT ME"><h1>연락주세요</h1></div>
			<div class="hrAll"><hr></div>
			<div class="section_contactMe_content">
				<p>
					질문이나 의견이 있으시면 연락주세요!<br>
					나의 이메일은 'rmaqhql@naver.com' 입니다.
				</p>
			</div>
			<div class="section_contactMe_main">
				<form action="sendMail.jsp" method="post">
					<div class="section_contactMe01">
						 <input type="text" name="subject" 
                                style="width:300px;height:40px;" placeholder=" 제목"/>
					</div>
					<div class="section_contactMe01">
						<input type="text" name="from" 
						       style="width:300px;height:40px;" placeholder=" 보낸 사람"/>
					</div>
					<div class="section_contactMe01">
						<input type="text" name="to" 
						       style="width:300px;height:40px;" placeholder=" 받는 사람"/>
					</div>
					<div class="section_contactMe02">
						 <textarea rows="5" cols="30" name="content" 
						           style="width:960px;height:150px;" placeholder=" 내용"></textarea>
					</div>
					<div class="section_contactMe_button">
						<input type="submit" name="button" value="전송" style="cursor:pointer">
					</div>
				</form>
			</div>
		</div>
	</section>
	<footer>
		<div class="footer">
			<div class="footer_icon_div">
				<ul>
					<li><img src="img/icon_facebook.png" width="25" height="25"></li>
					<li><img src="img/icon_twitter.png" width="25" height="25"></li>
					<li><img src="img/icon_insta.png" width="25" height="25"></li>
					<li><img src="img/icon_youtube.png" width="30" height="25"></li>
				</ul>
			</div>
			<div class="footer_content">
				<b>Designed by 2020</b><span> 정승헌</span>
			</div>
			<div class="footer_topBtn_div">
  				<span id="topBtn" style="cursor:pointer">&#94;</span>
			</div>
		</div>
	</footer>
</body>
</html>