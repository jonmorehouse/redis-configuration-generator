config = require "./data/config"
defaults = require "./data/defaults"
do require "helpers"
fs = require "fs"

# create a redis instance via setting up our configuration 
createInstance = (db, env, object) ->

	# create a file here and set up the proper information etc
	# lets create a clone element here so that we can clone different objects
	currentConf = defaults.conf.clone().extend object

	# initialize some variables etc
	instanceName = "#{db}.#{env}"
	confFile = "redis.#{db}.#{env}.conf"
	currentConf.pidfile = "/usr/local/var/run/redis-#{instanceName}.pid"

	# create our conf contents properly to save the file
	confContents = ""
	confContents += "#{key} #{object}\n" for own key, object of currentConf

	# write the file to the proper directory
	fs.writeFile "confs/#{confFile}", confContents, 'utf-8', (err) ->		

		console.log err if err

# create a redis instance and proper configuration for each element that we have in the config etc
createInstance(db, dbEnv, dbEnvObject) for own dbEnv, dbEnvObject of config.redis[db] for own db, dbObject of config.redis


