<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link rel="stylesheet" type="text/css" href="/resources/projectList/css/main.css" />
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
    <header id="header">
        <div class="wrap_h">
            <div class="left_menu">
                <a href="#n" class="btn home">home</a>
                <div class="btn board_search">Boards
                    <!-- <div class="board_inner">
                        <input type="text" id="searchBoard" class="searchBoard" placeholder="Find boards by name..." />
                        <div>
                            <span class="s_tit stared">STARRED BOARDS</span>
                            <button class="open"></button>
                            <span class="detail">Star your most important boards to keep them right at your fingertips.</span>
                        </div>
                        <div>
                            <span class="s_tit personal">PERSONAL BOARDS</span>
                            <button class="open"></button>
                            <ul class="personal_list">
                                <li><a href="#n">dd</a></li>
                                <li><a href="#n">Unititled Baord</a></li>
                            </ul>
                        </div>
                        <div>
                            <button class="text_btn2">Create new board...</button>
                            <button class="text_btn2">Always keep this menu open.</button>
                            <button class="text_btn2">See closed boards..</button>
                        </div>
                    </div> -->
                </div>
                <div class="btn searchArea">
                    <input type="text" id="search" class="searchInput" />
                    <a href="#n">ê²ì</a>
                    <!-- <div class="search_box">
                        <p>Refine your search with operator like @member, #label</p>
                        <h4 class="s_tit">Boards</h4>
                        <ul>
                            <li><a href="#n">dd</a></li>
                        </ul>
                    </div> -->
                </div>
            </div>
            <!-- <h1 class="logo"><a href="#n">Trello</a></h1> -->
            <div class="right_menu">
                <a href="#n" class="btn add"></a>
                <a href="#n" class="btn info"></a>
                <a href="#n" class="btn notify"></a>
                <a href="#n" class="btn user"><span>H</span></a>
            </div>
        </div>
    </header>
    <div class="main_board">
        <div class="wrap2">
            <nav>
                <ul>
                    <li class="on"><a href="#n">Boards</a></li>
                    <li><a href="#n">Home</a></li>
                </ul>
                <div class="nav_btn">
                    <p>TEAMS</p>
                    <button class="text_btn">Create a team</button>
                </div>
            </nav>
            <div class="board_box">
                <h3 class="board_tit recent">Recently Viewed</h3>
                <ul>
                    <li><a href="#n"><span>dd</span></a></li>
                </ul>
                <h3 class="board_tit person">Personal Boards</h3>
                <ul>
                	<c:forEach var="project" items="${list}">
	                    <li><a href="#n"><span><c:out value="${project.PJT_TITLE}"></c:out></span></a></li>
	                </c:forEach>
	                    <li class="add_li"><a href="#" id="myBtn">Created new board</a></li>
                </ul>
            </div>
        </div>
    </div>
  
        <!-- The Modal -->
    <div id="myModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span> 
                                                                      
        	<form action="/insertProject">
        		<label for="title">title</label>
        		<input type="text" name="title" id="title"/>
        		<label for="content">content</label>
        		<input type="text" name="content" id="content"/>
        		<button type="submit">등록</button>
        	</form>
        	
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
