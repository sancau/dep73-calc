from eve import Eve

api = Eve()

if __name__ == '__main__':
	# not forget to set debug to False in production code
	api.run(port=8000, debug=True)