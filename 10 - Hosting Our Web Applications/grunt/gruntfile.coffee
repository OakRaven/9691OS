module.exports = (grunt) ->
  moment = require 'moment'
  versionNumber = moment().format('YYYYMMDDHHmm')

  grunt.initConfig

    copy:
      staging:
        files: [{
          expand: true
          cwd: 'src'
          src: [ 'img/**', 'js/ba-tiny-pubsub.min.js' ]
          dest: 'staging/' }
        {
          expand: true
          cwd: 'build'
          src: "js/v#{versionNumber}.min.js"
          dest: 'staging/' }
        {
          src: 'build/css/styles.min.css'
          dest: "staging/css/styles.#{versionNumber}.min.css" }]

      release:
        files: [{
          expand: true
          cwd: 'src'
          src: [ 'img/**', 'js/ba-tiny-pubsub.min.js' ]
          dest: 'release/'
          filter: 'isFile' }
        {
          expand: true
          cwd: 'build'
          src: "js/v#{versionNumber}.min.js"
          dest: 'release/'
          filter: 'isFile' }
        {
          src: 'build/css/styles.min.css'
          dest: "release/css/styles.v#{versionNumber}.min.css" }]


    clean:
      staging: ['build', 'staging']
      release: ['build', 'release']

    less:
      development:
        files: [
          concat: true
          src: [ 'src/css/*.less' ]
          dest: 'build/css/styles.css'
        ]

    cssmin:
      compile:
        src: 'build/css/styles.css'
        dest: 'build/css/styles.min.css'

    requirejs:
      compile:
        options:
          out: "build/js/v#{versionNumber}.min.js"
          baseUrl: 'src/app'
          mainConfigFile: 'src/app/main.js'
          paths:
            text: '../js/text'
            app: 'app'
            underscore: '../js/underscore'
          shim:
            underscore:
              exports: '_'
          include: [ '../js/require' ]
          insertRequire: [ 'main' ]
          name: 'main'
          removeCombined: true

    replace:
      staging:
        src: 'src/index-template.html'
        dest: 'staging/index.html'
        replacements: [
          from: '[BUILDNUMBER]'
          to: "#{versionNumber}"
        ]
      release:
        src: 'src/index-template.html'
        dest: 'release/index.html'
        replacements: [
          from: '[BUILDNUMBER]'
          to: "#{versionNumber}"
        ]

    connect:
      dev:
        options:
          keepalive: true
          hostname: 'localhost'
          port: 8080
          base: './src'
          open: true

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-text-replace'
  grunt.loadNpmTasks 'grunt-contrib-requirejs'
  grunt.loadNpmTasks 'grunt-contrib-connect'

  grunt.registerTask 'build:staging', [ 'clean:staging', 'less', \
    'cssmin', 'requirejs', 'copy:staging', 'replace:staging' ]
  grunt.registerTask 'build:release', [ 'clean:release', 'less', \
    'cssmin', 'requirejs', 'copy:release', 'replace:release' ]
  grunt.registerTask 'server', [ 'connect' ]
