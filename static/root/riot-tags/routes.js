define(function(){
	var self = {}
		
		self.init = function(server,csrftoken){
			self.server = server
			self.csrftoken = csrftoken || {}
		
			self.routes = {
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
					}
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
		
})