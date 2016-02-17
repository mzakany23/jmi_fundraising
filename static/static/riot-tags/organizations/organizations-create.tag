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

   	
  <div class="table-responsive" style='margin-top: 25px;'>
    <table id="user" class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>Field Name</th>
                <th>Field Value</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>

        	<!-- name of organization -->
          <tr>
            <td>Name</td>
            <td>
            	<textfield-component bus={ opts.bus } placeholder='Organization Name' defaultval="Name"></textfield-component>
            </td>
            <td>
            	<span class="text-muted">Enter Organization Name</span>
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
	          <td>Enter the type of Organization it is i.e. Industry or however you want to classify it.</td>
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
            <td>
            	<span class="text-muted">Enter approximate employee count</span>
            </td>
          </tr>

          <tr if={ contacts }>
            <td>Contacts</td>
            <td>
            	<ul>
            			<li each={ contact in contacts }>{ contact.first_name } { contact.last_name } | { contact.organization.name } <a onclick={ removeContact } value={ contact } href=""><i class="fa fa-times-circle"></i></a></li>
              </ul>
            </td>
            <td>
            	<span class="text-muted">Contacts within the organization</span>
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
            <td>
            	<span class="text-muted">Is this the main Parent Organization?</span>
            </td>
          </tr>

      
          <tr>
            <td>Children Organizations</td>
            <td>
            	<dropdown-component title='children' options={ organizations } bus={ opts.bus } ></dropdown-component>
            </td>
            <td>
            	<span class="text-muted">Companies or divisions within the the Parent company</span>
            </td>
          </tr>

          <tr>
            <td>Sibling Organizations</td>
            <td>
            	<dropdown-component title="siblings" bus={ opts.bus } options={ opts.organizations }></dropdown-component>
            </td>
            <td>
            	<span class="text-muted">Companies that are related to company</span>
            </td>
          </tr>

          <!-- endbody -->
        </tbody>
    </table>
    </div>
        <button onclick={ saveOrganization } class='btn btn-danger'>Add Organization</button>
    </div>
</div>




<script>
	var self = this

	// mount 

	// this.on('mount',function(){
	// 	this.initOrgTypes()
	// 	this.initOrganizations()
	// })

	// init
	
	// initOrgTypes(){
	// 	this.opts.store.organizations.types().then((types) => {
	// 		self.orgTypes = types
	// 		self.update()
	// 	}).fail((e) => {console.log(e)})
	// }

	// initOrganizations(){
	// 	this.opts.store.organizations.show().then((organizations) => {
	// 		self.organizations = organizations
	// 		self.update()
	// 	}).fail((e) => {console.log(e)})
	// }

  this.opts.bus.on('textBoxData',function(data){
    this.textBoxData = data
  })

	// actions
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

  removeContact(e){
    id = e.item.contact.id
    found = _.findWhere(self.contacts,{id:id})
    index = self.contacts.indexOf(found)
    
    if (self.contacts.length === 1){
      self.contacts = null
    }else{
      self.contacts = self.contacts.splice(index,1)
    }
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
    self.contacts.push(contact)
  })

	this.opts.bus.on('resetContacts',function(contacts){
		self.contacts = []
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

  this.opts.bus.on('createContact',function(contact){
    self.contacts.push()
  })
</script>

</organizations-create>