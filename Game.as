/* Author: Tom Tsiliopoulos
Mail Pilot version 8
*/
package 
{
	import starling.display.Sprite;
	import starling.events.Event;
	import extensions.*;
	
	public class Game extends Sprite
	{
		var TMX:TMXTileMap;
		
		public function Game()
		{
			// Load the image and other media assets for the game
			//Assets.init();

			// initialize the game by adding objects to the stage
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(event:Event):void
		{
			
			trace("SDF");
			TMX = new TMXTileMap();
			TMX.addEventListener(Event.COMPLETE, drawLayers);
			 
			TMX.load("test.tmx");
			 


		}

		public function changeState(state:int):void
		{

		}

		private function drawLayers(event:Event):void
		{
			
		   for(var i:int = 0; i < TMX.layers().length; i++)
		   {
			addChild(TMX.layers()[i].getHolder());
		   }

		}
	
	}

}