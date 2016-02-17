require(['store'],function(){
	var bus = riot.observable();
  token = Cookies.get('csrftoken')
  
  var store = new STORE('http://localhost:8000',token)
  var router = new Router()

  riot.route.stop()
 	riot.route.start(true);

  riot.mount('router',{bus:bus,store:store,router:router,store:store})
  riot.mount('notification-panel',{bus:bus,store:store,router:router})
})