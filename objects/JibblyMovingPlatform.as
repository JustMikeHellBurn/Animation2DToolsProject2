/*
 * Author Names: 
 *  Justin Hellsten  (http://justinhellsten.com/)
 *  Michael Burnie   (http://michaelburnie.com/)
 *
 * Source File Name: JibblyMovingPlatform.as
 * Last Modified by: Justin Hellsten
 * Date Last Modified: April 21st, 2014
 *
 * Program Description: 
 *
 *  Handles the moving platforms that appear in the play state.
 *  
 * Revision History: See Github: https://github.com/JustMikeHellBurn/Animation2DToolsProject2
 *    
 */
 package objects {
	import citrus.objects.platformer.box2d.MovingPlatform;
	
	public class JibblyMovingPlatform extends MovingPlatform {

		public function JibblyMovingPlatform(name:String, params:Object=null) {
			super(name, params);
			view = Assets.mpAtlas.getTexture("movingplatform");
		}

	}
	
}
