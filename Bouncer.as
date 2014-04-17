
package  
{
	
	import flash.display.Sprite;
	import starling.core.Starling;
	
	[SWF(width=800, height=600, frameRate=60, backgroundColor=0x000000)]
	public class Bouncer extends Sprite {
		
		// create a class variable that is associated with Starling
		private var starling:Starling;
		
		public function Bouncer() {

			// create our Starling instance
			starling = new Starling(Game, stage);
			
			// show performance stats - during development
			starling.showStats = true;
			
			// start our game
			starling.start();
		}
	}
	
}