package states {

	import starling.animation.DelayedCall;
	import starling.core.Starling;
	import citrus.core.CitrusEngine;
	
	import objects.SplashImage;
	
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	public class SplashState extends BaseState {
		public static var SPLASH_DELAY:Number = 1.0;
		
		private var themeChannel:SoundChannel;
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
			themeChannel = Assets.splashSound.play(0, 1, new SoundTransform(0.25));
			
			this.nextState = new InstructionState();
			
		}
		
		override public function destroy():void {
			super.destroy();
			// Stop Splash Theme
			themeChannel.stop();
		}
		
		private function splashDelay():void {
			destroy();
		}
		
	}
	
}
