module.exports = 

	redis:
		# nice quick caching server etc -- this will be for serving up cached video documents etc
		caching:
			development:
				host: "localhost:6379"
			test:
				host: "localhost:6380"
			production
				host: "localhost:6381"

		# instance commited to building out our feed etc
		feed:
			development: 
				host: "localhost:6382"	
			test:			
				host: "localhost:6383"
			production:
				host: "localhost:6384"

		# trending functionality dedicated instance
		trending:
			development:	
				host: "localhost:6385"
			test:
				host: "localhost:6386"
			production:
				host: "localhost:6387"



