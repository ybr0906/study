<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link rel="stylesheet" type="text/css" href="/resources/projectList/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/resources/projectList/css/rwd.css" />
    <script src="/resources/projectList/js/jquery-1.12.4.min.js"></script>
    <script src="/resources/projectList/js/common.js"></script>
    <script src="/resources/projectList/js/main.js"></script>
    <title>Trello</title>
    
    	<style type="text/css">
   		 .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
   	</style>
    
</head>
<body>
    <div id="loginPage">
        <header>
            <div class="wrap_h">
                <h1 class="logo"><a href="#n">로고</a></h1>
                <div class="join">
                    <p>아직 계정이 없으십니까?</p>
                    <a href="#n" class="btn_text" id="myBtn">가입하기</a>
                </div>
            </div>
        </header>
        <div class="wrap">
            <div class="loginInner">
                <img src="/resources/projectList/images/common/signup-login-cover-12a9c10b.png" alt="" />
                <div class="login_box">
                    <h2>LOGIN</h2>
                    <a href="#n" class="google_btn"><span></span>Google로 로그인</a> 
                    <div class="or_line">
                        <span></span>
                        <span class="text">또는</span>
                        <span></span>
                    </div>
                    <form action="/member/login" method="post">
	                    <div class="inputArea loginArea">                
		                        <label for="idInput"></label>
		                        <input type="text" name="email" id="idInput" class="login_input" placeholder="이메일 주소"/>
		                        <label for="passInput"></label>
		                        <input type="password" name="password" id="passInput" class="login_input" placeholder="비밀번호"/>               
	                   		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                    </div>
	                    <button type="submit" class="btnGreen mt25">로그인</button>
                    </form>
                    <a href="#n" class="btn_text mt20">비밀번호를 잊으셨나요?</a>
                </div>
            </div>
              <!-- The Modal -->
    <div id="myModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span> 
	            <form action="/member/join" method="post">
	        		<label for="email">email</label>
	        		<input type="text" name="email" id="email"/><br/>
	        		<label for="password">password</label>
	        		<input type="password" name="password" id="password"/>
	        		
	        		<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
	        		
	        		<button type="submit">등록</button>
	        	</form>
       </div>
    </div>
        </div>
    </div>


<script type="text/javascript">
	
	var modal = document.getElementById('myModal');
	
	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");
	
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];                                          
	
	// When the user clicks on the button, open the modal 
	btn.onclick = function() {
	    modal.style.display = "block";
	}
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    modal.style.display = "none";
	}
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
</script>
    
</body>
</html>
