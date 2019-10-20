<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
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
<body>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Read</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
	
      <div class="panel-heading">Board Read Page</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
	
			<form role="form" action="/board/modify" method="post">
		          <div class="form-group">
		            <label>Title</label> <input class="form-control" name='title' value="${board.title}">
		          </div>
		
		          <div class="form-group">
		            <label>Text area</label>
		            <textarea class="form-control" rows="3" name='content'><c:out value="${board.content}"/> </textarea>
		          </div>
		
		          <div class="form-group">
		            <label>Writer</label> <input class="form-control" name='writer' value="${board.writer}" readonly="readonly">
		          </div>
		          
		          <input type="hidden" name="bno" value="<c:out value="${board.bno}"/>"/>
		          <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'/>
		          <input type="hidden" name="amount"value='<c:out value="${cri.amount}"/>'/>
		          <input type="hidden" name="type" value="${cri.type}">
	              <input type="hidden" name="keyword" value="${cri.keyword}">

		    	  <div class="modal-footer">
			        <button type="button" id="close"class="btn btn-secondary">List</button>
			        <button type="button" id="remove"class="btn btn-secondary">Remove</button>
			        <button type="submit" class="btn btn-primary">Save</button>
			      </div>
			</form>
      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->


  <!-- Bootstrap core JavaScript-->
  <script src="/resources/board/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/board/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/resources/board/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/resources/board/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="/resources/board/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="/resources/board/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="/resources/board/js/demo/datatables-demo.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#remove").on("click", function(){
				event.preventDefault();
				$("form").attr("action","/board/remove");
				$("form").submit();
			});
			
		 	$("#close").on("click", function(){
				$("form").attr("action", "/board/list");
				$("form").attr("method", "get");
				$("form").submit();
			});
		});
	</script>
</body>
</html>