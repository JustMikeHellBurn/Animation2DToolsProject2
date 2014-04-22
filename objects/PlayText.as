/*
 * Author Names: 
 *  Justin Hellsten  (http://justinhellsten.com/)
 *  Michael Burnie   (http://michaelburnie.com/)
 *
 * Source File Name: PlayText.as
 * Last Modified by: Justin Hellsten
 * Date Last Modified: April 21st, 2014
 *
 * Program Description: 
 *
 *  Handles the text in the play state, such as the health, score, and lives.
 *  
 * Revision History: See Github: https://github.com/JustMikeHellBurn/Animation2DToolsProject2
 *    
 */
 package objects {
	import citrus.objects.CitrusSprite;
	
	public class PlayText extends CitrusSprite {

		public function PlayText(name:String, params:Object=null) {
			super(name, params);
			view = Assets.mpAtlas.getTexture("playtext");
			x -= view.width / 2;
			y -= view.height / 2;
		}

	}
	
}
