


<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New register</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		 <div class="row">
		  <div class="col-lg-12">
		    <div class="panel panel-default">
		
		      <div class="panel-body">
		
		        <form role="form" action="/board/register" method="post">
		          <div class="form-group">
		            <label>Title</label> <input class="form-control" name='title'>
		          </div>
		
		          <div class="form-group">
		            <label>Text area</label>
		            <textarea class="form-control" rows="3" name='content'></textarea>
		          </div>
		
		          <div class="form-group">
		            <label>Writer</label> <input class="form-control" name='writer'>
		          </div>
		    	  <div class="modal-footer">
			        <button type="submit" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button type="submit" class="btn btn-primary">Save</button>
			      </div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
      </div>
    </div>
  </div>
</div>

</body>
</html>