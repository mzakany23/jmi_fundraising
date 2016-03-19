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
          </div>

          <div id='detailsCollapse' class="panel-body">
              <!-- account -->
                <form class="form-horizontal">
                <div class="form-group">
                  <label class="col-md-3 control-label">User Account</label>
                  <div class="col-md-6">
                      <select class="form-control" name='userSelect'>
                        <option>None</option>
                        <option each={ user in opts.useraccounts }>
                          <virtual>
                            { user.first_name } { user.last_name }  
                            <virtual>| { user.is_staff ? 'Staff' : 'User'}</virtual>
                            <virtual>| { Admin: user.is_superuser}</virtual>
                          </virtual>
                        </option>
                      </select>
                  </div>
                  <a href="" data-target='#createUserAccount' class="btn btn-sm btn-success" data-toggle="modal"><i class="fa fa-plus-square"></i></a>
                </div>
                </form>
              </div>

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
                          <textarea onchange={ sendDetails } class="form-control" placeholder="Description" rows="5" name='textAreaInput'></textarea>
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

                   <!-- description -->
                  <div class="form-group">
                      <label class="col-md-3 control-label">Fundraiser Note</label>
                      <div class="col-md-6">
                          <textarea onchange={ sendDetails } class="form-control" placeholder="This will be seen by the Customer's order confirm" rows="5" name='textAreaNote'></textarea>
                      </div>
                  </div>
              </form>
          </div>

      </div>
      <!-- end panel -->
  </div>
  
  </div>

  <!-- create account modal -->
  <div class="modal" id="createUserAccount" style="display: none; padding-right: 15px;">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">Create Account</h4>
      </div>
      <div class="modal-body">
        
      </div>
      <div class="modal-footer">
        <a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
        <a href="javascript:;" class="btn btn-sm btn-success">Action</a>
      </div>
    </div>
  </div>
</div>

<script>
  this.on('mount',function(){
    console.log(opts  )
  })
  var self = this
  sendDetails(){
    data = {
      title: self.titleInput.value,
      description: self.textAreaInput.value,
      plan: self.selectPlanInput.value,
      note: self.textAreaNote.value
    }

    bus.trigger('fundraiserDetails',data)
  }

</script>

</fundraiser-form>