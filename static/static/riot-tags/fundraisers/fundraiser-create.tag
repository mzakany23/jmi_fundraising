<fundraiser-create>
	<style type="text/css">
		.manShipping{
			margin-top: 15px;
			margin-bottom: 15px;
		}
	</style>


	<div class="row">
		<div class="col-md-4"><h1>Create Fundraiser</h1></div>
	</div>


	<!-- forms -->

	<!-- profile -->
	<fundraiser-profile-form store={ opts.store } profiles={ profiles } bus={ opts.bus }></fundraiser-profile-form>

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
							  <h3>Total Shipping: 

							  <virtual if={ !manualShippingOn }><a onclick={ turnManualShippingOn } href="">${shippingCost}</a>
							  </virtual> 

							  <virtual if={ manualShippingOn }>
								  <form class="form-inline manShipping">
										<div class="form-group m-r-10">
											<input type="text" class="form-control" placeholder="Enter Shipping Rate" name='manShipping'>
										</div>
										<button onclick={ setManualShipping } type="submit" class="btn btn-sm btn-primary m-r-5">Set Shipping</button>
									</form>
								</virtual>


							  	or <a onclick={ showPreciseShippingForm } href="" data-target='#showPreciseShippingModal' class='btn btn-success btn-small' data-toggle="modal">Calculate Precise Shipping</a></h3>
							  
							  
							  <h3 if={ manualShippingOn }>
							  	Total Cost: ${ totalCost }
							  </h3>

							
							  <div class="alert alert-info m-b-0" style='margin-bottom: 25px;'>
							  	<h3>Total w/Shipping: ${ totalCostWithShipping }</h3>
							  </div>
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
                                	<td><input class="form-control input-sm" type="text" value='2' name='lengthInput'></td>
                                </tr>

                                <tr>
                                	<th>Width</th>
                                	<td><input class="form-control input-sm" type="text" value='2' name='widthInput'></td>
                                </tr>

                                <tr>
                                	<th>Height</th>
                                	<td><input class="form-control input-sm" type="text" value='2' name='heightInput'></td>
                                </tr>

                                <tr>
                                	<th>Weight ({ currentJarWeight } * { jarCount })</th>
                                	<td><input class="form-control input-sm" type="text" value='{ totalWeight }' name='weightInput'></td>
                                </tr>


                            </tbody>
                        </table>

                        <button onclick={ getShippingCost } class='btn btn-danger'>
                        	<virtual if={ !easyPostResults }>Get Shipping Cost from Easy Post</virtual>
                        	<virtual if={ easyPostResults }>Request new shipping cost</virtual>
                        </button>

                        

                    </div>
                    
               
                    <virtual if={ waiting }>
                    	<h2 class='text-center'><i class="fa fa-spinner"></i>Loading Shipping Rates</h2>
                  	</virtual>


                    <virtual if={ easyPostResults }>
                    
                    <h4>Select Shipping Cost</h4>
                    <div class="invoice-price">
                        <div class="invoice-price-left">

                            <div each={ rate in currentShipment.rates } class="invoice-price-row">
                                <div class="sub-price">
                                    <a onclick={ setShippingOption } href="" data-dismiss="modal">{ rate.carrier }</a>
                                </div>
                                <div class="sub-price">
                                    <i class="fa fa-plus"></i>
                                </div>
                                <div class="sub-price">
                                    { rate.service }
                                </div>
                                <div class="sub-price">
                                    <i class="fa fa-plus"></i>
                                </div>
                                <div class="sub-price">
                                    <h3>${ rate.list_rate }</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>

            </virtual>
										</div>
										
										<div class="modal-footer">
											<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Cancel</a>
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
	

	<!-- review fundraiser modal -->
	<div class="modal" id="reviewFundraiserModal" style="display: none; padding-right: 15px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">Review Fundraiser</h4>
				</div>
				<div class="modal-body">
					<div class="invoice">
                
                <div class="invoice-header">
                		
                		<img src="" alt="" class="media-object rounded-corner">

                    <div class="invoice-from">
                        <small>from</small>
                        <address class="m-t-5 m-b-5">
                            <strong>Jose Madrid Salsa, Inc</strong><br>
                            123 Main St.<br>
                            Zanesville, OH 43701<br>
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
                    <div class="invoice-date">
                        <small>Date / period</small>
                        <div class="date m-t-5">{ moment().format('dddd, MMMM Do YYYY') }</div>
                    </div>
                </div>

                <div class="invoice-header">
                    <div class="invoice-from">
                        <small>Details</small>
                        <address class="m-t-5 m-b-5">
                            <strong>{ fundraiserDetails.title }</strong> <br>
                            { fundraiserDetails.description } <br>
                            { fundraiserDetails.plan } <br>
                        </address>
                    </div>
                </div>

                <div class="invoice-content">
                    <div class="table-responsive">
                        <table class="table table-invoice">
                            <thead>
                                <tr>
                                    <th>DESCRIPTION</th>
                                    <th>Qty</th>
                                    <th>$/jar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr each={ salsa in currentSelections }>
                                    <td>
                                        { salsa.title }
                                    </td>
                                    <td>{ salsa.qty }</td>
                                    <td>${ salsa.price }</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="invoice-price">
                        <div class="invoice-price-left">
                            <div class="invoice-price-row">
                                <div class="sub-price">
                                    <small>SUBTOTAL</small>
                                    ${ totalCost }
                                </div>
                                <div class="sub-price">
                                    <i class="fa fa-plus"></i>
                                </div>
                                <div class="sub-price">
                                    <small>Shipping</small>
                                    ${ shippingCost }
                                </div>
                            </div>
                        </div>
                        <div class="invoice-price-right">
                            <small>TOTAL</small> ${ totalCostWithShipping }
                        </div>
                    </div>
                </div>
               	
            </div>
				</div>
				<div class="modal-footer">
					<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
					<a onclick={ confirmCreateFundraiser } href="javascript:;" class="btn btn-sm btn-success" data-dismiss="modal">Create Fundraiser</a>
				</div>
			</div>
		</div>
	</div>

