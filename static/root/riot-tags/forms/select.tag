<dropdown-component>
	<select onchange={ grabOption } if={ !formAdd } class="form-control input-sm" name="dropDownSelect">
		<virtual if={ opts.hasNone }>
			<option>None</option>
		</virtual>
		<option value={ option.id } each={ option in opts.options }>{ option.name }</option>
	</select>	
<script>

	this.formAdd = false
	
	showAddForm(){
		this.formAdd = true
	}

	inputOff(){
		this.formAdd = false
	}

	grabOption(){
		option = this.dropDownSelect.value
		opts.bus.trigger('sendingOrg',{id:option,title:opts.title})
	}
</script>


</dropdown-component>