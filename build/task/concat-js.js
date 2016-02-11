var gulp = require('gulp');
var path = require('path');
var concat = require('gulp-concat');

var classlistPolyfillFile = path.join(__dirname, '../../node_modules/classlist-polyfill/src/index.js');
var hlsJsFile = path.join(__dirname, '../../node_modules/hls.js/dist/hls.js');

module.exports = function() {
  return gulp.src([classlistPolyfillFile, hlsJsFile])
    .pipe(concat('resource.js'))
    .pipe(gulp.dest(path.join(__dirname, '../../bin/js')));
};