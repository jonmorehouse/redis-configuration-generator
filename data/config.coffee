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
				port: "6380"
				bind: "127.0.0.1"

			test:
				port: "6381"
				bind: "127.0.0.1"
			production:
				port:"6382"
				bind: "127.0.0.1"

		feed:
			development: 
				port:"6383"
				bind: "127.0.0.1"
			test:
				port:"6384"
				bind: "127.0.0.1"
			production:	
				port:"6385"
				bind: "127.0.0.1"

		trending:
			development:
				port:"6386"
				bind: "127.0.0.1"
			test:
				port:"6387"
				bind: "127.0.0.1"
			production:
				port:"6388"
				bind: "127.0.0.1"
				
		facebook:		
			development:
				port: "6389"
				bind: "127.0.0.1"
			test:
				port: "6390"
				bind: "127.0.0.1"
			production:
				port: "6391"
				bind: "127.0.0.1"
			
