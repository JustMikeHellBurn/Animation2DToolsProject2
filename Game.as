/* Author: Tom Tsiliopoulos
Mail Pilot version 8
*/
package 
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	import objects.TileMap;
	
	public class Game extends Sprite
	{

		public function Game()
		{

			var tileMap:TileMap = new TileMap("assets/maps/test.tmx");
			addChild(tileMap);
			
			// initialize the game by adding objects to the stage
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(event:Event):void
		{
			



		}

	}

}