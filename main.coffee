# initialize custom coffeescript prototypes tec
do require "helpers"

# require npm modules that we may need
fs = require "fs"
plist = require 'plist'

# require custom elements for this application
config = require "./data/config"
defaults = require "./data/defaults"
defaults.plist = plist.parseFileSync("./data/default.plist")
defaults.instanceDir = "/usr/local/etc"
defaults.plistDir = "~/Library/LaunchAgents"

createPlist = (name) ->

	console.log name



# create a redis instance via setting up our configuration 
createInstance = (db, env, object) ->



# create a redis instance and proper configuration for each element that we have in the config etc
for own db, dbObject of config.redis
	for own env, object of dbObject

		do (db, env, object) ->

			# initialize proper variables for the application setup
			instanceName = "#{db}.#{env}"
			confFile = "redis.#{db}.#{env}.conf"

			# lets create a clone element here so that we can clone different objects
			currentConf = 
				include: "#{defaults.instanceDir}/redis-common.conf"
				pidfile: "/usr/local/var/run/redis-#{instanceName}.pid"
				# unixsocket: "/tmp/redis-#{instanceName}.sock"
				port: object.port
				bind: object.bind
				dbfilename: "dump-#{instanceName}.rbd"
				"vm-swap-file": "/tmp/redis-#{instanceName}.swap"

			# create our conf contents properly to save the file
			confContents = ""
			confContents += "#{key} #{_object}\n" for own key, _object of currentConf

			# # write the file to the proper directory
			fs.writeFile "confs/#{confFile}", confContents, 'utf-8', (err) =>		

				if err
					console.log err

				else
					console.log "#{instanceName} = #{object.bind}:#{object.port}"

			# now we need to create the proper Plist file
