<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>BOAT</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <meta name="_csrf" content="${_csrf.token }">
  	<meta name="_csrf_header" content="${_csrf.headerName }">
    
	<jsp:include page="headertag.jsp"/>
    <jsp:include page="process_bar.jsp"/>

<script>
	$(function(){
		$("#logout").click(function(event){
			event.preventDefault();
			$("form[name=logout]").submit();
		})
		
		$("#snslogout").click(function(event){
			event.preventDefault();
			$("form[name=snslogout]").submit();
		})
		
		var username = "${pinfo.username}";
		if (username != null) {
			$('.username').hide();
		}
        var attTime = $('#attTime').text();
        if(attTime!=''){
            $('#attColor').css('background','#40cf2f')
        }else{
            $('#attColor').css('background','white');
        }
        
        
		if(!!$("#headerempno").val()){
	       	console.log("webSocket")
	       	connect();
	    }else{
	      	console.log("!webSocket")
	      	webSocket.close;
	    }
		
	})
	let webSocket; 		// 웹소켓 전역변수
	
	<!-- webSocket 연결 -->
	function connect(){
			
		// webSocket 연결되지 않았을 때만 연결
		if(webSocket == undefined){
			// webSocket URL
			let wsUri = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/chating";
			console.log("wsUri="+wsUri)
			// 연결
			webSocket = new WebSocket(wsUri);
			console.log("connectwebSocket="+webSocket)
			
			if(webSocket){
				webSocket.onopen = onOpen;
				webSocket.onmessage = onMessage;
				/* webSocket.onclose = onClose; */
			}
		}else{
			console.log("이미 연결되어 있습니다!!");
		}
	}
	
</script>

<style>
  	.inout_button:focus {
	  background-color: #29d329;
	}
	 
	.ps-3 .btn a {
		color:black;
		font-weight:bold;
	}
	
			@font-face {
		    font-family: 'Pretendard-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
		    font-weight: 400;
		    font-style: normal;
		}
			/*천재 *{
		 font-family: 'Pretendard-Regular';
		}
 		*/
 		
/*보트 로고*/
	@font-face {
	    font-family: 'BMJUA';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
		.text-primary:not(.far, .fa){
	 font-family:'BMJUA';
	 http://localhost:9700/boat/index
	
	}
	/*전체 폰트
	https://noonnu.cc/font_page/223
	*/
@font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}
	*{
	 font-family: 'S-CoreDream-3Light';
	 font-weight : 700!important;
	}
	/*전체 폰트*/

.flex-shrink-0{font-family : 'Pretendard-Regular';}

.img-circle {
	position: relative;
    width: 45px;
    height: 45px;
    border-radius: 50%;
    border: 0;
    background: none;
    margin-bottom: 20px;
    margin-top:16px;
}

/*메뉴바 간격*/
.navbar-expand-lg .navbar-nav .nav-link {
    padding-right: 0.5rem;
    padding-left: 0.5rem;
}
</style>
</head>

