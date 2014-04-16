/* Author: Tom Tsiliopoulos
Mail Pilot version 8
*/
package 
{
	import starling.display.Sprite;
	import starling.events.Event;

	public class Game extends Sprite
	{
		
		public function Game()
		{
			// Load the image and other media assets for the game
			//Assets.init();

			// initialize the game by adding objects to the stage
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(event:Event):void
		{


		}

		public function changeState(state:int):void
		{

		}

	}

}