/*
 * Author Names: 
 *  Justin Hellsten  (http://justinhellsten.com/)
 *  Michael Burnie   (http://michaelburnie.com/)
 *
 * Source File Name: ExitText.as
 * Last Modified by: Justin Hellsten
 * Date Last Modified: April 21st, 2014
 *
 * Program Description: 
 *
 *  Handles the Exit text on the start screen.
 *  
 * Revision History: See Github: https://github.com/JustMikeHellBurn/Animation2DToolsProject2
 *    
 */
 package objects {
	import citrus.objects.CitrusSprite;
	
	public class ExitText extends CitrusSprite {

		public function ExitText(name:String, params:Object=null) {
			super(name, params);
			view = Assets.mpAtlas.getTexture("exittext");
			x -= view.width / 2;
			y -= view.height / 2;
		}

	}
	
}
