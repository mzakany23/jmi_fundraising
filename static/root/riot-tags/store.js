var ROUTING = (function(){
		var self = {}
		
		self.init = function(server,csrftoken){
			self.server = server
			self.csrftoken = csrftoken || {}
		
			self.routes = {
				contacts: {
					create: `${self.server}/api/contacts/create/`,
					types: `${self.server}/api/contacts/types/`,
				},
				dashboard:{
					stats: `${self.server}/api/dashboard/stats/`,
				},
				fundraisers: {
					create: `${self.server}/api/fundraisers/create/`,
					all: `${self.server}/api/fundraisers/all/`,
					show(pageNum,results){
						if (pageNum && results){
							return `${self.server}/api/fundraisers/?page=${pageNum}&results=${results}`	
						}else if (pageNum && results === undefined){
							return `${self.server}/api/fundraisers/?page=${pageNum}`	
						}else{
							return `${self.server}/api/fundraisers/?page=1`
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
					filterById(id){
						return `${self.server}/api/fundraisers/all/?filter=${id}`
					}
				},
				fundraiserTypes: {
					types: `${self.server}/api/fundraisers/types/`,
				},
				profiles: {
					show: `${self.server}/api/profiles/`,
					showPaginated(pageNum,results){
						if (pageNum && results){
							return `${self.server}/api/paginated-profiles/?page=${pageNum}&results=${results}`	
						}else if (pageNum){
							return `${self.server}/api/paginated-profiles/?page=${pageNum}`	
						}else{
							return `${self.server}/api/paginated-profiles/?page=1`
						}
						
					},
					create: `${self.server}/api/profiles/create/`,
					getByTitle(title){
						return `${self.server}/api/profiles/?title=${title}`
					},
					update(id){
						return `${self.server}/api/profiles/${id}/edit/`
					}
				},
				organizations: {
					show: `${self.server}/api/organizations/`,
					types: `${self.server}/api/organizations/types`,
					findById(id){
						return `${self.server}/api/organizations/${id}`
					},
					orgContacts(id){
						return `${self.server}/api/organizations/${id}/contacts`
					},
					create: `${self.server}/api/organizations/create`
				},
				products: {
					show(pageNum,results){
						if (pageNum && results){
							return `${self.server}/api/products/?page=${pageNum}&results=${results}`	
						}else if (pageNum){
							return `${self.server}/api/products/?page=${pageNum}`	
						}else{
							return `${self.server}/api/products/?page=1`
						}
					},
					showByCategory: `${self.server}/api/products-by-category/`,
				}
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


var CONTACTS = (function(router,helper){
	var self = {}

	self.create = function(data){
		contents = helper.packageData(data)
		url = router.routes.contacts.create
		return $.post(url,contents)
	}

	self.types = function(){
		contents = helper.packageData({})
		url = router.routes.contacts.types
		return $.get(url,contents)
	}

	return self;
})(ROUTING,UTIL);

var DASHBOARD = (function(router,helper){
	var self = {}

	self.stats = function(){
		contents = helper.packageData({})
		url = router.routes.dashboard.stats
		return $.get(url,contents)
	}

	return self;
})(ROUTING,UTIL);

var FUNDRAISERTYPES = (function(router,helper){
	var self = {}

	self.getTypes = function(){
		contents = helper.packageData({})
		url = router.routes.fundraiserTypes.types
		return $.get(url,contents)
	}

	return self;
})(ROUTING,UTIL);

var ORGANIZATIONS = (function(router,helper){
	var self = {}

	self.types = function(){
		contents = helper.packageData({})
		url = router.routes.organizations.types
		return $.get(url,contents)
	}

	self.show = function(){
		contents = helper.packageData({})
		url = router.routes.organizations.show
		return $.get(url,contents)
	}

	self.findById = function(id){
		contents = helper.packageData({})
		url = router.routes.organizations.findById(id)
		return $.get(url,contents)
	}

	self.orgContacts = function(id){
		contents = helper.packageData({})
		url = router.routes.organizations.orgContacts(id)
		return $.get(url,contents)
	}

	self.create = function(data){
		contents = helper.packageData(data)
		url = router.routes.organizations.create
		return $.post(url,contents)	
	}

	return self;
})(ROUTING,UTIL);


var PRODUCTS = (function(router,helper){
	var self = {}

	self.show = function(pageNum,results){
		contents = helper.packageData({})
		url = router.routes.products.show(pageNum,results)
		return $.get(url,contents)
	}

	self.showByCategory = function(){
		contents = helper.packageData({})
		url = router.routes.products.showByCategory
		return $.get(url,contents)
	}

	return self;
})(ROUTING,UTIL);


var PROFILES = (function(router,helper){
	var self = {}

	self.show = function(){
		contents = helper.packageData({})
		url = router.routes.profiles.show
		return $.get(url,contents)
	}

	self.showPaginated = function(pageNum,results){
		contents = helper.packageData({})
		url = router.routes.profiles.showPaginated(pageNum,results)
		return $.get(url,contents)
	}

	self.create = function(data){
		contents = helper.packageData(data)
		url = router.routes.profiles.create 
		return $.post(url,contents)
	}

	self.getByTitle = function(title){
		contents = helper.packageData({})
		url = router.routes.profiles.getByTitle(title)
		return $.get(url,contents)
	}

	self.update = function(id,data){
		contents = helper.packageData(data)
		url = router.routes.profiles.update(id)
		return $.post(url,contents)
	}

	return self;
})(ROUTING,UTIL);

var FUNDRAISER = (function(router,helper){
	var self = {}
	
	// crud
		self.create = function(data){
			contents = helper.packageData(data)
			url = router.routes.fundraisers.create
			return $.post(url,contents)
		}

		self.all = function(){
			contents = helper.packageData({})
			url = router.routes.fundraisers.all
			return $.get(url,contents)
		}

		self.show = function(pageNum,results){
			contents = helper.packageData({})
			url = router.routes.fundraisers.show(pageNum,results)
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

		self.filterById = function(id){
			contents = helper.packageData({})
			url = router.routes.fundraisers.filterById(id)
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

var STORE = (function(
	fundraisers,
	fundraiserTypes,
	profiles,
	router,
	cache,
	products,
	dashboard,
	organizations,
	contacts
	){
	// private
	var self = {};
	
	self.init = function(server,token){
		router.init(server,token)
	}

	function STORE(server,token){
		self.init(server,token)
		// app
		this.routes = router
		this.fundraisers = fundraisers
		this.fundraiserTypes = fundraiserTypes
		this.profiles = profiles
		this.products = products 
		this.dashboard = dashboard
		this.organizations = organizations
		this.contacts = contacts

		// modules
		this.cache = cache
		this.validations = {
			fieldBlank(field){
				if (field) {
					return false
				}else{
					return true
				}
			}
		}

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

		this.getFormErrors = function(form){
			errors = []
			for (var key in form){
				value = form[key]
				errors.push(`${key}: ${value}`)
			}
			return errors
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

	  this.findAndDelete = function(arr,id){
			for(var i =0; i< arr.length;i++){
				oldId = arr[i].id.toString()
				newId = id.toString()

				if (oldId === newId){
					return arr.splice(i, 1);
					// return arr
				}
			}
			// return false
			return arr
	}
	
		// end functions
	}
	return STORE
})(
	FUNDRAISER,
	FUNDRAISERTYPES,
	PROFILES,
	ROUTING,
	CACHE,
	PRODUCTS,
	DASHBOARD,
	ORGANIZATIONS,
	CONTACTS
)
