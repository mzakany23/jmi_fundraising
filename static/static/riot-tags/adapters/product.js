define(function(require){
	var self = {}

	var router = require('routes')
	var helper = require('util')

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
})