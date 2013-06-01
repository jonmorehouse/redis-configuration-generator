module.exports = 

	install:
		mac: 
			plist: "~/Library/LaunchAgents/homebrew.mxcl.nginx.plist"
			plistPermissions: "733"
			confDir: "/usr/local/etc/"
			confPermissions: "622"
	redis:
		# caching db 
		caching:
			development:
				bind: "127.0.0.1"
				port: 6380
			test:
				bind: "127.0.0.1"
				port: 6380
			production:
				bind: "127.0.0.1"
				port: 6380

		# redis feed functionality
		feed:
			development: 
				bind: "127.0.0.1"
				port: 6380
			test:
				bind: "127.0.0.1"
				port: 6380
			production:	
				bind: "127.0.0.1"
				port: 6380

		# trending element here
		trending:
			development:
				bind: "127.0.0.1"
				port: 6380
			test:
				bind: "127.0.0.1"
				port: 6380
			production:
				bind: "127.0.0.1"
				port: 6380