<script>
	var self = this

  this.bus = this.opts.bus
	this.store = this.opts.store 
	this.freeShipping = false
	this.currentJarWeight = 2
	this.waiting = false 
	this.canChooseSelections = false

	this.on('mount',function(){
		this.getPlans()
		this.getProducts()
		self.getProfiles()
		self.update()

	})

	confirmCreateFundraiser(){
		// currentAddress
		// currentProfile
		// fundraiserDetails
		// currentSelections
	}

	getProfiles(){
		this.opts.store.profiles.show().then((profiles) => {
      this.profiles = _.sortBy(profiles, 'organization');
      self.update()
    });
	}

	getShippingCost(){	
		self.waiting = true
		
		data = {
			address: self.currentAddress,
			parcel: self.getParcelSpecs()
		}

		this.opts.store.shipment.getRates(data).then((shipment) => {
			self.currentShipment = shipment
			self.preciseShippingRate = parseFloat(shipment.list_rate)
			self.waiting = false
			self.easyPostResults = true
			self.update()
		}).fail((e) => {console.log(e.responseText)})

	}

	turnManualShippingOn(){
		this.manualShippingOn = true
	}

	setManualShipping(){
		this.manualShippingOn = false
		newShippingRate = parseFloat(this.manShipping.value)
		if (!Number.isNaN(newShippingRate)){
			self.shippingCost = newShippingRate
			self.totalCostWithShipping = self.totalCost + newShippingRate
		}
		self.update()
	}

	setShippingOption(e){
		preciseShippingRate = parseFloat(e.item.rate.list_rate)
		this.shippingCost = preciseShippingRate
		this.totalCostWithShipping = parseFloat(preciseShippingRate) + parseFloat(this.totalCost)
		this.update()
	}

	getParcelSpecs(){
		return {
			weight: this.jarWeight.value || '1',
			length: this.lengthInput.value || '1',
			width: this.widthInput.value || '1',
			height: this.heightInput.value || '1',
		}
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

	calculateQtyandCost(selections){
		totalCost = 0
		totalQty = 0
	
		for (var i in selections){
			selection = selections[i]
			qty = parseInt(selection.qty)
			cost = parseFloat(selection.price)
			totalCost += (cost * qty)
			totalQty += totalQty += qty
		}

		this.totalCost = totalCost
		this.totalQty = totalQty

	}

	// -----------------
	// observable pieces
	// -----------------
	// currentAddress
	// currentProfile
	// fundraiserDetails
	// currentSelections

	createFundraiser(){
		if (self.canChooseSelections){
			$(this.reviewFundraiserModal).modal()
		}else{
			alertify.error('make sure to enter fundraiser details!')
		}
	}

	// get address
	this.bus.on('currentAddress',function(address){
		self.currentAddress = address
		self.update()
	})

	// get profile
	this.bus.on('getProfile',function(data){
		self.currentProfile = data.profile
		self.update()
	})

	// get details
	this.bus.on('fundraiserDetails',function(details){
		self.fundraiserDetails = details
		checkPlan = details.plan !== 'None'
		checkTitle = details.title
		checkDesc = details.description
		
		if (checkPlan && checkTitle && checkDesc){
			self.canChooseSelections = true
		}

		self.update()
	})

	// get selections
	this.bus.on('getSelections',function(data){
		self.currentSelections = data.selections
		self.jarCount = data.jarCount
		
		self.calculateQtyandCost(data.selections)

		if (data.jarCount > 90){
			self.freeShipping = true
			self.shippingCost = 0
			self.totalCostWithShipping = self.totalCost
		}else{
			self.shippingCost = 30
			self.totalCostWithShipping = self.totalCost + self.shippingCost
		}

		self.update()

	})
	


</script>

</fundraiser-create>