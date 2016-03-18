import easypost
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from jmi.settings import EASYPOST



class APIGetRates(APIView):
	def post(self,request):
		post = request.POST
		easypost.api_key = EASYPOST['test']
		
		to_address = easypost.Address.create(
			street1= post['address[street]'],
			street2= post['address[line_2]'],
			city= post['address[city]'],
			state= post['address[state]'],
			zip= post['address[zip_code]'],
			country= 'US',
			company= post['address[organization]'],
		)

		from_address = easypost.Address.create(
			street= 'P.O. Box 1061 ',
			city= 'Zanesville',
			state= 'OH',
			zip= '43701'
		)	

		parcel={
			"length": post['parcel[length]'],
		    "width": post['parcel[width]'],
		    "height": post['parcel[height]'],
		    "weight": post['parcel[weight]']
		}    

		
		if to_address and from_address and parcel:
			shipment = easypost.Shipment.create(
			  to_address=to_address,
			  from_address=from_address,
			  parcel=parcel,
			)

			return Response(shipment.to_dict())


		return Response('there was a problem in the to address fields')
