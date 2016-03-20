'''
Database settings
=================
'''
MONGO_HOST = 'localhost'
MONGO_PORT = 27017
MONGO_DBNAME = 'dep73-calc'

'''
API settings
=================
'''

# should specify a client application host domain
# for the CORS to work properly
X_DOMAINS = [
    'http://localhost:9000'
]

X_HEADERS = [
    'Content-Type',
    'If-Match'
]

URL_PREFIX = 'api'
API_VERSION = 'v1'
RESOURCE_METHODS = ['GET', 'POST']
ITEM_METHODS = ['GET', 'PATCH', 'PUT', 'DELETE']

'''
Entities schemas
==================
'''
CALCULATION_SCHEMA = \
{
    'general': {
        'type': 'dict',
        'empty': False,
        'required': True,
    },
    'climatic': {
        'type': 'dict',
        'empty': False,
        'required': True,
    },
    'meta': {
        'type': 'dict',
        'empty': False,
        'required': True,
    }
}

'''
Endpoints settings
==================
'''
CALCULATION_SETTINGS = \
{
    'item_title': 'calculation',
    # 'cache_control': 'max-age=10, must-revalidate',
    # 'cache_expires' : 10,
    'resource_methods': ['GET','POST'],
    'item_methods': ['GET', 'PUT', 'DELETE'],
    'schema': CALCULATION_SCHEMA
}

'''
Domain settings
=================
'''
DOMAIN = \
{
    'calculation': CALCULATION_SETTINGS
}