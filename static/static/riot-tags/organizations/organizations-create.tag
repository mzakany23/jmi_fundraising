<organizations-create>
<style type="text/css">
	.fit{
		display: inline-block;
	}
</style>
  
  <message-notification messages={ messages } title={ messageTitle } type='error'></message-notification>

	<h1>Create a new Organization</h1>
	<div class="panel panel-inverse">
    <div class="panel-heading">
        <h4 class="panel-title">Details</h4>
    </div>
    <div class="panel-body">

 		<create-contact-modal contactTypes={ opts.contactTypes} organizations={ opts.organizations } store={ opts.store } bus={ opts.bus }></create-contact-modal>
    <br>
    <address-create-modal></address-create-modal>

  <div class="row">
  <div class="col-md-6 table-responsive" style='margin-top: 25px;'>
    <table id="user" class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>Field Name</th>
                <th>Field Value</th>
                
            </tr>
        </thead>
        <tbody>

        	<!-- name of organization -->
          <tr>
            <td>Name</td>
            <td>
            	<textfield-component bus={ opts.bus } placeholder='Organization Name' defaultval="Name"></textfield-component>
            </td>
            
          </tr>

          <!-- type -->
          <tr>
	          <td>Organization Type</td>
	          <td>
	          	<div class="row">
	          		<div class="col-md-9">
	          			<virtual if={ !orgTypeForm }>
	          				<!-- <dropdown-component options={ orgTypes } bus={ opts.bus }></dropdown-component> -->
	          				<select onchange={ grabOrgTypeOption } class="form-control input-sm" name="dropDownSelect">
	          					<option>None</option>
	          					<option each={ option in opts.orgTypes }>{ option.name }</option>
	          				</select>
	          			</virtual>
	          			<virtual if={ orgTypeForm }>
	          				<organization-type-create-box placeholder="Add Organzation Type" bus={ opts.bus }></organization-type-create-box>
	          			</virtual>
	          		</div>

	          		<div class="col-md-3">
	          			<a if={ !orgTypeForm } onclick={ activateOrgTypeForm } href="#modal-dialog" class="btn btn-sm btn-success" data-toggle="modal"><i class="fa fa-plus-square"></i></a>
	          		</div>

	          	</div>
	          </td>
	          
          </tr>

          <tr>
            <td>Number of Employees</td>
            <td>
            	<select class="form-control input-sm" name='employees'>
                  <option>0-50 employees</option>
                  <option>50-100 employees</option>
                  <option>100-500 employees</option>
                  <option>500-1000 employees</option>
                  <option>1000+ employees</option>
              </select>
            </td>
            
          </tr>

          <tr if={ contacts }>
            <td>Contacts</td>
            <td>
            	<ul>
            			<li each={ contact in contacts }>{ contact.first_name } { contact.last_name } | { contact.organization.name } <a onclick={ removeContact } value={ contact } href=""><i class="fa fa-times-circle"></i></a></li>
              </ul>
            </td>
            
          </tr>

          <tr if={ !contacts }>
            <td>Contacts</td>
            <td>
              <p>No Contacts, Add Some!</p>
            </td>
           
          </tr>

          <tr if={ addresses }>
            <td>Addresses</td>
            <td>
              <ul>
                  <li>some address</li>
              </ul>
            </td>
            
          </tr>

          <tr if={ !addresses }>
            <td>Address</td>
            <td>
              <p>No Addresses, Add Some!</p>
            </td>
           
          </tr>

          <tr>
            <td>Parent Organization?</td>
            <td>
            	<select class="form-control input-sm" name='parentSelect'>
            			<option value='false'>No</option>
                  <option value='true'>Yes</option>
                  
              </select>
            </td>
           
          </tr>

      
          <tr>
            <td>Children Organizations</td>
            <td>
            	<dropdown-component title='children' options={ opts.organizations } bus={ opts.bus } ></dropdown-component>
            </td>
            
          </tr>

          <tr>
            <td>Sibling Organizations</td>
            <td>
            	<dropdown-component title="siblings" bus={ opts.bus } options={ opts.organizations }></dropdown-component>
            </td>
            
          </tr>

          <!-- endbody -->
        </tbody>
    </table>
    </div>
    
    <!-- right div -->
     <div class="col-md-6">

     </div>   

    </div>
    
    <div class="row">
      <div class="col-md-4">
        <button onclick={ saveOrganization } class='btn btn-danger'>Add Organization</button>
      </div>
    </div>
</div>


</div>




<script>
	var self = this
  
  this.opts.bus.on('textBoxData',function(data){
    this.textBoxData = data
  })

	// actions

  // -----------------------------------------
  // final save
  // -----------------------------------------
  saveOrganization(){
    textBox = this.textBox
    orgType = this.dropDownSelect.value
    empCount = this.employees.value
    parentCount = this.parentSelect.value 
    childrenOrg = this.childrenSelect
    siblingOrg = this.siblingsSelect
    contacts = this.contacts 

    if (!textBox || orgType === 'None') {
      this.messages = []
      this.messageTitle = 'Errors'
    }

    if (!textBox) {
      this.messages.push('Organization needs a title')
    }

    if (orgType === 'None') {
      this.messages.push('Organization needs an Type')
    }

  }

  grabOrgTypeOption(){
    this.orgType = this.dropDownSelect.value
  }

  // -----------------------------------------
  // remove contact
  // -----------------------------------------

  removeContact(e){
    id = e.item.contact.id
    newArray = []
    for (var key in self.contacts){
      contact = self.contacts[key]
      if (contact.id !== id){
        newArray.push(contact)
      }
    }

    self.contacts = newArray
  }

	activateOrgTypeForm(){
		this.orgTypeForm = true
	}

	// observable events
  this.opts.bus.on('sendingOrg',function(data){
    if (data.title === 'children'){
      self.childrenSelect = data.id 
    }else if (data.title === 'siblings'){
      self.siblingsSelect = data.id
    }
  })

  this.opts.bus.on('initTextBox',function(data){
    self.textBox = data
  })

	this.opts.bus.on('deactivateOrgTypeInput',function(){
		self.orgTypeForm = false
		self.update()
	})

  this.opts.bus.on('appendContact',function(contact){
    if (self.contacts){
      self.contacts.push(contact)    
    }else{
      self.contacts = []
      self.contacts.push(contact)  
    }

    self.update()
  })

	this.opts.bus.on('resetContacts',function(contacts){
    if (!self.contacts) {self.contacts = []}

		for (var key in contacts){
			contact = contacts[key].contact
			self.contacts.push(contact)
		}

		self.update()
	})


	this.opts.bus.on('addType',function(type){
		self.opts.orgTypes.push({name:type.value})
		self.orgTypeForm = false
		self.update()
	})

</script>

</organizations-create>