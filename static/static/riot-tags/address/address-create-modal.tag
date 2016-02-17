<address-create-modal>

	<style type="text/css">
	  .required{
	      font-style: italic;
	      color:red;
	  }
	</style>

	<button href="#address-create-modal" class="btn btn-sm btn-danger" data-toggle="modal">Add Address<i class="fa fa-plus-square" style="padding-left: 10px;"></i></button>

	<div class="modal" id="address-create-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">Add Address</h4>
				</div>
				
				<!-- ############################# -->
				<!-- main content -->
				<!-- ############################# -->

				<div class="modal-body">
					<form onsubmit={ addAddress } class="form-horizontal">
					<!-- shipping/billing -->
					<div class="form-group">
            <label class="col-md-3 control-label">Shipping/Billing<i class="required">*</i></label>
            <div class="col-md-6">
                <select class='form-control' name='typeField'>
                	<option>Shipping</option>
                	<option>Billing</option>
                </select>
            </div>
        	</div>

        	<!-- title -->
        	<div class="form-group">
            <label class="col-md-3 control-label">Address Title<i class="required">*</i></label>
            <div class="col-md-6">
                <input type="text" class="form-control" placeholder="XYZ Company Main Address" name='titleField' required='true'>
            </div>
        	</div>

        	<!-- street -->
        	<div class="form-group">
            <label class="col-md-3 control-label">Street Name<i class="required">*</i></label>
            <div class="col-md-6">
                <input type="text" class="form-control" placeholder="123 Main St." name='streetField' required='true'>
            </div>
        	</div>

        	<!-- line 2 -->
        	<div class="form-group">
            <label class="col-md-3 control-label">Line 2</label>
            <div class="col-md-6">
                <input type="text" class="form-control" placeholder="PO Box 123" name='line2Field'>
            </div>
        	</div>

        	<!-- City -->
        	<div class="form-group">
            <label class="col-md-3 control-label">City<i class="required">*</i></label>
            <div class="col-md-6">
                <input type="text" class="form-control" placeholder="Zanesville" name='cityField' required='true'>
            </div>
        	</div>

        	<!-- state -->
        	<div class="form-group">
            <label class="col-md-3 control-label">State<i class="required">*</i></label>
            <div class="col-md-6">
                <select class='form-control'>
                	<option>None</option>
                </select>	
            </div>
        	</div>

        	 <!-- Info/Notes -->
	        <div class="form-group">
	            <label class="col-md-3 control-label">Notes/Info</label>
	            <div class="col-md-6">
	            	<textarea class="form-control" placeholder="Describe anything relevant about this address." rows="5" name='notesField' ></textarea>	
	            </div>
	        </div>

	        <!-- submit -->
       	  <div class="form-group">
            <label class="col-md-3 control-label">Submit</label>
            <div class="col-md-9">
                <button type="submit"  class="btn btn-sm btn-success">Create Contact</button>
            </div>
          </div>
       	 </form>
				</div>

				<!-- ############################# -->
				<!-- end main content -->
				<!-- ############################# -->
				
				
			</div>
		</div>
	</div>
<script>

</script>

</address-create-modal>