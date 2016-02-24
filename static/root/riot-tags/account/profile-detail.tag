<profile-detail>
<div class="profile-container">
                <!-- begin profile-section -->
                <div class="profile-section">
                    <!-- begin profile-left -->
                    <div class="profile-left">
                        <!-- begin profile-image -->
                        <div class="profile-image">
                            <img src="assets/img/profile-cover.jpg">
                            <i class="fa fa-user hide"></i>
                        </div>
                        <!-- end profile-image -->
                        <div class="m-b-10">
                            <a href="#" class="btn btn-warning btn-block btn-sm">Change Picture</a>
                        </div>
                        <!-- begin profile-highlight -->
                        <div class="profile-highlight">
                            
                        </div>
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
                                            <td>{ opts.profile.organization }</td>
                                        </tr>
                                           <tr class="divider">
                                            <td colspan="2"></td>
                                        </tr>

                                        <tr>
                                            <td class="field">Phone Number</td>
                                            <td>{ opts.profile.phone_number }</td>
                                        </tr>
                                        
                                         <tr>
                                            <td class="field">Email</td>
                                            <td>{ opts.profile.email }</td>
                                        </tr>
                                            
                                        <!-- address -->
                                         <tr class="divider">
                                              <td colspan="2"></td>
                                        </tr>

                                            <tr>
                                            <td class="field">Title</td>
                                            <td>{ opts.profile.address.title }</td>
                                        </tr>

                                        <tr>
                                            <td class="field">Street</td>
                                            <td>{ opts.profile.address.street }</td>
                                        </tr>

                                        <tr>
                                            <td class="field">City</td>
                                            <td>{ opts.profile.address.city }</td>
                                        </tr>
                                        <tr>
                                            <td class="field">State</td>
                                            <td>{ opts.profile.address.state }</td>
                                        </tr>

                                        <tr>
                                            <td class="field">Zip</td>
                                            <td>{ opts.profile.address.zip_code }</td>
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
                        <a onclick={ editForm } href="" class="btn btn-info">Edit Fields</a>
                        <a onclick={ saveForm } href="" class="btn btn-danger">Save Form</a>
                    </div>
                </div>
<script>

</script>

</profile-detail>