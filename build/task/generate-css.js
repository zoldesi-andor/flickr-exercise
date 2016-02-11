var gulp = require('gulp');
var path = require('path');
var autoprefixer = require('gulp-autoprefixer');

var cssFile = path.join(__dirname, '../../resource/css/main.css');

module.exports = function () {
	
	return gulp.src(cssFile)
	.pipe(autoprefixer({
		browsers: ['> 1%', 'last 3 versions']
	}))
	.pipe(gulp.dest(path.join(__dirname, '../../bin/css')));
};