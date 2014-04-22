/*
 * Author Names: 
 *  Justin Hellsten  (http://justinhellsten.com/)
 *  Michael Burnie   (http://michaelburnie.com/)
 *
 * Source File Name: Bullet.as
 * Last Modified by: Justin Hellsten
 * Date Last Modified: April 21st, 2014
 *
 * Program Description: 
 *
 *  Handles the bullet objects shot by the player.
 *  
 * Revision History: See Github: https://github.com/JustMikeHellBurn/Animation2DToolsProject2
 *    
 */
 package objects {
	import citrus.core.CitrusEngine;
	import citrus.objects.platformer.box2d.Missile;
	import Box2D.Common.Math.b2Vec2;
	
	public class Bullet extends Missile {

		public function Bullet(name:String, params:Object=null) {
			super(name, params);
			
			// Load splash image to view
			view = Assets.mpAtlas.getTexture("bullet");
			_velocity = new b2Vec2(this.speed, 0);
		}

		override public function update(timeDelta:Number):void {
			super.update(timeDelta);
			this.x += _velocity.x;
		}
	}
	
}
