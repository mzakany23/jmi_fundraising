<fundraiser-detail>
    <style type="text/css">
        .details{
            background-color: #E4E4E4;
        }
    </style>

   <ul class="nav nav-tabs">
        <li class="active"><a href="#profile-tab" data-toggle="tab">Profile Details</a></li>
        <li class=""><a href="#fundraiser-tab" data-toggle="tab">Fundraisers</a></li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane fade active in" id="profile-tab">
            <div id="content" class="content">
            <message-notification messages={ messages } title={ messageTitle }></message-notification>
            <errors-list errors={ errors }></errors-list>

            <!-- begin breadcrumb -->
            <ol class="breadcrumb pull-right">
                <li><a href="#fundraisers">Dashboard Home</a></li>
                <li class="active">Profile Page</li>
            </ol>
            <!-- end breadcrumb -->
            <!-- begin page-header -->
            

            <h1 class="page-header">Profile Page</h1>
            <!-- end page-header -->
            <!-- begin profile-container -->
            <div class="profile-container details">
                <!-- begin profile-section -->
                <div class="profile-section">
                    <!-- begin profile-left -->
                    <div class="profile-left">
                        <!-- begin profile-image -->
                        <div class="profile-image" id='imageArea'>
                            <img if={ profile.org_photo } src="{ profile.org_photo }" width='200' height='175' id='imageVal'>
                            
                            <img if={ !profile.org_photo } src="http://placehold.it/200x175" id='imageVal'>

                            <i class="fa fa-user hide"></i>
                        </div>
                        <!-- end profile-image -->
                        <div class="m-b-10">
                            <fileupload-box csrftoken={ opts.store.routes.csrftoken } action='/api/test' server={ opts.store.routes.server } bus={ opts.bus }></fileupload-box>
                        </div>
                        <!-- begin profile-highlight -->
                        
                        <!-- end profile-highlight -->
                    </div>
                    <!-- end profile-left -->
                    <!-- begin profile-right -->
                    <div class="profile-right">
                        <!-- begin profile-info -->
                        <div class="profile-info">
                            <!-- begin table -->
                            <div class="table-responsive">
                                <table class="table table-profile">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>
                                                <h4>{ profile.organization }<small>{ profile.contact_full_name }</small></h4>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- profile section -->
                                        
                                        <tr class="highlight">
                                            <td class="field">Profile</td>
                                            <td></td>
                                        </tr>

                                        <tr class="divider">
                                            <td colspan="2"></td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="field">Organization</td>
                                            <td if={ !editable }><a onclick={ editForm } href="">{ profile.organization }</a></td>
                                            <td if={ editable }>
                                                <input type="text" class="form-control" value="{ profile.organization }"name="organization">
                                            </td>
                                        </tr>

                                         <tr>
                                            <td class="field">First Name</td>
                                            <td if={ !editable }><a onclick={ editForm } href="">{ profile.first_name }</a></td>
                                            <td if={ editable }>
                                                <input type="text" class="form-control" value="{ profile.first_name }"name="firstName">
                                            </td>
                                        </tr>

                                         <tr>
                                            <td class="field">Last Name</td>
                                            <td if={ !editable }><a onclick={ editForm } href="">{ profile.last_name }</a></td>
                                            <td if={ editable }>
                                                <input type="text" class="form-control" value="{ profile.last_name }"name="lastName">
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="field">Phone</td>
                                            <td if={ !editable }><a onclick={ editForm } href="">{ profile.phone_number }</a></td>
                                            <td if={ editable }>
                                                <input type="text" class="form-control" value="{ profile.phone_number }"name="phone">
                                            </td>
                                        </tr>

                                         <tr>
                                            <td class="field">Email</td>
                                            <td if={ !editable }><a onclick={ editForm } href="">{ profile.email }</a></td>
                                            <td if={ editable }>
                                                <input type="text" class="form-control" value="{ profile.email }"name="email">
                                            </td>
                                        </tr>
                                        

                                        <tr class="divider">
                                            <td colspan="2"></td>
                                        </tr>

                                        <tr class="divider">
                                            <td colspan="2"></td>
                                        </tr>
                                        
                                        

                                        <tr class="highlight">
                                            <td class="field">Address</td>
                                            <td></td>
                                        </tr>

                                         <tr class="divider">
                                            <td colspan="2"></td>
                                        </tr>

                                        <!-- address section -->
                                       
                                        <tr>
                                            <td class="field">Title</td>
                                            <td if={ !editable }><a onclick={ editForm } href="">{profile.address.title }</a></td>
                                            <td if={ editable }>
                                                <input type="text" class="form-control" value="{profile.address.title }"name="title">
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="field">Street</td>
                                            <td if={ !editable }><a onclick={ editForm } href="">{profile.address.street }</a></td>
                                            <td if={ editable }>
                                                <input type="text" class="form-control" value="{profile.address.street }"name="street">
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="field">City</td>
                                            <td if={ !editable }><a onclick={ editForm } href="">{profile.address.city }</a></td>
                                            <td if={ editable }>
                                                <input type="text" class="form-control" value="{profile.address.city }"name="city">
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="field">State</td>
                                            <td if={ !editable }><a onclick={ editForm } href="">{profile.address.state }</a></td>
                                            <td if={ editable }>
                                                <select class="form-control" name='state'>
                                                    <option>{profile.address.state }</option>
                                                    <option each={ state in states }>{ state }</option>
                                                </select>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="field">Zip</td>
                                            <td if={ !editable }><a onclick={ editForm } href="">{profile.address.zip_code }</a></td>
                                            <td if={ editable }>
                                                <input type="text" class="form-control" value="{profile.address.zip_code }"name="zip">
                                            </td>
                                        </tr>
                                       
                                        
                                    </tbody>
                                </table>
                            </div>
                            <!-- end table -->
                        </div>
                        <!-- end profile-info -->
                    </div>
                    <!-- end profile-right -->
                
                </div>
                <!-- end profile-section -->
                <!-- begin profile-section -->
                
            <div class="row">
                <div class="col-md-4">
                    <a onclick={ editForm } href="" class="btn btn-info">Edit Fields</a>
                    <a onclick={ saveForm } href="" class="btn btn-danger">Save Form</a>
                </div>
            </div>
            </div>
            <!-- end profile-container -->
        </div>

        </div>

        <div class="tab-pane fade" id="fundraiser-tab">
            <profile-fundraisers fundraisers={ profileFundraisers }></profile-fundraisers>    
        </div>

    </div>

	
