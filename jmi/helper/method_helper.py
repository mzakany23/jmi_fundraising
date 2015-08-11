def return_all_objects(obj):
	try:
		o = obj.objects.all()
	except: 
		o = None

	return o