package example.module.hello.view;

import hex.view.IView;

/**
 * @author ali_o_kan - Laurent Deketelaere
 */

interface IHelloView extends IView
{
	function showMessage( message : String ) : Void;
}