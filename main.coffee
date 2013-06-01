config = require "./data/config"
defaults = require "./data/defaults"


createConf = (db, env, object) ->

	# create a file here and set up the proper information etc
	



do createConfs = ->

	createConf(db, dbEnv, dbEnvObject) for dbEnv, dbEnvObject of config.redis[db] for db, dbObject of config.redis




