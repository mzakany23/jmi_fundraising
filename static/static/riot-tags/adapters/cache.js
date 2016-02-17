define(function(require){
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
})