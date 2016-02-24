<search-contact-form>
	
	<div class="form-group">
    <label class="col-md-3 control-label">Search By</label>
    <div class="col-md-9">
        <!-- radio boxes -->
        <label class="checkbox-inline">
            <input class='searchRadio' onclick={ updateCheckbox } type="checkbox" value="firstName" name='firstName'>
            First Name
        </label>
        
        <label class="checkbox-inline">
            <input class='searchRadio' onclick={ updateCheckbox } type="checkbox" value="lastName" name='lastName'>
            Last Name
        </label>

        <label class="checkbox-inline">
            <input class='searchRadio' onclick={ updateCheckbox } type="checkbox" value="orgName" name='orgName'>
            Organization Name
        </label>
    </div>
</div>


        

<div if={ currentlySelected === 'firstName' }  class="form-group">
    <label class="col-md-3 control-label">Search First Name</label>
    <div class="col-md-6">
    	 <input if={ currentlySelected === 'firstName' } type="text" class="form-control" placeholder="Jane"> 
    </div>
    <div class="col-md-3">
    	<button class="btn btn-success">Submit</button>
    </div>
</div>

<div if={ currentlySelected === 'lastName' }  class="form-group">
    <label class="col-md-3 control-label">Search Last Name</label>
    <div class="col-md-6">
    	 <input if={ currentlySelected === 'lastName' } type="text" class="form-control" placeholder="Doe">
    </div>

    <div class="col-md-3">
    	<button class="btn btn-success">Submit</button>
    </div>
</div>

<virtual if={ currentlySelected === 'orgName' }>
<div class="form-group">
    <label class="col-md-3 control-label">Search Org Name</label>
    <div class="col-md-6">

    	<select class="form-control input-sm" onchange={ updateOrg } name='organizationSelect'>
    		<option>None</option>
    		<option value={ option.id } each={ option in opts.organizations }>{ option.name }</option>
    	</select>

    	<!-- <dropdown-component options={ opts.organizations } bus={ opts.bus } hasNone={ true }></dropdown-component> -->

    </div>

    <div class="col-md-3">
    	<!-- <button onclick={ searchOrganizations } class="btn btn-success">Submit</button> -->
    </div>
</div>

<!-- ################### -->
<!-- contacts -->
<!-- ################### -->

<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-9">
		<virtual if={ areResults && contacts }>
			<label>Select Contacts To Add</label>
			<table class='table'>
				<thead>
					<tr>
						<th>select</th>
						<th>contact</th>
						<th>job</th>
						<th>type</th>
					</tr>
				</thead>
				<tbody id='checkboxList'>
					<tr each={ contact,i in contacts }>
						<td><input class='searchRadio' type='checkbox' onchange={ tallyCheckboxes }></td>
						<td>{ contact.first_name } { contact.last_name }</td>
						<td>{ contact.job_title }</td>
						<td>{ contact.type.title }</td>
					</tr>
				</tbody>
			</table>
	

			<button id='exitButton' onclick={ addContacts } class='btn btn-warning' data-dismiss="modal">Add</button>

		</virtual>

		<virtual if={ areResults && !contacts }>
			<h4>No contacts found </h4>
		</virtual>
	</div>
</div>



</virtual>





<script>	
	var self = this
	this.additions = {}

	// looks for contacts within an organization
	updateOrg(){
		data = {
			id:this.organizationSelect.value,
			title:opts.title
		}
		
		opts.store.organizations.orgContacts(parseInt(data.id)).then((contacts) => {
			self.areResults = true
			if (contacts[0] === undefined) {	
				self.organization = 'None'
				self.contacts = false
			}else{
				self.organization = contacts[0].organization.name
				// array
				self.contacts = contacts
			}
			self.update()	
			
		}).fail((e) => {console.log(e)})
	}
	
	// actions

	// add button
	addContacts(){
		opts.bus.trigger('resetContacts',this.additions)
		this.resetSearchBox()
	}

	resetSearchBox(){
		this.additions = {}
		this.organizationSelect.value = 'none'
		$(this.organizationSelect).value = 'none'
		$('.searchRadio').prop('checked',false)
		self.areResults = false
		this.currentlySelected = null
		opts.bus.trigger('shutCreateContactModal')
	}

	// contacts array
	tallyCheckboxes(e){
		currentContact = e.item
		// this.additions is {}

		if (!this.additions[currentContact.i]) {
			this.additions[currentContact.i] = currentContact	
		}
	}

	// checkboxes
	updateCheckbox(e){
		this.currentlySelected = e.target.value
		
		first = this.firstName
		last  = this.lastName
		org   = this.orgName
		arr = [first,last,org]

		for (var key in arr){
			foundValue = arr[key]
			if (this.currentlySelected !== foundValue.value){
				$(foundValue).prop('checked',false)
			}
		}
		
	}

	opts.bus.on('closeContactModal',function(){
		self.resetSearchBox()
	})
</script>

</search-contact-form>