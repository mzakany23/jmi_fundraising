<page-results>
	<style type="text/css">
		.select-box{
			width: 200px;
			margin-bottom: 15px;
		}
	</style>

	<select onchange={ changeResults } class="form-control input-sm select-box" name='selectBox'>
    <option each={ option in opts.options } id='option{option}' value="{ option }">{ option } results per page</option>
	</select>

<script>
	q = riot.route.query()
	
	this.on('mount',function(){
		results = q.results
		tag = `#option${results}`
		$(tag).prop('selected',true)
	})

	changeResults(){
		page = q.page
		results = this.selectBox.value
		url = `/${opts.page}?page=${page}&results=${results}`
		riot.route(url)
	}
</script>

</page-results>