<script>
this.states = ['AK','AL','AR','AZ','CA','CO','CT','DE','FL','GA','HI','IA','ID','IL','IN','KS','KY','LA','MA','MD','ME','MI','MN','MO','MS','MT','NC','ND','NE','NH','NJ','NM','NV','NY','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VA','VT','WA','WI','WV','WY']

this.on('mount',function(){
    scroll(0,0)
    this.initProfileFundraisers()
});

var self = this
this.profile = this.opts.fundraiser.profile 

this.editable = false

editForm(){
    this.editable = true
}

initProfileFundraisers(){
    id = opts.fundraiser.profile.id 
    store = opts.store 

    opts.store.fundraisers.filterById(id).then((fundraisers) => {
        self.profileFundraisers = fundraisers
        self.update()
    }).fail((e) => {console.log(e)})
}

saveForm(){
    this.initFormValues()
    this.errors = null
    this.messages = null
    id = this.profile.id
    this.opts.store.profiles.update(id,{addressForm:this.addressForm,profileForm:this.profileForm})
    .then((res) => {
        scroll(0,0)
        this.messages = [`You Successfully Updated the profile for ${res.organization}`]
        this.messageTitle = 'Success!'
        self.profile = res
        self.editable = false
        self.opts.bus.trigger('successMessage',`You successfully updated the ${res.organization} profile!`)
        self.update()
    })
    .fail((e) => {
        scroll(0,0)
        forms = JSON.parse(e.responseText)
        self.addressErrors = self.opts.store.getFormErrors(forms.address_errors)
        self.profileErrors = self.opts.store.getFormErrors(forms.profile_errors)
        self.errors = self.profileErrors.concat(self.addressErrors) || null
        self.update()
    });

}

initFormValues(){
    organization = this.capitalizeFirstLetter(this.organization.value)
    firstName    = this.firstName.value 
    lastName     = this.lastName.value 
    phoneNumber  = this.phone.value 
    email        = this.email.value 

    // address
    title        = this.capitalizeFirstLetter(this.title.value)
    street       = this.street.value 
    city         = this.city.value 
    state        = this.state.value 
    zip          = this.zip.value 

    this.profileForm = {
        organization:organization,
        firstName:firstName,
        lastName:lastName,
        phoneNumber:phoneNumber,
        email:email
    }

    this.addressForm = {
        title:title,
        street,street,
        city:city,
        state,state,
        zip:zip
    }
}

capitalizeFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}

</script>

</fundraiser-detail>