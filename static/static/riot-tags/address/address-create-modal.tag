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
						<div class="form-group">
            	<label class='col-md-3 control-label required'>*Required</label>
		        </div>

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
	                <select class='form-control' name='stateSelect'>
	                			<option>OH</option>
												<option>AK</option>
												<option>AL</option>
												<option>AR</option>
												<option>AZ</option>
												<option>CA</option>
												<option>CO</option>
												<option>CT</option>
												<option>DE</option>
												<option>FL</option>
												<option>GA</option>
												<option>HI</option>
												<option>IA</option>
												<option>ID</option>
												<option>IL</option>
												<option>IN</option>
												<option>KS</option>
												<option>KY</option>
												<option>LA</option>
												<option>MA</option>
												<option>MD</option>
												<option>ME</option>
												<option>MI</option>
												<option>MN</option>
												<option>MO</option>
												<option>MS</option>
												<option>MT</option>
												<option>NC</option>
												<option>ND</option>
												<option>NE</option>
												<option>NH</option>
												<option>NJ</option>
												<option>NM</option>
												<option>NV</option>
												<option>NY</option>
												<option>OH</option>
												<option>OK</option>
												<option>OR</option>
												<option>PA</option>
												<option>RI</option>
												<option>SC</option>
												<option>SD</option>
												<option>TN</option>
												<option>TX</option>
												<option>UT</option>
												<option>VA</option>
												<option>VT</option>
												<option>WA</option>
												<option>WI</option>
												<option>WV</option>
												<option>WY</option>
	                </select>	
	            </div>
	        	</div>

	        	<!-- Zip -->
	        	<div class="form-group">
	            <label class="col-md-3 control-label">Zip Code<i class="required">*</i></label>
	            <div class="col-md-6">
	                <input type="text" class="form-control" placeholder="43701" name='zipField' required='true'>
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
	                <button type="submit"  class="btn btn-sm btn-success">Create Address</button>
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
	addAddress(){
		address = {
			typeField: this.typeField.value,
			titleField: this.titleField.value,
			streetField: this.streetField.value,
			line2Field: this.line2Field.value,
			line2Field: this.line2Field.value,
			cityField: this.cityField.value,
			stateSelect: this.stateSelect.value,
			notesField: this.notesField.value,
			zipField: this.zipField.value
		}

		opts.bus.trigger('addAddress',address)
		this.resetForm()
		$('#address-create-modal').modal('hide')
	}

	resetForm(){
		this.titleField.value=null
		this.streetField.value=null
		this.line2Field.value=null
		this.line2Field.value=null
		this.cityField.value=null
		this.stateSelect.value=null
		this.notesField.value=null
		this.zipField.value=null
	}
</script>

</address-create-modal>