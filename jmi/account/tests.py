from django.test import TestCase
from models import Profile,PasswordReset
from django.contrib.auth.models import User
from datetime import timedelta,datetime
from fundraiser.tasks import send_password_reset_email
from django.template import loader
from models import PasswordReset


class AccountTest(TestCase):
	def setUp(self):
		user = User.objects.create_user('john', 'lennon@thebeatles.com', 'johnpassword')
		self.profile = Profile.objects.create(
			organization='The Beatles',
			first_name='John',
			last_name='Lennon',
			email='mzakany@gmail.com',
			account=user
		)
		self.reset = PasswordReset.objects.create(user=user)

	
	def test_create_hashed_key(self):
		self.assertTrue (self.reset.key > 10)
	
	def test_expired_is_false(self):
		self.assertTrue (self.reset.expired is False)

	def test_is_expired(self):
		now = datetime.now() - timedelta(minutes=15)
		then = datetime.now()
		self.assertTrue ((then-now).total_seconds()/60) > 14
	
	def test_password_reset(self):
		password_reset_link =  'http://localhost:8000'+self.reset.generate_reset_link()
		
		template = '../../static/templates/emails/password_reset.html'

		context = {'profile' : self.profile,'password_reset_link' : password_reset_link}

		html_email = loader.render_to_string(template,context)

		send_password_reset_email.delay(
			str(self.profile.organization+' Fundraiser'), 
			'Jose Madrid Salsa fundraising <mike@josemadridsalsa.com>',
			[self.profile.email],
			html_email
		)
		
	


if __name__ == '__main__':
    unittest.main()
		


