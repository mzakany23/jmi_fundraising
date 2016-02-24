<search-box>
	<style type="text/css">
		.search{
			color: black;
		}
		
		#search-results{
			padding-left: 0px;
			border: 4px solid #242a30;
			color: black;
			border: 2px solid #B6C4C6; 
			position:absolute;
			width: 482px;
			min-height: 20px;
			max-height: 500px;
			z-index: 9999;
			text-align: left;
			background-color: #E1E1E1;
			overflow: auto;
			cursor: default;
		}

		#search-results ul{
			list-style: none;
			display: block;
		}

		#search-results li{
			padding-top: 2px;
			padding-bottom: 2px;
		}

		.hovered{
			background-color: #50B2C4;
		}

		hr{
			margin-top: 2px;
			margin-bottom: 10px;
		}

	</style>

	<input onkeyup={ search } class="search" type='text' placeholder="Search { opts.title }" name='searchResult'>

	<div if={ activated } id='search-results'>
		<h4 style='margin-left: 10px;'>Searched { opts.model.length } fundraisers : found { autoCompleteRes.length }</h4>
		<hr>
		<ul>
			<li each={ object in autoCompleteRes } onkeyup={ search } onmouseleave={ autoCompResMouseLeave } onmouseenter={ autoCompResMouseEnter }><a href="#fundraisers/{ object.id }">{ object.title }</a></li>
		</ul>
	</div>

<script>
	self = this
	this.autoCompleteRes = []
	this.activated = false

	this.status = {
		'in-process': 'warning',
		'paid': 'success',
		'unpaid': 'danger'
	}

	search(e){

		// escape
		if (e.keyCode == 27){
    	this.activated = false
    }else{

			search = this.searchResult.value.toLowerCase()
			searchLen = search.length

			foundResults = []

			if (searchLen > 0){
				for (var key in opts.model){
					title = opts.model[key].title
					match = title.slice(0,searchLen).toLowerCase()
					if (search === match){
						this.activated = true
						foundResults.push(opts.model[key])
					}
				}
				this.autoCompleteRes = foundResults
			}else{
				this.activated = false
			}
		}
	}

	autoCompResMouseEnter(e){
		$(e.target).addClass('hovered')
	}

	autoCompResMouseLeave(e){
		$(e.target).removeClass('hovered')
	}
</script>

</search-box>