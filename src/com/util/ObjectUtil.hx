package com.util;

import hex.error.IllegalArgumentException;
import hex.ioc.assembler.ApplicationContext;
import hex.ioc.core.ICoreFactory;

/**
 * ...
 * @author duke
 */
class ObjectUtil
{
	static public function fastEvalFromTarget( target : Dynamic, toEval : String, coreFactory : ICoreFactory ) : Dynamic
	{
		var members : Array<String> = toEval.split( "." );
		var result 	: Dynamic;
		var arrMatcher = ~/([a-zA-Z0-9_-]+)\[ *([0-9]+) *\]/;
		while ( members.length > 0 )
		{
			var member : String = members.shift();
			result = Reflect.field( target, member );
			
			if ( result == null )
			{
				if ( Std.is( target, ApplicationContext ) && coreFactory.isRegisteredWithKey( member ) )
				{
					result = coreFactory.locate( member );
				}
				#if js
				else if ( Std.is( target, js.html.Element ) )
				{
					result = cast( target, js.html.Element).getElementsByClassName(member)[0];
				}
				else if ( Std.is( target, riot.externs.Tag ) )
				{
					if ( arrMatcher.match( member ) )
					{
						result = Reflect.field(target, arrMatcher.matched(0))[cast(arrMatcher.matched(1), Int)];
					}
					else 
					{
						result = Reflect.field(target.tags, member);
					}
					
					if ( members.length == 0 && Std.is(result, Array) )
					{
						throw new IllegalArgumentException( "ObjectUtil.fastEvalFromTarget failed. Define concrete element for the following: '" + member + "', multiple has been found." );
					}
					
				}
				#end
				else
				{
					throw new IllegalArgumentException( "ObjectUtil.fastEvalFromTarget(" + target + ", " + toEval + ", " + coreFactory + ") failed." );
				}
			}
			target = result;
		}
		
		#if js
		if ( Std.is( target, riot.externs.Tag ) )
		{
			target = target.getInstance();
		}
		#end
		
		return target;
	}
	
}