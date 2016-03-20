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
                  
                  <div class="col-md-6" style='margin-top: 7px;'>
                      
                      <virtual if={ !opts.profile.account }>

                        No account

                      </virtual>

                      <virtual if={ opts.profile.account }>{ opts.profile.account.username }</virtual>

                  </div>

                </div>
                </form>
              

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
                        <select onchange={ grabPlanSelect } class="form-control" name='selectPlanInput'>
                            <option>None</option>
                            <option each={ plan in opts.plans } value={ plan.id }>{ plan.name } | { plan.title }</option>
                        </select>
                    </div>
                  </div>

                  <!-- type -->
                  <div class="form-group">
                    <label class="col-md-3 control-label">Choose Option</label>
                    <div class="col-md-6">
                        <virtual if={ !planOptions }>
                          <select class="form-control" disabled>
                            <option>None</option>
                            <option each={ type in planOptions } value={ type.id }>{ type.title }</option>
                        </select>
                        </virtual>

                        <virtual if={ planOptions }>
                          <select class="form-control" onchange={ grabTypeSelect } name='selectTypeInput'>
                            <option>None</option>
                            <option each={ type in planOptions } value={ type.id }>{ type.title }</option>
                          </select>
                        </virtual>
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


<script>
  
  var self = this
  this.currentPlan = null
  this.currentType = null

  sendAccount(){
    data = {
      accountId: self.userSelect.value
    }

    console.log(data)
  }

  showCreateModal(){
    $(this.createUserAccount).modal()
  }

  grabPlanSelect(){
    id = this.selectPlanInput.value
    self.currentPlan = _.find(opts.plans, function(plan){ return plan.id.toString() === id });
    this.planOptions = self.currentPlan.options
    this.sendDetails()
  }

  grabTypeSelect(){
    id = this.selectTypeInput.value
    self.currentType = _.find(self.planOptions, function(type){ return type.id.toString() === id });
    this.sendDetails()
  }

  sendDetails(){
    data = {
      account: opts.profile.account || 'None',
      title: self.titleInput.value,
      description: self.textAreaInput.value,
      type: self.currentType,
      plan: self.currentPlan,
      note: self.textAreaNote.value
    }

    bus.trigger('fundraiserDetails',data)
  }

  // observables
  this.opts.bus.on('getUserAccount',function(data){
    self.accountId = data.accountId
  })

</script>

</fundraiser-form>