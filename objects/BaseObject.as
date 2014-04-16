package objects {

	import starling.display.Sprite;
	import starling.events.Event;
	import flash.display.MovieClip;
	
	public class BaseObject extends Sprite {

		protected var spriteClip:MovieClip;
		
		protected var game:Game;
		protected var dx, dy:Number;
		
		public function BaseObject(game:Game) {
			this.game = game;
			this.spriteClip = null;
		}

		// Abstract Init Method
		protected function init(event:Event):void { }
		
		// Abstract Update Method
		public function update(event:Event):void { }
		
	}
	
}
