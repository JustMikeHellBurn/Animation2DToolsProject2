package scenes {
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.core.Starling;
	import starling.animation.DelayedCall;
	
	public class SplashScene extends Scene {
		private var delayedCall:DelayedCall;
		
		public function SplashScene(game:Game) {
			super(game);
		}

		override public function init():void {
			addChild(game.splashImage);
			delayedCall = new DelayedCall(splashDelay, 3.0);
			delayedCall.repeatCount = 1;
			Starling.juggler.add(delayedCall);
		}
		
		override public function destroy():void {
			removeChild(game.splashImage);
		}
		
		private function splashDelay():void {
			destroy();
			game.removeChild(game.liveScene);
			game.liveScene = game.instructionScene;
			game.addChild(game.liveScene);
			trace("executing");
		}
		
	}
	
}
