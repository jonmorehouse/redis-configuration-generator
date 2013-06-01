module.exports = (grunt) ->

	# initialize grunt configuration for cleaning the files
	grunt.initConfig 

		# remove files from inside of the build directories etc
		clean: ["./plists/*", "./confs/*"]

	# initialize npm tasks etc
	grunt.loadNpmTasks "grunt-contrib-clean"

	# register my own custom build task
	# doesn't work right now -- come back later!
	grunt.registerTask 'build', ->

		done = @async()

		require "./main"
		console.log "redis.conf and plists.conf files created"

		# safety net for now for async build -- this is a total hack -- come back later!
		setTimeout done, 5000	

	# by default, clean all files locally and then build them again for inspection!
	grunt.registerTask 'default', ['clean', 'build'] 
