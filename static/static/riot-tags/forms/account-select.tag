<account-list-select>
	<select class="form-control" onchange={ sendAccount } name='userSelect'>
      <option>None</option>
      <option value={ user.id } each={ user in opts.users }>
        <virtual>
          { user.first_name } { user.last_name }  
          <virtual>| { user.is_staff ? 'Staff' : 'User'}</virtual>
          <virtual>| { Admin: user.is_superuser}</virtual>
        </virtual>
      </option>
    </select>
<script>
	sendAccount(){
		accountId = this.userSelect.value
		data = {
			accountId: accountId
		}
		this.opts.bus.trigger(opts.action,data)
	}
</script>

</account-list-select>