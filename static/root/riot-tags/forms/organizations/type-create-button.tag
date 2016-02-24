<organization-type-create-box>
	<!-- editable box -->
		<span class="editable-container editable-inline" style="">
		<div>
		<div class="editableform-loading" style="display: none;"></div>
			<form class="form-inline editableform" style="">
				
				<div class="control-group form-group">
				<div>
					
					<!-- input new org type -->
					<div class="editable-input" style="position: relative;">
							<input placeholder="{ opts.placeholder }" value="" type="text" class="form-control input-sm" style="padding-right: 24px;" name="orgTypeInput">
							<span onclick={ removeText } class="editable-clear-x"></span>
					</div>

					<div class="editable-buttons">
						<!-- add -->
						<button onclick={ addType } type="submit" class="btn btn-primary btn-sm editable-submit">
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
	self = this

	inputOff(){
		opts.bus.trigger('deactivateOrgTypeInput',self.orgTypeInput.value)
	}

	addType(){
		opts.bus.trigger('addType',self.orgTypeInput)
		self.orgTypeInput.value = null
	}
</script>

</organization-type-create-box>