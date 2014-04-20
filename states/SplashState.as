package states {

	import starling.animation.DelayedCall;
	import starling.core.Starling;
	import objects.SplashImage;
	import flash.media.SoundTransform;
	
	public class SplashState extends BaseState {
		public static var SPLASH_DELAY:Number = 3.0;
		
		private var delayedCall:DelayedCall;
		private var splashImage:SplashImage;
		
		public function SplashState() {
			super();
		}

		override public function initialize():void {
    		super.initialize();
			splashImage = new SplashImage();
			add(splashImage);
			delayedCall = new DelayedCall(splashDelay, SplashState.SPLASH_DELAY);
			delayedCall.repeatCount = 1;
			Starling.juggler.add(delayedCall);
			Assets.splashSound.play(0, 1, new SoundTransform(0.25));
		}
		
		override public function destroy():void {
			super.destroy();
		}
		
		private function splashDelay():void {
			destroy();
		}
		
	}
	
}
