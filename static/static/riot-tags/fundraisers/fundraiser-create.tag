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
		<fundraiser-form plans={ plans }></fundraiser-form>

		<!-- selections -->
		<fundraiser-selections-form store={ store } products={ products }></fundraiser-selections-form>

		<!-- shipment -->
		<fundraiser-shipment-form address={ currentAddress }></fundraiser-shipment-form>

		<!-- payments -->
	  <fundraiser-payment-form></fundraiser-payment-form>

	  <!-- submit -->
		<div class="row">
	  	<div class="col-md-3">
	  		<button href="" class="btn btn-danger btn-block">Review Fundraiser</button>
	  	</div>
		</div>
	</virtual>
	
<script>
	self = this
  
  this.bus = this.opts.bus
	this.store = this.opts.store 

	this.bus.on('currentAddress',function(address){
		self.currentAddress = address
		self.update()
	})

	this.on('mount',function(){
		this.getPlans()
		this.getProducts()
		self.update()
	})

	getPlans(){
		this.opts.store.fundraiserTypes.getTypes().then((plans) => {
			this.plans = plans
		});
	}

	getProducts(){
		this.opts.store.products.show().then((products) => {
			this.products = products 
		}).fail((e) => {console.log(e)})
	}

</script>

</fundraiser-create>