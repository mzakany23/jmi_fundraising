import sys 
sys.path.append('../../static/static/jmi-images')

from django.test import TestCase, Client

from image_helper import ImageHelper

class ImageHelperTest(TestCase):
	
	def setUp(self):
		image = 'logo.png'
		self.uploaded_image = ImageHelper(image=image)

		
	def test_resize(self):
		pass
	
	
	
	


if __name__ == '__main__':
    unittest.main()
		

