define(function(require){

	var self = {};
	var router = require('routes')

	self.init = function(server,token){
		router.init(server,token)
	}

	function STORE(server,token){
		self.init(server,token)
		
		// app
		// this.fundraisers = require('adapters/fundraisers')
		// this.fundraiserTypes = require('adapters/fundraiserTypes')
		// this.organizations = require('adapters/organizations')
		// this.products = require('adapters/products') 
		// this.profiles = require('adapters/profiles')
		
		// util
		this.routes = require('routes')
		this.cache = require('adapters/cache')
		this.dashboard = require('adapters/dashboard')
		
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
})