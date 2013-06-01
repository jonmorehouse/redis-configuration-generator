module.exports = 

	install:
		mac: 
			plist: "~/Library/LaunchAgents/homebrew.mxcl.nginx.plist"
			plistPermissions: "733"
			confDir: "/usr/local/etc/"
			confPermissions: "622"
	redis:
		caching:
			development:
				host: "localhost:6380"
			test:
				host: "localhost:6381"
			production:
				host: "localhost:6382"

		feed:
			development: 
				host: "localhost:6383"
			test:
				host: "localhost:6384"
			production:	
				host: "localhost:6385"

		trending:
			development:
				host: "localhost:6386"
			test:
				host: "localhost:6387"
			production:
				host: "localhost:6388"
				
