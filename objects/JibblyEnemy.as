/*
 * Author Names: 
 *  Justin Hellsten  (http://justinhellsten.com/)
 *  Michael Burnie   (http://michaelburnie.com/)
 *
 * Source File Name: JibblyEnemy.as
 * Last Modified by: Justin Hellsten
 * Date Last Modified: April 21st, 2014
 *
 * Program Description: 
 *
 *  Handles the enemy objects in the play state.
 *  
 * Revision History: See Github: https://github.com/JustMikeHellBurn/Animation2DToolsProject2
 *    
 */
 package objects {
	import citrus.objects.platformer.box2d.Enemy;
	import citrus.objects.platformer.box2d.Hero;
	import Box2D.Dynamics.Contacts.b2Contact;
	import citrus.physics.box2d.IBox2DPhysicsObject;
	import citrus.physics.box2d.Box2DUtils;
	import citrus.core.CitrusEngine;
	import states.PlayState;
	import objects.Bullet;
	
	public class JibblyEnemy extends Enemy {

		public function JibblyEnemy(name:String, params:Object=null) {
			super(name, params);
			view = Assets.mpAtlas.getTexture("enemy");
		}

		//if the player kills an enemy by jumping on its head or through shooting it, kill the enemy and add to the player's score.
		override public function handleBeginContact(contact:b2Contact):void
		{
			super.handleBeginContact(contact);
			var collider:IBox2DPhysicsObject = Box2DUtils.CollisionGetOther(this,contact);
			if (collider is Hero && _hurt) {
				Assets.enemyHurtSound.play();
				(CitrusEngine.getInstance().state as PlayState).scoreCounter += 10;
			}
			
			if (collider is Bullet) {
				Assets.enemyHurtSound.play();
				(CitrusEngine.getInstance().state as PlayState).scoreCounter += 10;
				(CitrusEngine.getInstance().state).remove(collider as Bullet);
				kill = true;
			}
		}
		
	}
	
}
