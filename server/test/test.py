# test scipts @ dep73-calc/server 
# author: Alexadet Tatchin @ github.com/sancau

import requests

from getter import toObj

# config
CALCULATION_URL = 'http://127.0.0.1:8000/api/v1/calculation'

# test object
payload = {
	"meta": {"meta" : "test"},
 	"climatic": {"climatic": "test"},
  	"general": {"general": "test"}
}

print(payload)

# try to create in item
res = requests.post(CALCULATION_URL, data=payload)
print(res.json())

# try to get created entity
res = requests.get(CALCULATION_URL + '/' + toObj(res).id)
print(res.json())

# get all calculations
res = requests.get(CALCULATION_URL)
print(toObj(res).meta.total)


'''
FOR CURL TEST requests

curl -d '[{ "climatic": {"prop" : "CLIMATIC"}, "general": {"prop" : "general", "prop2": 25}, "meta": {"prop" : "META"} }]' -H 'Content-Type: application/json'  http://127.0.0.1:8000/api/v1/calculation

'''