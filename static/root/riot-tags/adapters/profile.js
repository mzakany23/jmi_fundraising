define(function(require){
	var self = {}
	
	var router = require('routes')
	var helper = require('util')

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
})