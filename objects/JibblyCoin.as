/*
 * Author Names: 
 *  Justin Hellsten  (http://justinhellsten.com/)
 *  Michael Burnie   (http://michaelburnie.com/)
 *
 * Source File Name: JibblyCoin.as
 * Last Modified by: Justin Hellsten
 * Date Last Modified: April 21st, 2014
 *
 * Program Description: 
 *
 *  Handles the coin objects in the play state, which add to the player's score.
 *  
 * Revision History: See Github: https://github.com/JustMikeHellBurn/Animation2DToolsProject2
 *    
 */
 package objects  {
	import citrus.objects.platformer.box2d.Coin;
	import Box2D.Dynamics.Contacts.b2Contact;
	import states.PlayState;
	import citrus.core.CitrusEngine;
	
	public class JibblyCoin extends Coin {

		public function JibblyCoin(name:String, params:Object=null) {
			super(name, params);
			view = Assets.mpAtlas.getTexture("coin");
		}

		//if the player comes in contact with a coin, add to the player's score.
		override public function handleBeginContact(contact:b2Contact):void
		{
			super.handleBeginContact(contact);
			Assets.coinSound.play();
			(CitrusEngine.getInstance().state as PlayState).scoreCounter += 20;
		}
		
	}
	
}
