define(function(require){
	var self = {}

	var router = require('routes')
	var helper = require('util')

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

	return self;
})