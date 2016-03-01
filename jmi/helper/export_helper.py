import csv
from datetime import datetime
from fundraiser.models import Fundraiser

class CSVExporter:
	def __init__(self,to_file):
		self.to_file = to_file

	def export_fundraisers(self):
		if self.to_file:
			with open(self.to_file,'wb') as csvfile:
				writer = csv.writer(csvfile)
				writer.writerow([
					'organization'.upper(),
					'contact'.upper(),
					'email'.upper(),
					'phone'.upper(),
					'shipping street'.upper(),
					'city'.upper(),
					'state'.upper(),
					'zip'.upper(),
					'DATE SAMPLES SENT',
					'START DATE',
					'END DATE',
					'# OF JARS',
					'$ AMOUNT',
					'CHIPS',
					'$ AMOUNT',
					'PAYMENT',
					'PAYMENT RECEIVED',
					'NOTES',
					'SHIP DATE',
					'ORGANIZATION ADDRESS',					
				])
				for fr in Fundraiser.objects.all().order_by('-created'):
					try:
						shipment = fr.shipment().address
					except:
						shipment = None 

					try:
						profile = fr.profile
					except:
						profile = None

					if shipment and profile:

						writer.writerow([
							fr.organization(),
							"%s %s" % (fr.profile.first_name,fr.profile.last_name,),
							fr.profile.email,
							fr.profile.phone_number,
							fr.shipment().address.street,
							fr.shipment().address.city,
							fr.shipment().address.state,
							fr.shipment().address.zip_code,
							'DATE SAMPLES SENT',
							'START DATE',
							'END DATE',
							'# OF JARS',
							'CHIPS',
							fr.total_cost_in_dollars(),
							'PAYMENT',
							'PAYMENT RECEIVED',
							'NOTES',
							'SHIP DATE',
							'ORGANIZATION ADDRESS',		
							
														
							
						])

					if not profile and shipment:
						writer.writerow([
							fr.organization(),
							"%s %s" % (fr.profile.first_name,fr.profile.last_name,),
							'blank',
							'blank',
							fr.shipment().address.street,
							fr.shipment().address.city,
							fr.shipment().address.state,
							fr.shipment().address.zip_code,
							'DATE SAMPLES SENT',
							'START DATE',
							'END DATE',
							'# OF JARS',
							'$ AMOUNT',
							'CHIPS',
							fr.total_cost_in_dollars(),
							'PAYMENT',
							'PAYMENT RECEIVED',
							'NOTES',
							'SHIP DATE',
							'ORGANIZATION ADDRESS',		
							
							
							
						])

					else:
						writer.writerow([
							'blank',
							'blank',
							'blank',
							'blank',
							'blank',
							'blank',
							'blank',
							'blank',
							'DATE SAMPLES SENT',
							'START DATE',
							'END DATE',
							'# OF JARS',
							'CHIPS',
							fr.total_cost_in_dollars(),
							'PAYMENT',
							'PAYMENT RECEIVED',
							'NOTES',
							'SHIP DATE',
							'ORGANIZATION ADDRESS',		
													
						])
		else:
			raise 'There is no to_file'
