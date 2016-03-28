<email-fundraiser-confirm>
	<style type="text/css">
		#checkbox{
			font-style: italic;
			color: red;
		}
	</style>

	<a onclick={ setEmail } href="#email-modal-dialog" class="btn btn-sm btn-danger">Resend email</a>

<script>
	var self = this
	this.jars = 0

	setEmail(){
		fundraiser = this.opts.fundraiser

		this.organization = fundraiser.title
		
		if (fundraiser.profile){
			this.email = fundraiser.profile.email
			this.contact = fundraiser.profile.contact_full_name
			this.phone = fundraiser.profile.phone_number
		}

		if (fundraiser.profile.address){
			this.address = fundraiser.profile.address.street
			this.city = fundraiser.profile.address.city
			this.state = fundraiser.profile.address.state
			this.zip_code = fundraiser.profile.address.zip_code	
		}

		if (fundraiser.selections){
			this.selectionString = ''
			
			for(i in fundraiser.selections){
				selection = fundraiser.selections[i]
				this.jars += selection.quantity
				this.selectionString += `product: ${selection.product.title} qty: ${selection.quantity} <br>`
			}	
		}

		if (fundraiser.order_details){
			this.shipping = fundraiser.order_details.free_shipping
			this.total = fundraiser.order_details.net_total
		}
				
		this.hasPropperFields = true
		
		if(fundraiser.profile.address && this.jars > 0 && fundraiser.profile && fundraiser.order_details){

			message = 
			`Resend confirm address: <br> 
			contact: ${this.contact} <br>
			email: ${this.email} <br>
			organization: ${this.organization} <br>
			street: ${this.address} <br>
			city: ${this.city} <br>
			state: ${this.state} <br>
			zip: ${this.zip_code} <br>
			selections: <br>
			${this.selectionString} 
			total jars: ${this.jars} <br>
			free shipping: ${this.shipping} <br>
			total cost: $${this.total} <br>

			`
			
			alertify.confirm(message, function (e, str) {
			    // str is the input text
			    if (e) {
			        self.sendEmail()
			    } else {
			        alertify.error('Action cancelled.')
			    }
			}, "Default Value");
				
		}else{
			alertify.error("You can't send email to this profile. Needs profile, shipping address,salsa selections, and email address!")
		}
	}

	sendEmail(){
		opts.store.email.sendConfirmEmail(this.opts.fundraiser.id).then((res) => {
			alertify.success(`You Successfully Sent confirm to ${this.opts.fundraiser.title}`);
		}).fail((e) => {
			alertify.error("Error notification");
		})
	}

	resetForm(){
		this.contact = null
		this.organization = null
		this.address = null
		this.city = null
		this.state = null
		this.zip_code = null
		this.organization = null
		this.phone = null
		this.selections = null
		this.shipping = null
		this.total = null
		this.initEmail = null
		this.hasPropperFields = false
		self.update()
	}
	

</script>

</email-fundraiser-confirm>