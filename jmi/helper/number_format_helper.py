class NumberFormat:
	def __init__(self,**kwargs):
		self.float = kwargs['float']
		
	def to_dollars(self):
		return "%.2f" % self.float