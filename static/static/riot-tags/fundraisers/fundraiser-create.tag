<fundraiser-create>

	<div class="row">
		<div class="col-md-4"><h1>Create Fundraiser</h1></div>
	</div>


	<!-- forms -->

	<!-- profile -->
	<fundraiser-profile-form store={ opts.store } bus={ opts.bus }></fundraiser-profile-form>

	<!-- has address -->
	<virtual if={ currentAddress }>

		<!-- fundraiser -->
		<fundraiser-form plans={ plans } bus={ opts.bus }></fundraiser-form>

		<!-- selections -->
		<fundraiser-selections-form store={ store } bus={ opts.bus } products={ products }></fundraiser-selections-form>

		<!-- shipment -->
		<fundraiser-shipment-form address={ currentAddress }></fundraiser-shipment-form>

		<!-- total -->
		<div class="row">
	
		<div class="col-md-12 ui-sortable">
	      <div class="panel panel-inverse" data-sortable-id="form-stuff-1">
	          <div class="panel-heading">
	            <h4><a class="accordion-toggle accordion-toggle-styled" data-toggle="collapse" data-parent="#accordion" href="#paymentCollapse">
	                      <i class="fa fa-plus-circle pull-right"></i> 
	                    Payment
	                  </a>
	              </h4>
	              <!-- <h4 class="panel-title">Payment</h4> -->
	          </div>


	          <div id='paymentCollapse' class="panel-body">
	          	 <div if={ jarCount }>
							  <h3>Total Jars Selected: { jarCount }</h3>
							  <h3>Total Shipping: ${shippingCost} or <a onclick={ showPreciseShippingForm } href="" data-target='#showPreciseShippingModal' class='btn btn-success btn-small' data-toggle="modal">Calculate Precise Shipping</a></h3>
							  <h3>Total Cost: ${ totalCost }</h3>
							  <button class="btn btn-danger" style='margin-bottom: 25px;'><h3>Total w/Shipping: ${ totalCost }</h3></button>
						  </div>

						  <div if={ !jarCount }><h4>There are no selections yet</h4></div>
	          </div>
	         
	          <!-- ################################################################# -->
	          <!-- precise shipping form -->
	          <!-- ################################################################# -->
	          
	          <div class="modal" id="showPreciseShippingModal">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
											<h4 class="modal-title">Precise Shipping</h4>
										</div>
										<div class="modal-body">
											<div class="invoice">
                <div class="invoice-company">
                    { currentProfile.organization }
                </div>
                <div class="invoice-header">
                    <div class="invoice-from">
                        <small>from</small>
                        <address class="m-t-5 m-b-5">
                            <strong>Jose Madrid Salsa Inc</strong><br>
                            123 Main St.<br>
                            Zanesville, Oh 43701<br>
                            Phone: (740) 521-4304<br>
                        </address>
                    </div>
                    <div class="invoice-to">
                        <small>to</small>
                        <address class="m-t-5 m-b-5">
                            <strong>{ currentProfile.organization }</strong><br>
                            { currentProfile.address.street }<br>
                            { currentProfile.address.city }, { currentProfile.address.state } { currentProfile.address.zip_code }<br>
                            Phone: { currentProfile.phone_number }<br>
                        </address>
                    </div>
                    
                </div>
                <div class="invoice-content">
                    <div class="table-responsive">
                        <table class="table table-invoice">
                            <thead>
                                <tr>
                                    <th><h4>Shipping Calculator</h4></th>
                                </tr>
                            </thead>
                            <tbody>
                            		 <tr>
                                    <th>Jar Weight</th>
                                    <td><input onchange={ updateJarWeight } class="form-control input-sm" type="text" value='2' name='jarWeight'></td>
                                </tr>
                                <tr>
                                    <th>Task Description</th>
                                    <td>Shipping { jarCount } jars of salsa</td>
                                </tr>
                                
                                <tr>
                                	<th>Length</th>
                                	<td><input class="form-control input-sm" type="text" value='2'></td>
                                </tr>

                                <tr>
                                	<th>Width</th>
                                	<td><input class="form-control input-sm" type="text" value='2'></td>
                                </tr>

                                <tr>
                                	<th>Height</th>
                                	<td><input class="form-control input-sm" type="text" value='2'></td>
                                </tr>

                                <tr>
                                	<th>Weight ({ currentJarWeight } * { jarCount })</th>
                                	<td><input class="form-control input-sm" type="text" value='{ totalWeight }'></td>
                                </tr>


                            </tbody>
                        </table>
                        <button onclick={ getShippingCost } class='btn btn-danger'>Get Shipping Cost from Easy Post</button>
                    </div>

                    <virtual if={ easyPostResults }>
                    <h4>Shipping Cost</h4>
                    <div class="invoice-price">
                        <div class="invoice-price-left">

                            <div class="invoice-price-row">
                                <div class="sub-price">
                                    <small>Total Cost to Ship</small>
                                    $4,500.00
                                </div>
                                <div class="sub-price">
                                    <i class="fa fa-plus"></i>
                                </div>
                                <div class="sub-price">
                                    <small>Shipping FEE (5.4%)</small>
                                    $108.00
                                </div>
                            </div>
                        </div>
                        <div class="invoice-price-right">
                            <small>TOTAL</small> $4508.00
                        </div>
                    </div>
                </div>
                
            </div>
            </virtual>
										</div>
										
										<div class="modal-footer">
											<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Cancel</a>
											<a if={ easyPostResults } href="javascript:;" class="btn btn-sm btn-success">Use Precise $</a>
										</div>
									</div>
								</div>
							</div>

						<!-- ################################################################# -->
	          <!-- precise shipping form -->
	          <!-- ################################################################# -->
	      </div>
	      <!-- end panel -->
	  </div>
	  
	  </div>
	  
	 

	  <!-- submit -->
		<div class="row">
	  	<div class="col-md-3">
	  		<button onclick={ createFundraiser } href="" class="btn btn-danger btn-block { disabled: !currentSelections  }">Review Fundraiser</button>
	  	</div>
		</div>
	</virtual>
	
