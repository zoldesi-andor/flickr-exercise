var gulp = require('gulp');

var generateCss = require('./task/generate-css');
var concatJs = require('./task/concat-js');


gulp.task('generate-css', generateCss);
gulp.task('concat-js', concatJs);

gulp.task('default', ["generate-css", "concat-js"]);