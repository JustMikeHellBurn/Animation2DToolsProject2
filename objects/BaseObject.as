package objects {

	import starling.display.Sprite;
	import starling.events.Event;
	
	public class BaseObject extends Sprite {

		protected var game:Game;
		
		public function BaseObject(game:Game) {
			this.game = game;
		}

		// Abstract Init Method
		protected function init(event:Event):void { }
		
		// Abstract Update Method
		public function update(event:Event):void { }
		
	}
	
}
