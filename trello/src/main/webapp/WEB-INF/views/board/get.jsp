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
  <!-- <link href="/resources/board/css/bootstrap.min.css" rel="stylesheet"> -->
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

		    	  <div class="footer">
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
</br>
<div class='row'>
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"> </i> Reply
				<button id="addReplyBtn" class="btn btn-primary btn-xs float-right">New Reply</button>
			</div>
		</div>
		</br>
		<div class="panel-body">
			<ul class="chat" style="list-style:none; padding-left:0px;">
				<li class="left clearfix" data-rno="12">
					<div>
						<div class="header">
							<strong class="primary-font">user00</strong>
							<small class="float-right text-muted">2018-01-01 13:13</small>
						</div>
						<p>Good job!</p>
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>
</div>

	<!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>Reply</label> 
                <input class="form-control" name='reply' value='New Reply!!!!'>
              </div>      
              <div class="form-group">
                <label>Replyer</label> 
                <input class="form-control" name='replyer' value='replyer' readonly="readonly">
              </div>
              <div class="form-group">
                <label>Reply Date</label> 
                <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
              </div>
      
            </div>

		<div class="modal-footer">
	        <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
	        <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
	        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
	        <button id='modalCloseBtn' type="button" class="btn btn-default"  data-dismiss="modal">Close</button>
	      </div>          
	    </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->



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
		$(document).ready(function(){

			var bnoValue = "<c:out value='${board.bno}'/>";
			var replyUL = $(".chat");
			
			var modal = $(".modal");
			var modalInputReply = modal.find("input[name='reply']");
			var modalInputReplyer = modal.find("input[name='replyer']");
			var modalInputReplyDate = modal.find("input[name='replyDate']");
			
			var modalModBtn = $("#modalModBtn");
			var modalRemoveBtn = $("#modalRemoveBtn");
			var modalRegisterBtn = $("#modalRegisterBtn");
			
			showList(1);
			/* 댓글 출력 */
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
							str += "<small class='float-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
							str += "<p>"+list[i].reply+"</p></div></li>";
						}
						replyUL.html(str);
					}
				);
			}
			
			/* 댓글 입력 */
			$("#addReplyBtn").on("click", function(e){
				modal.find("input").val("");
				modalInputReplyDate.closest("div").hide();
				modal.find("button[id != 'modalCloseBtn']").hide();
				
				modalRegisterBtn.show();
				
				$(".modal").modal("show");
			});
			
			modalRegisterBtn.on("click",function(e){
					var reply = {
							reply: modalInputReply.val(),
							replyer: modalInputReplyer.val(),
							bno: bnoValue
					}
					
					replyService.add(reply, function(result){
						alert(result);
						
						modal.find("input").val("");
						modal.modal("hide");
						showList(1);
					});
					
				}		
			);
			
			/* 댓글 창 띄우기 */
			$(".chat").on("click", "li", function(e){
				
				var rno = $(this).data("rno");
				
				replyService.get(rno, function(data){
					modalInputReply.val(data.reply);
					modalInputReplyer.val(data.replyer);
					modalInputReplyDate.val(replyService.displayTime(data.replyDate)).attr("readonly", "readonly");
					modal.data("rno",data.rno);
					
					modal.find("button[id != 'modalCloseBtn']").hide();
					modalModBtn.show();
					modalRemoveBtn.show();
					
					$(".modal").modal("show");
				 });
			});
			
			/*댓글 수정  */
			modalModBtn.on("click", function(e){
				
				var reply ={reply:modalInputReply.val(), rno:modal.data("rno") }
				
				replyService.update(reply, function(result){
					alert(result);
				} );
				
				modal.modal("hide");
				showList("1");
			} );
			
			
			modalRemoveBtn.on("click", function(e){
				
				var rno = modal.data("rno");
				console.log("확인"+ rno);
				
				replyService.remove(rno, function(result){
					console.log("확인"+ rno);
					alert(result);
					modal.modal("hide");
			  	    showList(1);
				});
			});
			
			
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