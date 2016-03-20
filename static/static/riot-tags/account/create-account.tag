<create-account>
	<a href="" data-target='#createUserAccount' class="btn btn-sm btn-success" data-toggle="modal"><i class="fa fa-plus-square"></i></a>

	<!-- create account modal -->
  <div class="modal" id="createUserAccount" style="display: none; padding-right: 15px;">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">Create Account</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
            
            <div class="form-group">
                <label class="col-md-3 control-label">Username</label>
                <div class="col-md-9">
                    <input type="text" class="form-control" placeholder="Username" name='usernameInput'>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Password</label>
                <div class="col-md-9">
                    <input type="password" class="form-control" placeholder="Password" name='passwordInput'>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Password Confirm</label>
                <div class="col-md-9">
                    <input type="password" class="form-control" placeholder="Confirm Password" name='passwordConfirm'>
                </div>
            </div>
        </form>

        

      </div>
      <div class="modal-footer">
        <a href="" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
        <a onclick={ createAccount } href="" class="btn btn-sm btn-success">Create</a>
      </div>
    </div>
  </div>
</div>

<script>
	createAccount(){
		data = {
			username: this.usernameInput.value,
			password: this.passwordInput.value,
			passwordConfirm: this.passwordConfirm
		}
		
		opts.store.profiles.createUserAccount(data).then((res) => {
			console.log(res)
		}).fail((e) => {console.log(e.responseText)})
	}

</script>

</create-account>