<script>
	self = this
  
  this.bus = this.opts.bus
	this.store = this.opts.store 
	this.freeShipping = false
	this.currentJarWeight = 2
	// this.totalWeight = (this.currentJarWeight * parseFloat(this.jarCount))

	this.on('mount',function(){
		this.getPlans()
		this.getProducts()
		self.update()
	})

	getShippingCost(){

	}

	showPreciseShippingForm(){
		this.currentJarWeight = this.jarWeight.value
		this.totalWeight = (parseFloat(this.currentJarWeight) * parseFloat(this.jarCount))
	}

	updateJarWeight(){
		this.currentJarWeight = this.jarWeight.value
		this.totalWeight = (parseFloat(this.currentJarWeight) * parseFloat(this.jarCount))
	}

	getPlans(){
		this.opts.store.fundraiserTypes.getTypes().then((plans) => {
			this.plans = plans
		});
	}

	getProducts(){
		this.opts.store.products.showByCategory().then((products) => {
			this.products = products 
		}).fail((e) => {console.log(e)})
	}

	calculateCost(selections){
		totalCost = 0
		totalQty = 0
		this.shippingCost = 0
		for (var i in selections){
			selection = selections[i]
			qty = parseInt(selection.qty)
			cost = parseFloat(selection.price)
			totalCost += (cost * qty)
			totalQty += totalQty += qty
		}
		if (totalQty < 90){
			this.shippingCost = 30 
		}
		this.totalCost = totalCost + this.shippingCost
	}

	// -----------------
	// observable pieces
	// -----------------
	// currentAddress
	// currentProfile
	// fundraiserDetails
	// currentSelections

	createFundraiser(){
		this.bus.trigger('createFundraiser')	
	}

	// get address
	this.bus.on('currentAddress',function(address){
		self.currentAddress = address
		self.update()
	})

	// get profile
	this.bus.on('getProfile',function(profile){
		self.currentProfile = profile
		self.update()
	})

	
	// get details
	this.bus.on('fundraiserDetails',function(details){
		this.fundraiserDetails = details
	})

	// get selections
	this.bus.on('getSelections',function(data){
		self.currentSelections = data.selections
		self.jarCount = data.jarCount
		
		self.calculateCost(data.selections)

		if (data.jarCount > 90){
			self.freeShipping = true
		}

		self.update()
	})
	


</script>

</fundraiser-create>