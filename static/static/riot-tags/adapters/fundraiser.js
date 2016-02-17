define(function(require){
	var self = {}
	
	var router = require('routes')
	var helper = require('util')

	// crud
		self.create = function(fundraiser_id,data){
			contents = helper.packageData(data)
			url = router.routes.fundraisers.create(fundraiser_id)
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
})