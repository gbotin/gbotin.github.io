var dest = "./assets/dist";
var src = "./assets/dev";
var serve = './_site';

module.exports = {

  serve: serve,
  port: 3000,

  watch: [
    "./**/*.{html,md,yml}",
    "./assets/dist/**/*"
  ],
  src: src,
  dest: dest,

  sourcemaps: true,
  minify: true,

  images: {
    dest: dest + "/img",
    paths: [
      src + "/img/**/*.{jpg,jpeg,png,gif}"
    ]
  },

  fonts: {
    dest: dest + "/fonts",
    paths: [
      src + "/fonts/**/*.{eot,woff,woff2,svg,ttf,otf}",
      "bower_components/font-awesome/fonts/**.{eot,woff,woff2,svg,ttf}"
    ]
  },

  styles: {
    dest: dest + "/css",
    paths: [
      src + "/styles/**/*"
    ],
    entrypoints: [
      src + "/styles/main.sass"
    ],
    includePaths: [
      "bower_components/bootstrap-sass/assets/stylesheets",
      "bower_components/font-awesome/scss"
    ]
  },

  scripts: {
    dest: dest + "/js",
    paths: [
      src + "/scripts/**/*"
    ],
    entrypoint: src + "/scripts/application.es6",
    output: "bundle.js",
    includePaths: [
      "bower_components/jquery/dist",
      "bower_components/zeroclipboard/dist",
      "bower_components/bootstrap-sass/assets/javascripts"
    ]
  }

};
