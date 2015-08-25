#global module:false

"use strict"

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-exec"

  grunt.initConfig

    copy:

      jquery:
        files: [{
          expand: true
          cwd: "bower_components/jquery/dist/"
          src: ["jquery.min.js", "jquery.min.map"]
          dest: "assets/vendor/js"
        }]

      bootstrap:
        files: [{
          expand: true
          cwd: "bower_components/bootstrap/dist/"
          src: ["css/bootstrap.min.css", "css/bootstrap.css.map", "fonts/*", "js/bootstrap.min.js"]
          dest: "assets/vendor/"
        }]

      fontawesome:
        files: [{
          expand: true
          cwd: "bower_components/components-font-awesome/"
          src: ["css/font-awesome.min.css", "fonts/*"]
          dest: "assets/vendor/"
        }]

      zeroclipboard:
        files: [{
          expand: true
          cwd: "bower_components/zeroclipboard/dist/"
          src: ["ZeroClipboard.min.js", "ZeroClipboard.min.map", "ZeroClipboard.swf"]
          dest: "assets/vendor/js"
        }]

    exec:
      jekyll:
        cmd: "jekyll build --trace"

    watch:
      options:
        livereload: true
      source:
        files: [
          "_includes/**/*"
          "_data/**/*"
          "_layouts/**/*"
          "_sass/**/*"
          "assets/**/*"
          "css/**/*"
          "js/**/*"
          "_config.yml"
          "*.html"
          "*.md"
        ]
        tasks: [
          "exec:jekyll:build"
        ]

    connect:
      server:
        options:
          port: 3000
          base: '_site'
          livereload: true

  grunt.registerTask "build", [
    "exec:jekyll:build"
    "copy"
  ]

  grunt.registerTask "serve", [
    "build"
    "connect:server"
    "watch"
  ]

  grunt.registerTask "default", [
    "exec:jekyll:serve"
  ]
