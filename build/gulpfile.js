var gulp = require('gulp');

/*var generateCss = require('./task/generate-css');
var concatJs = require('./task/concat-js');


gulp.task('generate-css', generateCss);
gulp.task('concat-js', concatJs);*/

var taskNameList = ["generate-css", "concat-js", "copy"];



function defineTask( taskNameList )
{
	var l = taskNameList.length;
	for (var i = 0; i < l; i++)
	{
		var task = require('./task/' + taskNameList[i]);
		gulp.task(taskNameList[i], task);
	}
}

defineTask( taskNameList );

gulp.task('default', taskNameList);
