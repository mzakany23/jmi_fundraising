<create-contact-modal>
<style type="text/css">
    .required{
        font-style: italic;
        color:red;
    }
</style>
<div class="row">
	<div class="col-md-3 control-label"> 
		<button onkeyup={ escapeButton } onclick={ resetForm } href="#contact-create-modal" class="btn btn-sm btn-success" data-toggle="modal">
			Add Contact
			<i class="fa fa-plus-square" style="padding-left: 10px;"></i>
		</button> 
	</div> 
</div>	


<!-- modals -->
<div class="modal" id="contact-create-modal" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button onclick={ closeModal } type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class='modal-title' if={ createContact }>Create Contact</h4>
				<h4 class='modal-title' if={ searchContact }>Search Contact</h4>
				<h4 class='modal-title' if={ !activated }>Add Contact</h4>
			</div>
			<div class="modal-body">
				
				<form if={ !activated } class="form-horizontal">
					<div class="form-group">
                    <div class="col-md-6 col-md-offset-3">
                        <select onchange={ updateForm } class='form-control' name='selectForm'>
                        	<option value='default'>Select Option</option>
                        	<option value='create'>Create Contact</option>
                        	<option value='search'>Search Contact</option>
                        </select>
                    </div>
        	       </div>		
				</form>

				<form if={ searchContact } class="form-horizontal">
					<search-contact-form organizations={ opts.organizations } store={ opts.store } bus={ opts.bus }></search-contact-form>
				</form>


        <!-- #################################### -->
        <!-- create contact form -->
        <!-- #################################### -->


		<form if={ createContact } onsubmit={ addContact } class="form-horizontal" id='createContactForm'>
        <!-- type -->
        

        <div class="form-group">
            <label class='col-md-3 control-label required'>*Required</label>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Contact Type<i class="required">*</i></label>
            <div class="col-md-6">
                <select class='form-control' name='typeField'>
                	<option each={ type in opts.contacttypes }>{ type.title }</option>
                </select>
            </div>
        </div>

        <!-- first name -->
        <div class="form-group">
            <label class="col-md-3 control-label">First Name<i class="required">*</i></label>
            <div class="col-md-6">
                <input type="text" class="form-control" placeholder="Jane" name='firstNameField' required='true'>
            </div>
        </div>

        <!-- last name -->
        <div class="form-group">
            <label class="col-md-3 control-label">Last Name<i class="required">*</i></label>
            <div class="col-md-6">
                <input type="text" class="form-control" placeholder="Doe" name='lastNameField' required='true'>
            </div>
        </div>

           <!-- job title -->
        <div class="form-group">
            <label class="col-md-3 control-label">Job Title</label>
            <div class="col-md-6">
                <input type="text" class="form-control" placeholder="Lead Organizer" name='jobTitleField'>
            </div>
        </div>

        <!-- age -->
        <div class="form-group">
            <label class="col-md-3 control-label">Age</label>
            <div class="col-md-6">
                <input type="text" class="form-control" placeholder="45" name='ageField'>
            </div>
        </div>

        <!-- phone1 -->
        <div class="form-group">
            <label class="col-md-3 control-label">Phone 1<i class="required">*</i></label>
            <div class="col-md-6">
                <input type="text" class="form-control" placeholder="xxx-xxx-xxx" name='phone1Field' required='true'>
            </div>
        </div>
       
         <!-- phone1 -->
        <div class="form-group">
            <label class="col-md-3 control-label">Phone 2</label>
            <div class="col-md-6">
                <input type="text" class="form-control" placeholder="xxx-xxx-xxx" name='phone2Field'>
            </div>
        </div>

          <!-- phone1 -->
        <div class="form-group">
            <label class="col-md-3 control-label">Phone 3</label>
            <div class="col-md-6">
                <input type="text" class="form-control" placeholder="xxx-xxx-xxx" name='phone3Field'>
            </div>
        </div>

        <!-- email 1 -->
        <div class="form-group">
            <label class="col-md-3 control-label">Email 1<i class="required">*</i></label>
            <div class="col-md-6">
                <input type="text" class="form-control" placeholder="jandoe@email.com" name='email1Field' required='true'>
            </div>
        </div>

        <!-- email 2 -->
        <div class="form-group">
            <label class="col-md-3 control-label">Email 2</label>
            <div class="col-md-6">
                <input type="text" class="form-control" placeholder="jandoe@email.com" name='email2Field'>
            </div>
        </div>
       
       <!-- email 3 -->
        <div class="form-group">
            <label class="col-md-3 control-label">Email 3</label>
            <div class="col-md-6">
                <input type="text" class="form-control" placeholder="jandoe@email.com" name='email3Field'>
            </div>
        </div>

         <!-- Info/Notes -->
        <div class="form-group">
            <label class="col-md-3 control-label">Notes/Info<i class="required">*</i></label>
            <div class="col-md-6">
            	<textarea class="form-control" placeholder="Describe anything relevant about this contact." rows="5" name='notesField' required='true'></textarea>	
            </div>
        </div>

        <!-- submit -->
        <div class="form-group">
            <label class="col-md-3 control-label">Submit</label>
            <div class="col-md-9">
                <button type="submit"  class="btn btn-sm btn-success">Create Contact</button>
            </div>
        </div>

    </form>
			</div>

		</div>
	</div>
</div>	

<script>
self = this
escapeButton(e){
    if (e.keyCode === 27){
        $('#contact-create-modal').modal('hide');
    }
}

resetForm(){
	this.activated = false 
	this.createContact = false 
	this.searchContact = false
	this.selectForm.value = 'default'
}

updateForm(){
	sel = this.selectForm.value
	if (sel === 'create'){
		this.createContact = true
		this.activated = true
	}else if (sel === 'search'){
		this.searchContact = true
		this.activated = true
	}
}

closeModal(){
    this.opts.bus.trigger('closeContactModal')
}

addContact(){
    
    data = {
        'typeField' : this.typeField.value,
        'firstNameField' : this.firstNameField.value,
        'lastNameField' : this.lastNameField.value,
        'jobTitleField' : this.jobTitleField.value,
        'ageField' : this.ageField.value,
        'phone1Field' : this.phone1Field.value,
        'phone2Field' : this.phone2Field.value,
        'phone3Field' : this.phone3Field.value,
        'email1Field' : this.email1Field.value,
        'email2Field' : this.email2Field.value,
        'email3Field' : this.email3Field.value,
        'notesField' : this.notesField.value,
    }
    

    store.contacts.create(data).then((contact) => {
        self.opts.bus.trigger('appendContact',contact)
    }).fail((e) => {console.log(e)})
    
    $('#contact-create-modal').modal('hide');

    this.resetCreateForm()

}

this.opts.bus.on('shutCreateContactModal',function(){
    $('#contact-create-modal').modal('hide');
})

resetCreateForm(){
    this.typeField.value = 'none'
    this.firstNameField.value = null
    this.lastNameField.value = null
    this.jobTitleField.value = null
    this.ageField.value = null
    this.phone1Field.value = null
    this.phone2Field.value = null
    this.phone3Field.value = null
    this.email1Field.value = null
    this.email2Field.value = null
    this.email3Field.value = null
    this.notesField.value = null
}


</script>

</create-contact-modal>