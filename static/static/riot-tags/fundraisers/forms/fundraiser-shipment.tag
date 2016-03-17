<fundraiser-shipment-form>
<!-- shipment -->
  <div class="row">
	<div class="col-md-12 ui-sortable">
    <div class="panel panel-inverse" data-sortable-id="form-stuff-1">
          <div class="panel-heading">
            <h4><a class="accordion-toggle accordion-toggle-styled" data-toggle="collapse" data-parent="#accordion" href="#shippingCollapse">
                      <i class="fa fa-plus-circle pull-right"></i> 
                    Shipping Info
                  </a>
              </h4>
              <!-- <h4 class="panel-title">Shipping Info</h4> -->
          </div>

          <div id='shippingCollapse' class="panel-body">
              <form class="form-horizontal">
                <!-- title -->
                  <div class="form-group">
                      <label class="col-md-3 control-label">Shipping/Billing</label>
                      <div class="col-md-6">
                          <input if={ opts.address.shipping } type="checkbox" value="" checked onclick="return false">
                          <input if={ !opts.address.shipping } type="checkbox" value="" onclick="return false">
                      </div>
                  </div>

                  <!-- title -->
                  <div class="form-group">
                      <label class="col-md-3 control-label">Title</label>
                      <div class="col-md-6">
                          <input type="text" class="form-control" value={ opts.address.title } readonly>
                      </div>
                  </div>

                   <!-- street -->
                  <div class="form-group">
                      <label class="col-md-3 control-label">Street</label>
                      <div class="col-md-6">
                          <input type="text" class="form-control" value={ opts.address.street } readonly>
                      </div>
                  </div>

                  <!-- city -->
                  <div class="form-group">
                      <label class="col-md-3 control-label">City</label>
                      <div class="col-md-6">
                          <input type="text" class="form-control" value={ opts.address.city } readonly>
                      </div>
                  </div>

                  <!-- state -->
                  <div class="form-group">
                      <label class="col-md-3 control-label">State</label>
                      <div class="col-md-6">
                          <input type="text" class="form-control" value={ opts.address.state } readonly>
                      </div>
                  </div>

                  <!-- state -->
                  <div class="form-group">
                      <label class="col-md-3 control-label">Zip</label>
                      <div class="col-md-6">
                          <input type="text" class="form-control" value={ opts.address.zip_code } readonly>
                      </div>
                  </div>
                  

              </form>
          </div>

      </div>
      <!-- end panel -->
  </div>
  
  </div>
	  </div>
	</div>
  </div>
	
<script>

</script>

</fundraiser-shipment-form>