config = require "./data/config"
defaults = require "./data/defaults"
do require "helpers"

createConf = (db, env, object) ->

	# create a file here and set up the proper information etc
	# lets create a clone element here so that we can clone different objects
	current = defaults.conf.clone().extend object
	console.log current


do createConfs = ->

	createConf(db, dbEnv, dbEnvObject) for dbEnv, dbEnvObject of config.redis[db] for db, dbObject of config.redis





