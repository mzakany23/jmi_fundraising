<fundraiser-profile-form>
	
	<style type="text/css">
		.inactive{
			pointer-events:none;
			cursor: default;
		}

		.ready{
			border: 1px solid #242a30;
			border-radius: 3px;
		}

		.profile-list{
			padding-left: 10px;
			padding-right: 10px;
		}

		.errors li{
			color: red;
		}

	</style>	


  <div class="row">
	<div class="col-md-12 ui-sortable">
      <div class="panel panel-inverse" data-sortable-id="form-stuff-1">
          <div class="panel-heading">
              <h4 class="panel-title">Select or Create Profile for Fundraiser</h4>
          </div>
          <div class="panel-body">
          	<!-- account -->
          	<form class="form-horizontal">
            <div class="form-group">
              <label class="col-md-3 control-label">Account</label>
              <div class="col-md-6">
                  <select class="form-control" onchange={ getProfile } name='profileSelect'>
                  	<div id="search-results"></div>
                		<option if={ !currentProfile }>None</option>
                		<option if={ currentProfile } selected>{ currentProfile.organization }</option>
                    <option each={ profile in profiles }>{ profile.organization }</option>
                  </select>
              </div>
              <a onclick={ resetForms } href="" data-target='#account-create-modal' class="btn btn-sm btn-success" data-toggle="modal"><i class="fa fa-plus-square"></i></a>
            </div>
          	</form>
          </div>

          <!-- profile detail -->
          <div if={ currentProfile } class="row">
          	<div class="col-md-9">
	          	<profile-detail profile={ currentProfile }></profile-detail>    
            </div>
          </div>

      </div>

      <!-- end panel -->
      </div>
  </div>
  </div>

  <!-- account-->
  <div class="modal" id="account-create-modal" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">Profile Information</h4>
				</div>
				<div class="modal-body">
					
					<!-- pils -->
        	<ul class="nav nav-pills">
						<li id='profilePil' class="active ready"><a href="#nav-pills-tab-1" data-toggle="tab" aria-expanded="true">Profile</a></li>
						<li id='addressPil'><a class="{inactive: !profileFormValid} {ready: profileFormValid}" href="#nav-pills-tab-3" data-toggle="tab" aria-expanded="false">Address</a></li>
					</ul>

					<!-- div forms -->
					<errors-list errors={ errors }></errors-list>

					<div class="tab-content">

						<div class="tab-pane fade active in" id="nav-pills-tab-1">
								<form class="form-horizontal">

									<!-- organization -->
									<div class="form-group {has-error: invalidOrg} {has-success: invalidOrg === false} has-feedback">
				            <label class="col-md-3 control-label">Organization</label>
				            <div class="col-md-9">
				                <input onfocusout={ scrubOrganization } type="text" class="form-control" placeholder="Organization" name='organization'>
				            </div>
				        	</div>

				        	<!-- first name -->
				        	<div class="form-group {has-error: invalidFirst} {has-success: invalidFirst === false} has-feedback">
				            <label class="col-md-3 control-label">First Name</label>
				            <div class="col-md-9">
				                <input onfocusout={ scrubFirstName } type="text" class="form-control" placeholder="First Name" name='firstName'>
				            </div>
				        	</div>

				        	<!-- last name -->
				        	<div class="form-group {has-error: invalidLast} {has-success: invalidLast === false} has-feedback">
				            <label class="col-md-3 control-label">Last Name</label>
				            <div class="col-md-9">
				                <input onfocusout={ scrubLastName } type="text" class="form-control" placeholder="Last Name" name='lastName'>
				            </div>
				        	</div>

				        	<!-- phone number -->
				        	<div class="form-group {has-error: invalidPhone} {has-success: invalidPhone === false} has-feedback">
				            <label class="col-md-3 control-label">Phone Number</label>
				            <div class="col-md-9">
				                <input onfocusout={ scrubPhoneNumber } type="text" class="form-control" placeholder="Phone Number" name='phoneNumber'>
				            </div>
				        	</div>

				        	<div class="form-group {has-error: invalidEmail} {has-success: invalidEmail === false} has-feedback">
				            <label class="col-md-3 control-label">Email</label>
				            <div class="col-md-9">
				              <input onfocusout={ scrubEmail } type="text" class="form-control" placeholder="Email" name='email'>
				            </div>
				        	</div>
        				</form>
						</div>
						
						

						<div class="tab-pane fade" id="nav-pills-tab-3">
									
											
								<form class="form-horizontal">
									
									<div class="form-group {has-error: invalidTitle} {has-success: invalidTitle === false} has-feedback">

				            <label class="col-md-3 control-label">Title</label>
				            <div class="col-md-9">
				                <input onfocusout={ scrubTitle } type="text" class="form-control" placeholder="Title" name='title'>
				            </div>
				        	</div>

									<div class="form-group {has-error: invalidStreet} {has-success: invalidStreet === false} has-feedback">
				            <label class="col-md-3 control-label">Street</label>
				            <div class="col-md-9">
				                <input onfocusout={ scrubStreet } type="text" class="form-control" placeholder="Street" name='street'>
				            </div>
				        	</div>

				        	<div class="form-group {has-error: invalidCity} {has-success: invalidCity === false} has-feedback">
				            <label class="col-md-3 control-label">City</label>
				            <div class="col-md-9">
				                <input onfocusout={ scrubCity } type="text" class="form-control" placeholder="City" name='city'>
				            </div>
				        	</div>

				        	<div class="form-group {has-error: invalidCity} {has-success: invalidCity === false} has-feedback">
				            <label class="col-md-3 control-label">State</label>
				            <div class="col-md-9">
				            		<select onchange={ scrubState } class="form-control" name='state'>
				            			<option>None</option>
				            			<option each={ state in states }>{ state }</option>
				            		</select>
				                <!-- <input onfocusout={ scrubState } type="text" class="form-control" placeholder="State" name='state'> -->
				            </div>
				        	</div>

				        	<div class="form-group {has-error: invalidZip} {has-success: invalidZip === false} has-feedback">
				            <label class="col-md-3 control-label">Zip Code</label>
				            <div class="col-md-9">
				                <input onfocusout={ scrubZip } type="text" class="form-control" placeholder="Zip Code" name='zip'>
				            </div>
				        	</div>

				        	<!-- <div class="form-group">
				            <label class="col-md-3 control-label">Country</label>
				            <div class="col-md-9">
				                <input onfocusout={ scrubCountry } type="text" class="form-control" placeholder="Country" name='country' value='United States'>
				            </div>
				        	</div> -->



        				</form>

						</div>
						
					</div>

				</div>
				<div class="modal-footer">
					<a onclick={ submitProfileForm } href="" data-toggle="tab" class="btn btn-sm btn-{danger: formsValid, default: !formsValid} {inactive: !formsValid}">Add Profile</a>
				</div>
			</div>
		</div>
		
	</div>



