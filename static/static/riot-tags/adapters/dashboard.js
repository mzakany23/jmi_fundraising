define(function(require){
	var self = {}

	var router = require('routes')
	var helper = require('util')

	self.stats = function(){
		contents = helper.packageData({})
		url = router.routes.dashboard.stats
		return $.get(url,contents)
	}

	return self;
})