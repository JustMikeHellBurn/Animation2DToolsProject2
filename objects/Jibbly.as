package objects {
	import citrus.objects.platformer.box2d.Hero;
	import citrus.view.starlingview.AnimationSequence;
	import citrus.core.CitrusEngine;
	import citrus.input.controllers.Keyboard;
	
	public class Jibbly extends Hero {
		
		//private var health:Number;
		private var ce:CitrusEngine;
		private var isShooting:Boolean;
		
		public function Jibbly(name:String, params:Object=null) {
			super(name, params);
			view = new AnimationSequence(Assets.jibblyAtlas, ["walk", "idle", "jump", "fall", "hurt", "shoot"], "walk", 15);
			view.onAnimationComplete.add(onAnimationOver);
			canDuck = false;
			isShooting = false;
			// Set Keyboard Actions
			ce = CitrusEngine.getInstance();
			var kb:Keyboard = ce.input.keyboard;
			kb.addKeyAction("shoot", Keyboard.Z);
			
		}
		
		override public function update(timeDelta:Number):void {
			super.update(timeDelta);

			if (getWalkingSpeed() != 0 && onGround) {
				_animation = "walk";
			}
			
			// Change animation to falling if jumping and vertical velocity is down
			if (onJump && velocity[1] > 0) {
				//_animation = "fall";
			}
			
			if (getWalkingSpeed() < 0) {
				_inverted = false;
			} else if (getWalkingSpeed() > 0) {
				_inverted = true;
			} 
			
			// Shoot Bullet
			if (ce.input.justDid("shoot")) {
				isShooting = true;
			}
			
			if (isShooting) {
				_animation = "shoot";
			}
			
		}
		
		protected function onAnimationOver(name:String):void
		{
			if (name == "shoot") isShooting = false;
		}

	}
	
}
