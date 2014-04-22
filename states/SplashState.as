/*
 * Author Names: 
 *		Justin Hellsten 	(http://justinhellsten.com/)
 *		Michael Burnie 		(http://michaelburnie.com/)
 *
 * Source File Name: SplashState.as
 * Last Modified by: Justin Hellsten
 * Date Last Modified: April 21st, 2014
 *
 * Program Description: 
 *
 *		Splash state, which shows the splash image for 5 seconds, then continues into the instruction state.
 *		
 * Revision	History: See Github: https://github.com/JustMikeHellBurn/Animation2DToolsProject2
 *				
 */
package states {

	// Import starling animation delay call (used to delay splash state for 5 seconds. 
	// Also includes starling and citrus engine.
	import starling.animation.DelayedCall;
	import starling.core.Starling;
	import citrus.core.CitrusEngine;
	
	// Imports splash image object
	import objects.SplashImage;
	
	// Imports media utilities, to channel splash theme, and lower volume
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	/*
	 * SplashState -> BaseState
	 *     
	 *		Splash state shows the splash image, and executes the instruction state after 5 seconds.
	 */
	public class SplashState extends BaseState {
		
		// Splash Delay Constant (5 seconds)
		public static var SPLASH_DELAY:Number = 5.0;
		
		// Splash State handling variables/objects
		private var themeChannel:SoundChannel;
		private var delayedCall:DelayedCall;
		private var splashImage:SplashImage;
		
		// SplashState() - Constructor for the class.
		//
		public function SplashState() {
			super();
		}

		// initialize() - Initialize splash state, so it sets up the splash image and delay callback.
		//					It also sets the next state to be the instruction state.
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
		
		// destroy() - Destroys the splash state, and stops the music theme.
		//
		override public function destroy():void {
			super.destroy();
			themeChannel.stop();
		}
		
		// splashDelay() - This fires after SPLASH DELAY duration. Calls the destroy method to start the next state. 
		//
		private function splashDelay():void {
			destroy();
		}
		
	}
	
}
