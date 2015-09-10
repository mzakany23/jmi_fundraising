from celery.schedules import crontab
from django.conf import settings

BROKER_URL = 'redis://localhost:6379/0'
BROKER_TRANSPORT = 'redis'
CELERY_RESULT_BACKEND = 'redis://localhost:6379/0'
CELERY_ENABLE_UTC = True


# celery -A jmi worker --loglevel=info

CELERY_ACCEPT_CONTENT = ['json']
CELERY_TASK_SERIALIZER = 'json'
CELERY_RESULT_SERIALIZER = 'json'

# CELERYBEAT_SCHEDULE = {
#     # Executes every minute
#     'scrape_craigslist_every_half_day': {
#         'task': 'home.tasks.get_craigslist_scraped_results',
#         'schedule': crontab(minute='*/1'),
#         'args': (settings.URL_LIST, settings.SEARCH_LIST),
#     },
# }