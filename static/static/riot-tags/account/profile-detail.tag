<profile-detail>

<div class="profile-container">
                
                <!-- begin profile-section -->
                <div class="profile-section">
                    <!-- begin profile-left -->
                    <div class="profile-left">
                        <!-- begin profile-image -->
                        
                        

                        <div class="profile-image">
                            <img src="{ opts.profile.org_photo || 'http://placehold.it/196x177' }" name='profileImage'>
                            <i class="fa fa-user hide"></i>
                        </div>
                        <!-- end profile-image -->
                        <div class="m-b-10">
                            
                            <a onclick={ openImageBox } href="#" class="btn btn-warning btn-block btn-sm">Change Picture</a>

                            <input onchange={ showImagePreview } type='file' style='opacity: 0;' name='fileUpload'>

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
                                                <h4>{ opts.profile.first_name } { opts.profile.last_name }<small>{ opts.profile.organization }</small></h4>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="divider">
                                            <td colspan="2"></td>
                                        </tr>

                                        <!-- profile -->
                                        <tr class="highlight">
                                            <td class="field">Organization</td>
                                            <td if={ !showEditForm }>{ opts.profile.organization }</td>
                                            <td if={ showEditForm }>
                                                <input type="text" class="form-control" value="{ opts.profile.organization }" name='orgInput'>
                                            </td>
                                        </tr>
                                           <tr class="divider">
                                            <td colspan="2"></td>
                                        </tr>

                                        <tr>
                                            <td class="field">Phone Number</td>
                                            <td if={ !showEditForm }>{ opts.profile.phone_number }</td>
                                            <td if={ showEditForm }>
                                                <input type="text" class="form-control" value="{ opts.profile.phone_number }" name='phoneInput'>
                                            </td>
                                        </tr>
                                        
                                         <tr>
                                            <td class="field">Email</td>
                                            <td if={ !showEditForm }>{ opts.profile.email }</td>
                                            <td if={ showEditForm }>
                                                <input type="text" class="form-control" value="{ opts.profile.email }" name='emailInput'>
                                            </td>
                                        </tr>
                                            
                                        <!-- address -->
                                         <tr class="divider">
                                              <td colspan="2"></td>
                                        </tr>

                                            <tr>
                                            <td class="field">Title</td>
                                            <td if={ !showEditForm }>{ opts.profile.address.title }</td>
                                            <td if={ showEditForm }>
                                                <input type="text" class="form-control" value="{ opts.profile.address.title }" name='titleInput'>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="field">Street</td>
                                            <td if={ !showEditForm }>{ opts.profile.address.street }</td>
                                            <td if={ showEditForm }>
                                                <input type="text" class="form-control" value="{ opts.profile.address.street }" name='streetInput'>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="field">City</td>
                                            <td if={ !showEditForm }>{ opts.profile.address.city }</td>
                                            <td if={ showEditForm }>
                                                <input type="text" class="form-control" value="{ opts.profile.address.city }" name='cityInput'>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="field">State</td>
                                            <td if={ !showEditForm }>{ opts.profile.address.state }</td>
                                            <td if={ showEditForm }>
                                                <select class="form-control input-sm" name='stateInput'>
                                                    <option>{ opts.profile.address.state }</option>
                                                    <option each={ state in opts.states }>{ state }</option>
                                                </select>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="field">Zip</td>
                                            <td if={ !showEditForm }>{ opts.profile.address.zip_code }</td>
                                            <td if={ showEditForm }>
                                                <input type="text" class="form-control" value="{ opts.profile.address.zip_code }" name='zip_codeInput'>
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
                
                <!-- update profile -->
                <div class="row">
                    <div class="col-md-4">
                        <a if={ showEditForm } onclick={ closeForm } href="" class="btn btn-info">Hide Fields</a>
                        <a if={ !showEditForm } onclick={ editForm } href="" class="btn btn-info">Edit Fields</a>
                        <a onclick={ saveForm } href="" class="btn btn-danger">Save Form</a>
                    </div>
                </div>
<script>
    var self = this 

    showImagePreview(){
        input = this.fileUpload
        
        if (input.files && input.files[0]) {
            reader = new FileReader()
            file = input.files[0]
            preview = this.profileImage
            this.file = file

              reader.addEventListener("load", function () {
                    preview.src = reader.result;
                    preview.width = '200'
                    preview.height = '175'

                },false)
        }

         if (file) {
            this.previewShown = true
            reader.readAsDataURL(file);
          } 

        opts.bus.trigger('getProfile',{profile:opts.profile,file:self.file})      
    }

    openImageBox(){
        $(this.fileUpload).trigger('click')
    }

    editForm(){
        this.showEditForm = true 
    }

    closeForm(){
        this.showEditForm = false
    }

    saveForm(){
        data = {
            organization: this.orgInput.value,
            firstName: opts.profile.first_name, 
            lastName: opts.profile.last_name,
            phoneNumber: this.phoneInput.value,
            email: this.emailInput.value,
            title: this.titleInput.value,
            street: this.streetInput.value,
            city: this.cityInput.value,
            state: this.stateInput.value,
            zip: this.zip_codeInput.value
        }
    
        opts.store.profiles.update(opts.profile.id,data).then((profile) => {
            opts.profile = profile
            opts.bus.trigger('getProfile',{profile:opts.profile,file:self.file})
            alertify.success('You successfully updated the profile')
        }).fail((e) => {
            alertify.error(e.responseText)
        })
    }

    
    // observable
    opts.bus.on('getProfileDetail',function(){
        opts.bus.trigger('getProfile',{profile:opts.profile,file:self.file})
    })
</script>

</profile-detail>