<body>
	<!-- isAnonymous() : 익명 사용자인 경우 로그인 페이지로 이동하도록 합니다. -->
	<sec:authorize access="isAnonymous()">
		<script>
			//location.href = "${pageContext.request.contextPath}/member/sign_in";
		</script>
	</sec:authorize>
	
	<input type="hidden" value="${EMPNO}" id="headerempno">
	

	
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border position-relative text-primary" style="width: 6rem; height: 6rem;" role="status"></div>
        <i class="bi bi-tsunami fa-2x text-primary position-absolute top-50 start-50 translate-middle"></i>
    </div>
    <!-- Spinner End -->


    <!-- Topbar Start -->
    <div class="container-fluid bg-light px-0 wow fadeIn" data-wow-delay="0.1s">
        <div class="row gx-0 align-items-center d-none d-lg-flex">
            <div class="col-lg-6 px-5 text-start">
                <ol class="breadcrumb mb-0">
                    
                </ol>
            </div>
            <div class="col-lg-6 px-5 text-end">
                <small>Follow us:</small>
                <div class="h-100 d-inline-flex align-items-center">
                    <a class="btn-square text-primary border-end rounded-0" href=""><i class="fab fa-facebook-f"></i></a>
                    <a class="btn-square text-primary border-end rounded-0" href=""><i class="fab fa-twitter"></i></a>
                    <a class="btn-square text-primary border-end rounded-0" href=""><i class="fab fa-linkedin-in"></i></a>
                    <a class="btn-square text-primary pe-0" href=""><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Brand & Contact Start -->
    <div class="container-fluid py-4 px-5 wow fadeIn" data-wow-delay="0.5s" >
        <div class="row align-items-center top-bar">
            <div class="col-lg-4 col-md-12 text-center text-lg-start">
                <a href="${pageContext.request.contextPath}/index" class="navbar-brand m-0 p-0">
                    <h1 class="fw-bold text-primary m-0"><i class="bi bi-tsunami" style="font-size: 45px !important";></i> BOAT</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
            </div>
            <div class="col-lg-8 col-md-7 d-none d-lg-block">
                <div class="row">
                    <div class="col-4">
                        <div class="d-flex align-items-center justify-content-end">
                        <sec:authorize access="isAuthenticated()">
                            <sec:authentication property="principal" var="pinfo"/>
								<!-- <button class='inout_button'> -->
                                    <div id="attColor" class="flex-shrink-0 btn-lg-square border rounded-circle" 
                                    style="display:inline-flex !important;">
		                                <i class="far fa-clock text-primary" style="font-family: Font Awesome 5 Free !important"></i>
		                            </div>
                                   	<!-- </button> -->
                                  <div class="ps-3">
                                <sec:authentication property="principal" var="pinfo"/>
                                <p class="mb-2"><span id="attText">출근시간</span></p>
                                <h6 class="mb-0"><span id="attTime">${TodayOntime}</span></h6>
                            </sec:authorize>
                            <!-- 비로그인 -->
                            <sec:authorize access="isAnonymous()">
                                <sec:authentication property="principal" var="pinfo"/>
                                    <!-- <button class='inout_button'> -->
                                        <div id="attColor" class="flex-shrink-0 btn-lg-square border rounded-circle" 
                                        style="display:inline-flex !important;">
                                            <i class="far fa-clock text-primary" style="font-family: Font Awesome 5 Free !important"></i>
                                        </div>
                                    <!-- </button> -->
                                      <div class="ps-3">
                                    <p class="mb-2"><span id="attText">로그인해주세요</span></p>
                                    <h6 class="mb-0"><span id="attTime"></span></h6>
                                </sec:authorize>


                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="d-flex align-items-center justify-content-end">
                            <div class="flex-shrink-0 btn-lg-square border rounded-circle">
                                <i class="fa fa-phone text-primary"></i>
                            </div>
                            <div class="ps-3"> 

                        <sec:authorize access="isAuthenticated()">
                                <sec:authentication property="principal" var="pinfo"/>
                            <p class="mb-2"><span id="loginDept">${DEPT}</span></p>
                            <h6 class="mb-0">
                                <span id="loginid">${pinfo.username}</span></h6>
                       </sec:authorize>

                        <sec:authorize access="isAnonymous()">
                            <p class="mb-2"><span id=""></span></p>
                            <h6 class="mb-0">
                                <span id=""></span></h6>
                       </sec:authorize>
                       
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-4">
                        <div class="d-flex align-items-center justify-content-end"">
                        	<sec:authorize access="isAnonymous()">
	                        	<div class="flex-shrink-0 btn-lg-square border rounded-circle">
	                                <i class="bi bi-chat-fill text-primary"></i>
	                            </div>
	                            <div class="ps-3">
	                                <p class="mb-2">채팅</p>
	                            </div>
                        	</sec:authorize>
                        	<sec:authorize access="isAuthenticated()">
	                            <div class="flex-shrink-0 btn-lg-square border rounded-circle position-relative"
	                            	 style=" cursor: pointer;" onclick="location.href='${pageContext.servletContext.contextPath}/member/chat'">
	                                <i class="bi bi-chat-fill text-primary"></i>
	                            </div>
	                            <div class="headerred position-absolute border border-light rounded-circle bg-danger p-2 badge" style="top: 64px;right: 92px;"></div>
	                            <div class="ps-3"
	                            	 style=" cursor: pointer;" onclick="location.href='${pageContext.servletContext.contextPath}/member/chat'">
	                                <p class="mb-2">채팅</p>
	                            </div>
                            </sec:authorize>
                        </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Brand & Contact End -->


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-primary navbar-dark sticky-top py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
        <a href="#" class="navbar-brand ms-3 d-lg-none">MENU</a>
        <button type="button" class="navbar-toggler me-3" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">        
            <div class="navbar-nav me-auto p-3 p-lg-0">
            
            	<a href="${pageContext.request.contextPath}/map" class="nav-item nav-link">회사소개</a>
	
				<div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">내 정보</a>
       	<sec:authorize access="isAuthenticated()">
  		<sec:authentication property="principal" var="pinfo"/> 
                    <div class="dropdown-menu border-0 rounded-0 rounded-bottom m-0 shadow">
                        <a href="${pageContext.request.contextPath}/Attendance/list" class="dropdown-item">근태 관리</a>
                        <a href="${pageContext.request.contextPath}/member/myboardList" class="dropdown-item">내 글 보기</a>
                        <a href="${pageContext.request.contextPath}/Todo/list" class="dropdown-item">내 할일 보기</a>
                    </div>
        </sec:authorize> 
                </div>
                
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">게시판</a>
                    <div class="dropdown-menu border-0 rounded-0 rounded-bottom m-0 shadow">       
                        <a href="${pageContext.request.contextPath}/board/List" class="dropdown-item">업무 게시판</a>
                        <a href="${pageContext.request.contextPath}/Filebo/list" class="dropdown-item">자료 게시판</a>
                        <a href="${pageContext.request.contextPath}/workboard/workboard_list" class="dropdown-item">워크 보드</a>

                    </div>
                </div>
                
 				<div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">공유업무</a>
                    <div class="dropdown-menu border-0 rounded-0 rounded-bottom m-0 shadow">
                        <a href="${pageContext.request.contextPath}/cal" class="dropdown-item">캘린더</a>
                        <a href="${pageContext.request.contextPath}/address/list" class="dropdown-item">주소록</a>
                    </div>
                </div>
                              
                
                <a href="${pageContext.request.contextPath}/confer/view" class="nav-item nav-link">예약신청</a>
                
            </div>
            
	<sec:authorize access="isAnonymous()">
		<sec:authentication property="principal" var="pinfo"/>
  		
            <div class="d-flex align-items-center justify-content-end username" style="height:70.4px !important;">
                <div class="flex-shrink-0 btn-lg-square border rounded-circle" style="background-color:white !important">
                    <i class="bi bi-person-circle text-primary" style="font-size:45px; margin-top:15px"></i>
                </div>
                <div class="ps-3">
                    <div class="btn btn-sm btn-light rounded-pill py-2 px-4 d-none d-lg-block">
                    	<a href="${pageContext.request.contextPath}/member/sign_in">로그인</a> | <a href="${pageContext.request.contextPath}/member/sign_up">회원가입</a>
                    </div>
                </div>
            </div>
            
    </sec:authorize>
    
	<sec:authorize access="isAuthenticated()">
  		<sec:authentication property="principal" var="pinfo"/>
  		
  			<div class="d-flex align-items-center justify-content-end" style="height:70.4px !important;">
                <div class="flex-shrink-0 btn-lg-square border rounded-circle" style="background-color:white !important">
                    <img class="bi img-circle" 
                    	 src="${pageContext.request.contextPath}/resources/${PROFILE_FILE}">
                </div>
                <div class="text-white ms-3"></div>
            
            <div class="navbar-nav me-auto p-3 p-lg-0">
            
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle me-0" data-bs-toggle="dropdown" ><span id="loginname">${NAME}</span> 님</a>
                   
            <div class="dropdown-menu border-0 rounded-0 rounded-bottom m-0 shadow">
            <a href="${pageContext.request.contextPath}/member/myinfo" class="dropdown-item">내 정보 관리</a>
            <c:if test="${AUTH == 'ROLE_ADMIN' || AUTH == 'ROLE_MGR'}">
            <a href="${pageContext.request.contextPath}/admin/menu" class="dropdown-item">관리자페이지</a>
            </c:if>
            </div>
           
         
         
                </div>
            </div>    
                
                <div class="ps-3">
                    <div class="btn btn-sm btn-light rounded-pill py-2 px-4 d-none d-lg-block">
                    	<form action="${pageContext.request.contextPath}/member/logout" method="post" name="logout">
                    		<a href="#" id="logout">로그아웃</a>
   							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    	</form>
                    </div>
                </div>
            </div>
            
  	</sec:authorize>
  	
  	
            
        </div>
        
    </nav>
    <!-- Navbar End -->

	<!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>
	
    
	 
</body>
</html>

