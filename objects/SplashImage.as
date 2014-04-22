/*
 * Author Names: 
 *  Justin Hellsten  (http://justinhellsten.com/)
 *  Michael Burnie   (http://michaelburnie.com/)
 *
 * Source File Name: SplashImage.as
 * Last Modified by: Justin Hellsten
 * Date Last Modified: April 21st, 2014
 *
 * Program Description: 
 *
 *  Handles the splash images on the Splash Screen state.
 *  
 * Revision History: See Github: https://github.com/JustMikeHellBurn/Animation2DToolsProject2
 *    
 */
 package objects {
	
	import starling.core.Starling;
	import citrus.objects.CitrusSprite;
	import citrus.core.CitrusEngine;
	
	public class SplashImage extends CitrusSprite {

		public function SplashImage() {
			super("SplashImage");

			// Load splash image to view
			view = Assets.mpAtlas.getTexture("splashimage");

			// Center splash image
			x = CitrusEngine.getInstance().stage.stageWidth / 2 - view.width / 2;
			y = CitrusEngine.getInstance().stage.stageHeight / 2 - view.height / 2;
		}

	}
	
}