<script>
	this.states = ['AK','AL','AR','AZ','CA','CO','CT','DE','FL','GA','HI','IA','ID','IL','IN','KS','KY','LA','MA','MD','ME','MI','MN','MO','MS','MT','NC','ND','NE','NH','NJ','NM','NV','NY','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VA','VT','WA','WI','WV','WY']
	
	var self = this
	var store = opts.store
	var bus = opts.bus 
	this.errors = null

	this.profileErrors = []
	this.addressErrors = []

	this.successProfileCount = 0
	this.successAddressCount = 0

	this.profileFormValid = false
	this.addressFormValid = false 
	this.formsValid = false
	this.expanded = false

	this.on('mount',function(){
		this.getProfiles()
	})

	getProfiles(){
    this.opts.store.profiles.show().then((profiles) => {
      this.profiles = profiles
      self.update()
    });
  }

  // actions
  resetForms(){
  	// $('#profilePil').addClass('active')
  	// $('#addressPil').removeClass('active')
  	this.successProfileCount = 0
		this.successAddressCount = 0
  	this.clearProfileForm()
  	this.clearAddressForm()
  	this.profileFormValid = false
		this.addressFormValid = false 
		this.formsValid = false
  }

  submitProfileForm(){
		// profile
		organization = this.capitalizeFirstLetter(this.organization.value)
		firstName    = this.firstName.value 
		lastName     = this.lastName.value 
		phoneNumber  = this.phoneNumber.value 
		email        = this.email.value 

		// address
		title        = this.capitalizeFirstLetter(this.title.value)
		street       = this.street.value 
		city         = this.city.value 
		state        = this.state.value 
		zip          = this.zip.value 
		
		profileForm = {
			organization:organization,
			firstName:firstName,
			lastName:lastName,
			phoneNumber:phoneNumber,
			email:email
		}

		addressForm = {
			title:title,
			street,street,
			city:city,
			state,state,
			zip:zip
		}

		store.profiles.create({profileForm:profileForm,addressForm:addressForm}).then((profile) => {
			this.currentProfile = profile
			$('#account-create-modal').modal('hide')
			this.profiles.push(profile)
  		bus.trigger('currentAddress',profile.address)
			self.update()
		})
		.fail((e) => {
			forms = JSON.parse(e.responseText)
			this.addressErrors = store.getFormErrors(forms.address_errors)
			this.profileErrors = store.getFormErrors(forms.profile_errors)
			this.errors = this.profileErrors.concat(this.addressErrors) || null
			self.update()
		});
  }

 
  
  getProfile(e){
  	title = this.profileSelect.value
  	store.profiles.getByTitle(title).then((profile) => {
  		this.currentProfile = profile
  		bus.trigger('currentAddress',profile.address)
  		self.update()
  	}).fail((e) => {console.log(e)})
  }

 

  // addressform
  clearAddressForm(){
  	this.title.value = null
  	this.street.value = null
  	this.city.value = null
  	this.state.value = null
  	this.zip.value = null
  	// this.country.value = null

  	this.invalidTitle = null
  	this.invalidStreet = null
  	this.invalidCity = null
  	this.invalidState = null
  	this.invalidZip = null
  	// this.invalidCountry = null
  }
  
  scrubTitle(){
  	title = this.title.value
  	this.invalidTitle = store.validations.fieldBlank(title)
  	this.countSuccess(this.invalidTitle,'address')
  }

   scrubStreet(){
  	street = this.street.value
  	this.invalidStreet = store.validations.fieldBlank(street)
  	this.countSuccess(this.invalidStreet,'address')
  }

   scrubCity(){
  	city = this.city.value
  	this.invalidCity = store.validations.fieldBlank(city)
  	this.countSuccess(this.invalidCity,'address')
  }

   scrubState(){
  	state = this.state.value
  	this.invalidState = store.validations.fieldBlank(state)
  	this.countSuccess(this.invalidState,'address')
  }

   scrubZip(){
  	zip = this.zip.value
  	this.invalidZip = store.validations.fieldBlank(zip)
  	this.countSuccess(this.invalidZip,'address')
  	if (this.profileFormValid && this.addressFormValid) {this.formsValid = true}
  }

  // scrubCountry(){
  // 	country = this.country.value
  // 	this.invalidCountry = store.validations.fieldBlank(country)
  // 	this.countSuccess(this.invalidCountry,'address')
  // }

  clearProfileForm(){
  	this.organization.value = null
  	this.firstName.value = null
  	this.lastName.value = null
  	this.phoneNumber.value = null
  	this.phoneNumber.value = null
  	this.email.value = null

  	this.invalidOrg = null
  	this.invalidFirst = null
  	this.invalidLast = null
  	this.invalidPhone = null
  	this.invalidEmail = null
  }


  scrubOrganization(){
  	organization = this.organization.value
  	this.invalidOrg = store.validations.fieldBlank(organization)
  	this.countSuccess(this.invalidOrg,'profile')
  }

  scrubFirstName(){
  	firstName = this.firstName.value
  	this.invalidFirst = store.validations.fieldBlank(firstName)
  	this.countSuccess(this.invalidFirst,'profile')
  }

  scrubLastName(){
  	lastName = this.lastName.value
  	this.invalidLast = store.validations.fieldBlank(lastName)
  	this.countSuccess(this.invalidLast,'profile')
  }

  scrubPhoneNumber(){
  	phoneNumber = this.phoneNumber.value
  	this.invalidPhone = store.validations.fieldBlank(phoneNumber)
  	this.countSuccess(this.invalidPhone,'profile')
  }

  scrubEmail(){
  	email = this.email.value
  	this.invalidEmail = store.validations.fieldBlank(email)
  	this.countSuccess(this.invalidEmail,'profile')
  }


  // util
  countSuccess(invalid,formName){
  	if (!invalid) {
	  	if (formName === 'profile'){
	  		this.successProfileCount += 1
		  	if (this.successProfileCount >= 5) {this.profileFormValid = true}	
		  	
		  }else if (formName === 'address'){
		  	this.successAddressCount += 1 
		  	if (this.successAddressCount >= 5) {this.addressFormValid = true}	
		  }	
		}
  }

  capitalizeFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
	}


</script>

</fundraiser-profile-form>













