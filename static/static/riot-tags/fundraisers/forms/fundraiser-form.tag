<fundraiser-form>
	<div class="row">
	<div class="col-md-12 ui-sortable">
      <div class="panel panel-inverse" data-sortable-id="form-stuff-1">
          
          <div class="panel-heading">
              <h4><a class="accordion-toggle accordion-toggle-styled" data-toggle="collapse" href="#detailsCollapse">
                      <i class="fa fa-plus-circle pull-right"></i> 
                    Fundraiser Details
                  </a>
              </h4>
              <!-- <h4 class="panel-title">Fundraiser Details</h4> -->
          </div>

          <div id='detailsCollapse' class="panel-body">
              <form class="form-horizontal">
              	<!-- title -->
                  <div class="form-group">
                      <label class="col-md-3 control-label">Title</label>
                      <div class="col-md-6">
                          <input onchange={ sendDetails } type="text" class="form-control" placeholder="Default input" name='titleInput'>
                      </div>
                  </div>

                  <!-- description -->
                  <div class="form-group">
                      <label class="col-md-3 control-label">Description</label>
                      <div class="col-md-6">
                          <textarea onchange={ sendDetails } class="form-control" placeholder="Textarea" rows="5" name='textAreaInput'></textarea>
                      </div>
                  </div>

                  <!-- plan -->
                  <div class="form-group">
                    <label class="col-md-3 control-label">Plan</label>
                    <div class="col-md-6">
                        <select onchange={ sendDetails } class="form-control" name='selectPlanInput'>
                        		<option>None</option>
                            <option each={ plan in opts.plans }>{ plan.title }</option>
                        </select>
                    </div>
	                </div>

	                <!-- status -->
                  <!-- <div class="form-group">
                    <label class="col-md-3 control-label">Status</label>
                    <div class="col-md-6">
                        <select class="form-control" name='selectStatusInput'>
                        		<option>None</option>
                            <option>paid</option>
                            <option>unpaid</option>
                            <option>in-process</option>
                        </select>
                    </div>
	                </div>
 -->

	                <!-- discount -->
	                <!-- <div class="form-group">
                    <label class="col-md-3 control-label">Discount</label>
                    <div class="col-md-6">
                    		<div class="input-group">
                        <span class="input-group-addon">%</span>
	                    	<input type="text" class="form-control" placeholder='0' name='discountInput'>
	                    	<span class="input-group-addon">%</span>
	                    	</div>
                    </div>
	                </div> -->

              </form>
          </div>

      </div>
      <!-- end panel -->
  </div>
  
  </div>

<script>
  var self = this

  sendDetails(){
    data = {
      title: self.titleInput.value,
      description: self.textAreaInput.value,
      plan: self.selectPlanInput.value,
      // selectStatusInput: self.selectStatusInput.value,
      // discountInput: self.discountInput.value,
    }

    bus.trigger('fundraiserDetails',data)
  }

</script>

</fundraiser-form>