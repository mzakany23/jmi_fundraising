define(function(require){
	var self = {}
	
	var router = require('routes')
	var helper = require('util')

	self.getTypes = function(){
		contents = helper.packageData({})
		url = router.routes.fundraiserTypes.types
		return $.get(url,contents)
	}

	return self;

})