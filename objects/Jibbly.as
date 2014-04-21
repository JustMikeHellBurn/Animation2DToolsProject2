package objects {
	import citrus.objects.platformer.box2d.Hero;
	import citrus.view.starlingview.AnimationSequence;
	import citrus.core.CitrusEngine;
	import citrus.input.controllers.Keyboard;
	import citrus.objects.CitrusSprite;
	import states.PlayState;
	import states.BaseState;
	
	
	public class Jibbly extends Hero {
		
		public var health:Number;
		public var lives:int;
		private var ce:CitrusEngine;
		private var isShooting:Boolean;
		private var isTelporting:Boolean;
		
		private var startX:Number;
		private var startY:Number;
		
		public function Jibbly(name:String, params:Object=null) {
			super(name, params);
			startX = x;
			startY = y;
			health = 3;
			lives = 3;
			view = new AnimationSequence(Assets.jibblyAtlas, ["walk", "idle", "jump", "fall", "hurt", "shoot", "telein", "teleout"], "walk", 15);
			view.onAnimationComplete.add(onAnimationOver);
			canDuck = false;
			isShooting = false;
			// Set Keyboard Actions
			ce = CitrusEngine.getInstance();
			var kb:Keyboard = ce.input.keyboard;
			kb.addKeyAction("shoot", Keyboard.Z);
			kb.addKeyAction("tele", Keyboard.T);
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
				CitrusEngine.getInstance().state.add(new Bullet("bullet", {x:this.x, y:this.y, speed:4}));
			} 

			if (isShooting) {
				_animation = "shoot";
			}

			
			// Check if jibbly has fallen to his death (this is a hack because we are assuming all maps are the same height)
			if (y + height > 1500) {
				reset();
			}
			
			// Check if going through portals
			var portal:Portal = CitrusEngine.getInstance().state.getObjectByName("portal") as Portal;
			var playPortal:PlayPortal = CitrusEngine.getInstance().state.getObjectByName("playPortal") as PlayPortal;
			var exitPortal:ExitPortal = CitrusEngine.getInstance().state.getObjectByName("exitPortal") as ExitPortal;
			
			// Not efficient, but I'm really bloody tired right now...so I don't care.
			if (portal != null && x + width > portal.x && y + height > portal.y && x < portal.x + portal.width && y < portal.y + portal.height && ce.input.justDid("tele")) {
				isTelporting = true;
				_controlsEnabled = false;
			}
			if (playPortal != null && x + width > playPortal.x && y + height > playPortal.y && x < playPortal.x + playPortal.width && y < playPortal.y + playPortal.height && ce.input.justDid("tele")) {
				isTelporting = true;
				_controlsEnabled = false;
				(CitrusEngine.getInstance().state as BaseState).nextState = new PlayState();
			}
			if (exitPortal != null && x + width > exitPortal.x && y + height > exitPortal.y && x < exitPortal.x + exitPortal.width && y < exitPortal.y + exitPortal.height && ce.input.justDid("tele")) {
				isTelporting = true;
				_controlsEnabled = false;
				(CitrusEngine.getInstance().state as BaseState).nextState = null;
			}
			
			if (isTelporting) {
				_animation = "teleout";
			}
			
		}
		
		public function reset():void {
			// Game over!
			if (lives == 0) CitrusEngine.getInstance().state.destroy();
			x = startX;
			y = startY;
			health = 3;
			lives -= 1;
		}
		
		protected function onAnimationOver(name:String):void
		{
			if (name == "hurt") health -= 1;
			if (health == 0) reset();
			if (name == "shoot") isShooting = false;
			if (name == "teleout") { 
				isTelporting = false;
				_controlsEnabled = true;
				CitrusEngine.getInstance().state.destroy();
			}
		}
		
	}
	
}
