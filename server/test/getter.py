"""
    Transforms requests response object to the python data object
"""

import json
from collections import namedtuple

def _json_object_hook(d): 
    return namedtuple('X', d.keys())(*d.values())

def _json2obj(data): 
    return json.loads(data, object_hook=_json_object_hook)

def toObj(response):

    try:
        json_string = \
            str(response.json()).\
                replace("'","double").\
                replace('"',"'").\
                replace("double", '"').\
                replace('_', "")

        return _json2obj(json_string)

    except Exception as ex:
        print('Error | ' + ex.message)         


