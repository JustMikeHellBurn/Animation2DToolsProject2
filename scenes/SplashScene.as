package scenes {
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.core.Starling;
	import starling.animation.DelayedCall;
	
	public class SplashScene extends Scene {
		public static var SPLASH_DELAY:Number = 1.0;
		
		private var delayedCall:DelayedCall;
		
		public function SplashScene(game:Game) {
			super(game);
		}

		override public function init():void {
			addChild(game.splashImage);
			delayedCall = new DelayedCall(splashDelay, SplashScene.SPLASH_DELAY);
			delayedCall.repeatCount = 1;
			Starling.juggler.add(delayedCall);
		}
		
		override public function destroy():void {
			removeChild(game.splashImage);
		}
		
		private function splashDelay():void {
			destroy();
			game.removeChild(game.liveScene);
			game.addChild(game.instructionScene);
			game.liveScene = game.instructionScene;
			
		}
		
	}
	
}
