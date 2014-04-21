package objects {
	import citrus.objects.platformer.box2d.Hero;
	import citrus.view.starlingview.AnimationSequence;

	public class Jibbly extends Hero {
		
		public function Jibbly(name:String, params:Object=null) {
			super(name, params);
			view = new AnimationSequence(Assets.jibblyAtlas, ["walk", "idle", "jump", "fall"], "walk", 15);
			this.canDuck = false;
		}
		
		override public function update(timeDelta:Number):void {
			super.update(timeDelta);
			
			if (getWalkingSpeed() != 0 && !onJump) {
				_animation = "walk";
			}
			
			// Change animation to falling if jumping and vertical velocity is down
			if (onJump && velocity[1] > 0) {
				_animation = "fall";
			}
			
			if (getWalkingSpeed() < 0) {
				_inverted = false;
			} else if (getWalkingSpeed() > 0) {
				_inverted = true;
			} 
			
			trace("updating");
		}

	}
	
}
