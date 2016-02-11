var gulp = require('gulp');
var path = require('path');

var indexHtmlFile = path.join(__dirname, '../../resource/index.html');

module.exports = function() {
  return gulp
    .src(indexHtmlFile)
    .pipe(gulp.dest(path.join(__dirname, '../../bin')));
}