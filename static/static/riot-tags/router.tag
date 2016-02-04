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
			// page and results
			}else if (q.page && q.results){
				store.fundraisers.show(q.page,q.results).then((fundraisers) => {
	        	mount('fundraiser-list',{bus:bus,store:store,model:fundraisers})
	      }).fail((e) => {console.log(e)})

	     // just page
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
				riot.route('/fundraisers/?page=1')	
				// store.fundraisers.show().then((fundraisers) => {
				// 	mount('fundraiser-list',{bus:bus,store:store,model:fundraisers})
				// }).fail((e) => console.log(e))
			}	
		}, //end fundraiser
		organizations: function(id,action){
			q = riot.route.query()
			pageNum = q.page 
			results = q.results
			
			if (pageNum && results){
				store.profiles.showPaginated(pageNum,results).then((profiles) => {
	        mount('organizations-list',{bus:bus,store:store,profiles,profiles})
	      }).fail((e) => {console.log(e)})
			}else if (pageNum){
				store.profiles.showPaginated(pageNum).then((profiles) => {
					mount('organizations-list',{bus:bus,store:store,profiles,profiles})
				});
			}else{
				riot.route('/organizations/?page=1')	
			}
			
			

		}
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