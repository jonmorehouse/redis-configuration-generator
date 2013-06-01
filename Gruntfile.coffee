module.exports = (grunt) ->

	# initialize grunt configuration for cleaning the files
	grunt.initConfig 

		# remove files from inside of the build directories etc
		clean: ["./plists/*", "./confs/*"]

		copy:
			main: 
				files: [

			      {expand:true, cwd: './plists/', src: ['*plist'], dest: '/Users/MorehouseJ09/Library/LaunchAgents/', filter: 'isFile'},
			      {expand:true, cwd: './confs/', src: ['*conf'], dest: '/usr/local/etc/', filter: 'isFile'}
			      
				]

		shell:
			start:
				command: "launchctl load -w ~/Library/LaunchAgents/*redis"
			stop:	
				command: "launchctl unload ~/Library/LaunchAgents/*redis"

	# initialize npm tasks etc
	grunt.loadNpmTasks "grunt-contrib-clean"
	grunt.loadNpmTasks "grunt-contrib-copy"
	# grunt.loadNpmTasks "grunt-shell"


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
	# grunt.registerTask 'start', ['shell:start']
	# grunt.registerTask 'stop', ['shell:stop']






