<router>
	
<script>
	self = this
	var currentTag = null
	var currentRoute = null
	var path = window.location.pathname;
	var lastRoute = null
	var lastFullRoute = null

	function mount(tag,options){
		currentTag && currentTag.unmount(true)
		currentTag = riot.mount('div#container',tag,options)[0]
	}

	var routes = {
		home: function(id,action){
			
		},
		fundraisers: function(id,action){
			q = riot.route.query()

			// create
			if (id === 'create'){
				mount('fundraiser-create',{bus:bus,store:store})
			// query params
			}else if (q.page) {
				store.fundraisers.show(q.page).then((fundraisers) => {
        	mount('fundraiser-list',{bus:bus,store:store,model:fundraisers})
      }).fail((e) => {console.log(e)})

			// detail
			}else if (id) {
				if (!this.currentTag){
					$.get('http://localhost:8000/api/fundraisers/' + id).then((fundraiser) => {
						mount('fundraiser-detail',{bus:bus,store:store,fundraiser:fundraiser})
					})
				}else {
					mount('fundraiser-detail',{bus:bus,store:store,fundraiser:fundraiser})
				}

			// list
			}else {
				store.fundraisers.show().then((fundraisers) => {
					mount('fundraiser-list',{bus:bus,store:store,model:fundraisers})
				}).fail((e) => console.log(e))
			}	
		}, //end fundraiser
	}

	function redirectTo(url){
		window.location.replace(url)
	}

	function handler(collection,id,action){
		lastRoute = collection
		lastFullRoute = `${path}#${collection}`
		// lastRoute = collection
	
		var fn = routes[collection || 'home']
		if (fn) {
			fn(id,action)
		}else{
			redirectTo('/dashboard/#/fundraisers')
		}
	}
	
	riot.route(handler);
</script>

</router>