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
          dest: "vendor/js"
        }]

      bootstrap:
        files: [{
          expand: true
          cwd: "bower_components/bootstrap/dist/"
          src: ["css/bootstrap.min.css", "css/bootstrap.css.map", "fonts/*", "js/bootstrap.min.js"]
          dest: "vendor/"
        }]

      fontawesome:
        files: [{
          expand: true
          cwd: "bower_components/components-font-awesome/"
          src: ["css/font-awesome.min.css", "fonts/*"]
          dest: "vendor/"
        }]

    exec:
      jekyll:
        cmd: "jekyll build --trace"

    watch:
      options:
        livereload: true
      source:
        files: [
          "_drafts/**/*"
          "_includes/**/*"
          "_layouts/**/*"
          "_posts/**/*"
          "_sass/**/*"
          "css/**/*"
          "js/**/*"
          "_config.yml"
          "*.html"
          "*.md"
        ]
        tasks: [
          "exec:jekyll"
        ]

    connect:
      server:
        options:
          port: 3000
          base: '_site'
          livereload: true

  grunt.registerTask "build", [
    "copy"
  ]

  grunt.registerTask "serve", [
    "build"
    "exec:jekyll:serve"
    "connect:server"
    "watch"
  ]

  grunt.registerTask "default", [
    "exec:jekyll:serve"
  ]
