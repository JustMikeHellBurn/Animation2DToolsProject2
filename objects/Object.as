package objects {

	import starling.display.Sprite;
	import starling.events.Event;
	
	public class BaseObject extends Sprite {

		protected var game:Game;
		
		public function BaseObject(game:Game) {
			this.game = game;
			addEventListener(Event.ENTER_FRAME, update);
		}

		// Abstract Update Method
		public function update(event:Event):void { }
		
	}
	
}
