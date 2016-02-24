define(function(require){
	self = {}
	var router = require('routes')
	
	self.packageData = function(data){
		contents = {csrfmiddlewaretoken:router.csrftoken}
		for (var key in data){
			contents[key] = data[key]
		}
		return contents
	}
	return self
})