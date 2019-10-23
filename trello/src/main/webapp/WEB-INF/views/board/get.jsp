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
  <link href="/resources/board/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/board/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <!-- <link href="/resources/board/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet"> -->
</head>
<body>

<div class="container">
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

<div class='row'>
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"> </i> Reply
				<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New Reply</button>
			</div>
		</div>
		
		<div class="panel-body">
			<ul class="chat" style="list-style:none; padding-left:0px;">
				<li class="left clearfix" data-rno="12">
					<div>
						<div class="header">
							<strong class="primary-font">user00</strong>
							<small class="pull-right text-muted">2018-01-01 13:13</small>
						</div>
						<p>Good job!</p>
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>
</div>

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
  
  <!-- reply JavaScript -->
  <script src="/resources/board/js/reply.js"></script>

  <!-- Page level custom scripts -->
  <script src="/resources/board/js/demo/datatables-demo.js"></script>
	
	<script type="text/javascript">
		
		console.log("JS TEST");
		
		var bnoValue = '<c:out value="${board.bno}"/>';
		
		/* replyService.add(		
			{reply:"JS Test", replyer:"tester", bno:bnoValue},
			function(result){
				alert("Result: "+result);
			}
		); */
		
		/* replyService.getList({bno:bnoValue, page:1}, function(list){
			for(var i = 0, len = list.length || 0; i< len; i++){
				console.log(list[i]);
			}	
		}); */
		
		/* replyService.remove(63, function(count){
				console.log(count);
				if (count === "success") {
				     alert("REMOVED");
				   }
			}, function(err){
				alert("ERROR...");
		}); */
		
		/*  replyService.remove(61, function(count) {

			   console.log(count);

			   if (count === "success") {
			     alert("REMOVED");
			   }
			 }, function(err) {
			   alert('ERROR...');
			 }); */
			 
			 /* replyService.update({rno:101, bno:bnoValue, reply:"Modified Reply...."},
					 function(result){
				 		alert("수정완료");	
			 		}
			 ); */
			 
			 replyService.get(31, function(data){
				console.log(data); 
			 });
			 
		
	</script>
	
	
	<script type="text/javascript">
		$(document).ready(function(){

			var bnoValue = "<c:out value='${board.bno}'/>";
			var replyUL = $(".chat");
			
			showList(1);
			
			function showList(page){
				replyService.getList(
					{bno: bnoValue, page: page||1},
					function(list){
						var str ="";
						if(list == null || list.length ==0){
							replyUl.html("");
							
							return;
						}
						for(var i = 0, len = list.length || 0; i< len; i++){
							str += "<li class= 'left clearfix' data-rno='"+list[i].rno+"'>";
							str += "<div> <div class='header'> <strong class='primary-font'>"+list[i].replyer+"</strong>";
							str += "<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
							str += "<p>"+list[i].reply+"</p></div></li>";
						}
						replyUL.html(str);
					}
				);
			}
			
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