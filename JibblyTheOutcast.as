package  
{
	import citrus.core.starling.StarlingCitrusEngine;
	import starling.core.Starling;
	
	import flash.events.Event;
	
	import states.SplashState;
	
	[SWF(width=800, height=600, frameRate=60, backgroundColor=0x000000)]
	public class JibblyTheOutcast extends StarlingCitrusEngine {

		public function JibblyTheOutcast() {
			super();
		}
		
		override public function initialize():void {
			setUpStarling(true);
		}
		
		override public function handleStarlingReady():void {
			// Initialize Assets (gfx, sfx, etc)
			Assets.init();
			state = new SplashState();
		}
		
	}
}