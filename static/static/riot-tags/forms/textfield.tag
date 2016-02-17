<textfield-component>
	<!-- username -->
	<a if={ !userEditable } onclick={ setUserEditable } href="" id="username" data-type="text" data-pk="1" data-title="Enter Username" class="editable editable-click { editable-empty: inputEmpty }" data-original-title="" title="">{ textValue }</a>

	<!-- editable box -->
	<span if={ userEditable } class="editable-container editable-inline" style="">
	<div>
	<div class="editableform-loading" style="display: none;"></div>
		<form class="form-inline editableform" style="">
			
			<div class="control-group form-group">
			<div>
				
				<!-- textfield -->
				<div class="editable-input" style="position: relative;">
						<input placeholder="{ opts.placeholder }" value="" type="text" class="form-control input-sm" style="padding-right: 24px;" name="riotTextField">
						<span onclick={ removeText } class="editable-clear-x"></span>
				</div>

				<div class="editable-buttons">
					<!-- add -->
					<button onclick={ setInput } type="submit" class="btn btn-primary btn-sm editable-submit">
						<i class="glyphicon glyphicon-ok"></i>
					</button>

					<!-- remove -->
					<button onclick={ inputOff } type="button" class="btn btn-default btn-sm editable-cancel">
						<i class="glyphicon glyphicon-remove"></i>
					</button>
			
			</div>
			</div>

			<div class="editable-error-block help-block" style="display: none;"></div>

		</div>
		</form>
	</div>
</span>

<script>
	var self = this
	this.textValue = opts.defaultval
	
	
	setUserEditable(){
		this.userEditable = true
	}

	removeText(){
		this.riotTextField.value = null
	}

	inputOff(){
		this.textValue = 'Empty'
		self.riotTextField.value = null
		opts.bus.trigger('initTextBox',null)
		this.inputEmpty = true
		this.userEditable = false
	}

	setInput(){
		this.textValue = this.riotTextField.value
		opts.bus.trigger('initTextBox',self.riotTextField.value)
		if (this.textValue === ''){
			this.textValue = 'Empty'
			this.inputEmpty = true
		}else{
			this.inputEmpty = false
		}

		this.userEditable = false
	}


</script>

</textfield-component>