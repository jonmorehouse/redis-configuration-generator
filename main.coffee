# include my custom helpers
# do require "helpers"

# initialize filesystem
fs = require "fs"
plist = require "plist"

# set up configuration for redis instances
config = require "./data/config"
# set up defaults for elements
defaults = require "./data/defaults"
# initialize proper plist etc 
defaults.plist = plist.parseFileSync defaults.defaultPlist

# create the proper plist for each element
createPlist = (name, file) ->

	# set up our current plist with the proper elements
	# current = defaults.plist.clone()
	# current.ProgramArguments[1] = file
	# current.Label = name

	# console.log plist.build({name: "Jon"}).toString()


# create a redis instance via setting up our configuration 
createInstance = (db, env, object) ->

	# initialize proper variables for the application setup
	instanceName = "#{db}.#{env}"
	confFile = "redis.#{db}.#{env}.conf"

	# lets create a clone element here so that we can clone different objects
	currentConf = 
		include: "#{defaults.confsDir}/redis-common.conf"
		pidfile: "/usr/local/var/run/redis-#{instanceName}.pid"
		# unixsocket: "/tmp/redis-#{instanceName}.sock"
		port: object.port
		bind: object.bind
		dbfilename: "dump-#{instanceName}.rbd"
		"vm-swap-file": "/tmp/redis-#{instanceName}.swap"

	# create our conf contents properly to save the file
	confContents = ""
	confContents += "#{key} #{_object}\n" for own key, _object of currentConf

	return createPlist instanceName, "#{defaults.confsDir}/#{confFile}"

	# write the file to the proper directory
	fs.writeFile "confs/#{confFile}", confContents, 'utf-8', (err) ->		

		if err

			console.log err

		else

			console.log "#{instanceName} = #{object.bind}:#{object.port}"

	# now we need to create		
			

# create a redis instance and proper configuration for each element that we have in the config etc
createInstance(db, dbEnv, dbEnvObject) for own dbEnv, dbEnvObject of config.redis[db] for own db, dbObject of config.redis

# module.exports = ->

