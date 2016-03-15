<payment-status>
	<select onchange={ updateStatus } class="form-control input-sm" name='statusSelect'>
			<option>{ opts.fundraiser.status }</option>
			<option each={ option in optionsArr }>{ option }</option>
  </select>
<script>
	var self = this

	this.options = {
		'paid' : ['unpaid','in-process'],
		'unpaid' : ['paid','in-process'],
		'in-process' : ['paid','unpaid']
	}

	this.on('mount',function(){
		self.optionsArr = self.options[self.opts.fundraiser.status]
	})

	updateStatus(e){
		status = this.statusSelect.value
		fundraiser = this.opts.fundraiser
		alertify.confirm(`Change Fundraiser ${fundraiser.title} payment status to ${status}?`, function (e){
    if (e) {
        
    } else {
        self.statusSelect.value = fundraiser.status
        self.update()
    }
});
	}
</script>

</payment-status>