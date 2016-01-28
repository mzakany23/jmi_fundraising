<fundraiser-create>
	<div class="row">
		<div class="col-md-4"><h1>Create Fundraiser</h1></div>
	</div>


	<!-- details -->
	<div class="row">
	<div class="col-md-12 ui-sortable">
      <div class="panel panel-inverse" data-sortable-id="form-stuff-1">
          <div class="panel-heading">
              
              <h4 class="panel-title">Fundraiser</h4>
          </div>
          <div class="panel-body">
              <form class="form-horizontal">
              	<!-- title -->
                  <div class="form-group">
                      <label class="col-md-3 control-label">Title</label>
                      <div class="col-md-6">
                          <input type="text" class="form-control" placeholder="Default input">
                      </div>
                  </div>

                  <!-- description -->
                  <div class="form-group">
                      <label class="col-md-3 control-label">Description</label>
                      <div class="col-md-6">
                          <textarea class="form-control" placeholder="Textarea" rows="5"></textarea>
                      </div>
                  </div>

                  <!-- plan -->
                  <div class="form-group">
                    <label class="col-md-3 control-label">Plan</label>
                    <div class="col-md-6">
                        <select class="form-control">
                        		<option>None</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </div>
	                </div>

	                <!-- status -->
                  <div class="form-group">
                    <label class="col-md-3 control-label">Status</label>
                    <div class="col-md-6">
                        <select class="form-control">
                        		<option>None</option>
                            <option>paid</option>
                            <option>unpaid</option>
                            <option>in-process</option>
                        </select>
                    </div>
	                </div>


	                <!-- discount -->
	                <div class="form-group">
                    <label class="col-md-3 control-label">Discount</label>
                    <div class="col-md-6">
                    		<div class="input-group">
                        <span class="input-group-addon">%</span>
	                    	<input type="text" class="form-control" placeholder='0'>
	                    	<span class="input-group-addon">%</span>
	                    	</div>
                    </div>
	                </div>

              </form>
          </div>

      </div>
      <!-- end panel -->
  </div>
  
  </div>


  <!-- profile -->
  <div class="row">
	<div class="col-md-12 ui-sortable">
      <div class="panel panel-inverse" data-sortable-id="form-stuff-1">
          <div class="panel-heading">
              <h4 class="panel-title">Profile</h4>
          </div>
          <div class="panel-body">
          	<!-- account -->
          	<form class="form-horizontal">
            <div class="form-group">
              <label class="col-md-3 control-label">Account</label>
              <div class="col-md-6">
                  <select class="form-control">
                  		<option>None</option>
                      <option>paid</option>
                      <option>unpaid</option>
                      <option>in-process</option>
                  </select>
              </div>
              <a href="" data-target='#account-create-modal' class="btn btn-sm btn-success" data-toggle="modal"><i class="fa fa-plus-square"></i></a>
            </div>
          	</form>
          </div>

      </div>
      <!-- end panel -->
  </div>
  </div>


  <!-- shipment -->
  <div class="row">
	<div class="col-md-12 ui-sortable">
      <div class="panel panel-inverse" data-sortable-id="form-stuff-1">
          <div class="panel-heading">
              <h4 class="panel-title">Shipment</h4>
          </div>
          <div class="panel-body">
          	<!-- account -->
          	<form class="form-horizontal">
            	 <!-- shipment -->
                  <div class="form-group">
                    <label class="col-md-3 control-label">Shipment</label>
                    <div class="col-md-6">
                        <select class="form-control">
                        		<option>None</option>
                            <option>paid</option>
                            <option>unpaid</option>
                            <option>in-process</option>
                        </select>
                    </div>
                    <a href="" data-target='#shipment-create-modal' class="btn btn-sm btn-success" data-toggle="modal"><i class="fa fa-plus-square"></i></a>
	                </div>       
          	</form>
          </div>

      </div>
      <!-- end panel -->
  </div>
  </div>

  <!-- selections -->
  <div class="row">
	<div class="col-md-12 ui-sortable">
      <div class="panel panel-inverse" data-sortable-id="form-stuff-1">
          <div class="panel-heading">
              <h4 class="panel-title">Selections</h4>
          </div>
          <div class="panel-body">

          	<form class="form-horizontal">
              	<!-- shipment -->

                  <div class="form-group">

                    <div class="col-md-3 control-label">
                    	<button onclick={ addSelection } href="" class="btn btn-sm btn-success" data-toggle="modal">Add Selection<i class="fa fa-plus-square" style='padding-left: 10px;'></i>
                    	</button>	
                    </div>
                    
	                </div>

                  
              </form>

              <virtual each={ selection in selections }>
              <form if={ selection.active } class="form-horizontal">
              	<!-- shipment -->

                  <div class="form-group">

                    <label class="col-md-3 control-label">Selection { selection.id }</label>
                    <div class="col-md-4">
                        <select class="form-control">
                        		<option>None</option>
                            <option>paid</option>
                            <option>unpaid</option>
                            <option>in-process</option>
                        </select>
                    </div>

                    <div class="col-md-1">
                    	<label class="col-md-3 control-label">Quantity</label>
                    </div>
                    <div class="col-md-1">
                    	<input type="text" class="form-control text-center" placeholder="0" name="selection-{selection}">
                    </div>
                    <a onclick={ removeSelection } href="" class="btn btn-sm btn-danger" data-toggle="modal"><i class="fa fa-minus-circle"></i></i></a>
	                </div>

                  
              </form>
              </virtual>

          </div>

      </div>
      <!-- end panel -->
  </div>
  
  </div>

  
  <div class="row">
	
	<div class="col-md-12 ui-sortable">
      <div class="panel panel-inverse" data-sortable-id="form-stuff-1">
          <div class="panel-heading">
              <h4 class="panel-title">Payment</h4>
          </div>
          <div class="panel-body">

          </div>

      </div>
      <!-- end panel -->
  </div>
  
  </div>



  <!-- modals -->

  <!-- shipment -->
  <div class="modal" id="shipment-create-modal" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">Modal Without Animation</h4>
				</div>
				<div class="modal-body">
					Modal body content here...
				</div>
				<div class="modal-footer">
					<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
				</div>
			</div>
		</div>
	</div>


	<!-- account-->
  <div class="modal" id="account-create-modal" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">Modal Without Animation</h4>
				</div>
				<div class="modal-body">
					Modal body content here...
				</div>
				<div class="modal-footer">
					<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
				</div>
			</div>
		</div>

	</div>

	<div class="row">
		<div class="col-md-3">
			<button href="" class="btn btn-danger btn-block">Review Fundraiser</button>
		</div>
	</div>
	
<script>
	this.on('mount',function(){

	})

	this.selectionCount = 0
	this.selections = []

	addSelection(e){
		this.selectionCount += 1
		this.selections.push({id:this.selectionCount,active:true})
		this.update()
	}

	removeSelection(e){
		selection = e.item.selection 
		id = selection.id
		this.opts.store.findAndDelete(this.selections,id)
		selection.active = false 
		this.update()
	}
</script>

</fundraiser-create>