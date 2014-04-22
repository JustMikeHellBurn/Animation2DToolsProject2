/*
 * Author Names: 
 *  Justin Hellsten  (http://justinhellsten.com/)
 *  Michael Burnie   (http://michaelburnie.com/)
 *
 * Source File Name: InstructionState.as
 * Last Modified by: Justin Hellsten
 * Date Last Modified: April 21st, 2014
 *
 * Program Description: 
 *
 *  Handles the portal objects in the game, which are primarily used in the menus but also in the play state.
 *  
 * Revision History: See Github: https://github.com/JustMikeHellBurn/Animation2DToolsProject2
 *    
 */
 package objects {
	import citrus.objects.CitrusSprite;
	import citrus.view.starlingview.AnimationSequence;
	
	public class Portal extends CitrusSprite {

		public function Portal(name:String, params:Object=null) {
			super(name, params);
			view = new AnimationSequence(Assets.mpAtlas, ["portal"], "portal", 10);
			updateCallEnabled = true;
			x -= view.width / 2;
			y -= view.height / 2;
		}

		override public function update(timeDelta:Number):void {
			super.update(timeDelta);
			_animation = "portal"
		}
		
	}
	
}
