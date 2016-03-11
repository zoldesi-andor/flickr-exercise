var path = require('path');
var fs = require('fs');
var exec = require('child_process').exec;

fs.exists(path.join(__dirname, "../tools/hex3rdPartyTools"), function( exists )
{
	if ( exists )
	{
		console.log("pull hex3rdPartyTools");
		exec("git pull tools/hex3rdPartyTools");
	}
	else
	{
		console.log("clone hex3rdPartyTools");
		exec("git clone https://github.com/DoclerLabs/hex3rdPartyTools.git tools/hex3rdPartyTools") ;
	}
}
)



