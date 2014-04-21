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
