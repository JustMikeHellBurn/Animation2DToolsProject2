package  
{
	import citrus.core.starling.StarlingCitrusEngine;
	import citrus.core.State;
	
	[SWF(width=800, height=600, frameRate=60, backgroundColor=0x000000)]
	public class JibblyTheOutcast extends StarlingCitrusEngine {

		public function JibblyTheOutcast() {
		}
		
		override public function initialize():void {
        	setUpStarling(true);
			
    	}
		override public function handleStarlingReady():void {
			state = new Game();
		}
	}
}