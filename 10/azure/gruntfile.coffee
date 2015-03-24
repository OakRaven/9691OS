module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    less:
      dev:
        options:
          paths: ['src/css']
        files:
          'public/css/style.css': 'src/css/style.less'

    coffee:
      compile:
        files: [
          expand: true
          cwd: 'src'
          src: '**/*.coffee'
          dest: 'target'
          ext: '.js'
        ]

    coffeelint:
      app: 'src/**/*.coffee'

    watch:
      files: ['Gruntfile.coffee', 'src/**/*.coffee', 'src/**/*.less']
      tasks: ['coffeelint', 'coffee', 'less']

  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-less'

  grunt.registerTask 'default', [ 'watch' ]