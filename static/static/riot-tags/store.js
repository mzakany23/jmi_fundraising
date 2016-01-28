var ROUTING = (function(){
		var self = {}
		
		self.init = function(server,csrftoken){
			self.server = server
			self.csrftoken = csrftoken || {}
		
			self.routes = {
				fundraisers: {
					create: `${self.server}/api/fundraisers/create/`,
					show(pageNum){
						if (pageNum){
							return `${self.server}/api/fundraisers/?page=${pageNum}`	
						}else{
							return `${self.server}/api/fundraisers/`
						}
					},
					update(id){
						return `${self.server}/api/fundraisers/update/${id}/`
					},
					delete(id){
						return `${self.server}/api/fundraisers/delete/${id}/`
					},
					getById(id){
						return `${self.server}/api/fundraisers/${id}`
					},
					
				},
			// end fundraiser
			}
		}

		return self
		
})();

var Router = (function(router){
	var Router = function(){
		var self = {}
		
		this.init = function(obj,tag,riot){
			self.page = obj.page
			self.id = obj.id
			self.action = obj.action
			self.tag = tag
			self.q = riot.route.query()
			self.riot = riot
		}

		this.getRoute = function(){
			try{
				route = router.routes[self.page]	
			}catch(e){
				route = null
			}
			return route
		}

		this.processRoutes = function(){
			baseRoute = this.getRoute()

			// if /fundraisers
			if (baseRoute){
				if (self.page && self.id && self.action){

				}else if (self.page && self.id){
					cache = self.tag.opts.store.getCache()
					record = self.tag.opts.store.findById(self.id,cache.results)
					if (record) {
						
					}
					
				}else if (self.page){
					self.tag.opts.store[self.page].show(self.q.page).then((model) => {
						self.tag.opts.store.initModel(model)
						self.tag.initPage(model)
					}).fail((e) => {console.log(e)})
		
				} //end if
			
			} //endif
						
		}

		// private
		this._findKey = function(key,arr){
			for (var name in arr) {
				if (key === name ) return arr[name];
			}	
			return false
		}

	}
	return Router
})(ROUTING)


var UTIL = (function(router){
	self = {}
	self.packageData = function(data){
		contents = {csrfmiddlewaretoken:router.csrftoken}
		for (var key in data){
			contents[key] = data[key]
		}
		return contents
	}
	return self
})(ROUTING);



var FUNDRAISER = (function(router,helper){
	var self = {}
	
	// crud
		self.create = function(fundraiser_id,data){
			contents = helper.packageData(data)
			url = router.routes.fundraisers.create(fundraiser_id)
			return $.post(url,contents)
		}

		self.show = function(pageNum){
			contents = helper.packageData({})
			url = router.routes.fundraisers.show(pageNum)
			return $.get(url,contents)
		}

		self.update = function(id,data){
			contents = helper.packageData(data)
			url = router.routes.fundraisers.update(id)
			return $.post(url,contents)
		}

		self.delete = function(fundraiserId){
			contents = helper.packageData({})
			url = router.routes.fundraisers.delete(id)
			return $.post(url,contents)
		}

		self.getById = function(id){
			contents = helper.packageData({})
			url = router.routes.fundraisers.getById(id)
			return $.get(url,contents)
		}

		// end crud
		return self
})(ROUTING,UTIL);


var CACHE = (function(){
	var self = {}
	self.arr = null

	self.fill = function(arr){
		self.arr = arr
	}

	self.flush = function(){
		self.arr = null
	}

	self.cacheArr = function(){
		if (self.arr){
			return self.arr 
		}else{
			return false
		}
	}

	return self;
})();

var STORE = (function(fundraisers,router,cache){
	// private
	var self = {};
	
	self.init = function(server,token){
		router.init(server,token)
	}

	function STORE(server,token){
		self.init(server,token)
		// modules
		this.routes = router
		this.fundraisers = fundraisers
		this.cache = cache
	
		// methods
		this.initModel = function(arr){
			this.cache.fill(arr)
			return this.getCache()
		}

		this.hasCache = function(){
			if (this.cache.cacheArr()) {
				return true
			}else{
				return false
			}
		}

		this.getCache = function(){
			return this.cache.cacheArr()
		}

		this.findById = function(id,objArray){
			for (var i in objArray){
				record = objArray[i]
				id = parseInt(id)
				if (record.id === id) {
					return record
				}
			}
			return false
	  }

	  this.findAndDelete = function(items,id){
		for(var i =0; i< items.length;i++){
			if (items[i].id === id){
				items.splice(i, 1);
				return true
			}
		}
		return false
	}
		
		// end functions
	}
	return STORE
})(FUNDRAISER,ROUTING,CACHE)
