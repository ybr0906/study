<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Tables</title>

  <!-- Custom fonts for this template -->
  <link href="/resources/board/vendor/fontawesome-free/css/all.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/resources/board/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="/resources/board/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>
<div class="container">
<body id="page-top">

	<!-- Page Wrapper -->
  <div id="wrapper">
	<%@ include file="register.jsp" %>
   <%--  <%@ include file="sidebar.jsp" %> --%>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>
		
          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" id="searchForm" action="/board/list" method="get">
            <div class="input-group">
              <div class="input-group-append">
              <select class="form-control" name="type"  >
              	<option value=""<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
              	<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>title</option>
              	<option value="C"<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>content</option>
              	<option value="W"<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>writer</option>
              	<option value="TC"<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>title or content</option>
              	<option value="TW"<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>title or writer</option>
              	<option value="TWC"<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>title or content or writer</option>
              </select>
           </div>           
              <input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
              <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
              <div class="input-group-append">
                <button class="btn btn-primary">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>
        </nav>

        <!-- Begin Page Content -->
        <div class="container-fluid">
        
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
        
              <button type="button" class="btn btn-primary float-right"  data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">New register</button>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>#번호</th>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>작성일</th>
                      <th>수정일</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${list}" var="board">
	                    <tr>
	                      <td><c:out value="${board.bno}"></c:out></td>
	                      <td data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
		                      <a class='move' href ='<c:out value="${board.bno}"/>'>
		                      		<c:out value="${board.title}"/>
		                      </a>
	                      </td>
	                      <td><c:out value="${board.writer}"></c:out></td>
	                      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
	                      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
	                    </tr>
                    </c:forEach>
                  </tbody>
                </table>             
	            <div class="dataTables_wrapper">   
		             <div class="pull-right dataTables_paginate">
		            	<ul class="pagination">
		            		<c:if test="${pageMaker.prev}">
		            			<li class="paginate_button previous"><a href="${pageMaker.startPage -1}" class="page-link">Previous</a></li>
		            		</c:if>
		            		
		            		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		            			<li class="paginate_button"><a href="${num}" class="page-link">${num}</a></li>
		            		</c:forEach>
		            		
		            		<c:if test="${pageMaker.next}">
		            			<li class="paginate_button next"><a href="${pageMaker.endPage +1}" class="page-link">Next</a></li>
		            		</c:if>
		            	</ul>
		            </div>
	            </div>
	            <form id="actionForm" action="/board/list" method="get">
	            	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" >
	            	<input type="hidden" name="amount" value="${pageMaker.cri.amount}" >
	            	<input type="hidden" name="type" value="${pageMaker.cri.type}">
	            	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	            </form>
              </div>
            </div>       
          </div>
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->
  

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Bootstrap core JavaScript-->
  <script src="/resources/board/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/board/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/resources/board/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/resources/board/js/sb-admin-2.min.js"></script>


  <script src="/resources/board/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="/resources/board/vendor/datatables/dataTables.bootstrap4.min.js"></script>


  <!-- <script src="/resources/board/js/demo/datatables-demo.js"></script> -->



 <!-- Modal  추가 -->
			<div class="modal fade" id="confirm" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body" id="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal">Save
								changes</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->



  
   <script type="text/javascript">
  $(document).ready(function(){
  	var result = '<c:out value="${result}"/>';
  	checkModal(result);

  	console.log("result:"+result);
  	function checkModal(result){
  		if(result===""){
  			return;
  		}
  		if(parseInt(result)>0){
  			$("#modal-body").html("게시글 " + parseInt(result) + " 번이 등록 되었습니다");
  		}
  		$("#confirm").modal("show");
  	}
  	
  	
  	var actionForm = $('#actionForm');
  	
  	$('.paginate_button a').on('click', function(e){
  		e.preventDefault();
  		
  		console.log('click');
  		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
  		actionForm.submit();
  	});
  	
  	$(".move").on("click", function(e){
  		e.preventDefault();
  		actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
  		actionForm.attr("action", "/board/get");
  		actionForm.submit();
  	})
  	
  	var searchForm = $("#searchForm");
  	$("#searchForm button").on("click", function(e){
  		
  		if(!searchForm.find("option:selected").val()){
  			alert("검색 종류를 선택하세요");
  			return false;
  		}
  		if(!searchForm.find("input[name='keyword']").val()){
  			alert("키워드를 입력하세요");
  			return false;
  		}
  		
  		searchForm.find("input[name='pageNum']").val("1");
  		e.preventDefault();
  		
  		searchForm.submit();
  	})
  	
  	
  });
  </script>
</body>
</div>

</html>
