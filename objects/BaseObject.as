package objects {

	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.MovieClip;
	
	public class BaseObject extends Sprite {

		protected var spriteClip:MovieClip;
		
		protected var game:Game;
		public var dx:Number, dy:Number;
		
		public function BaseObject(game:Game) {
			this.game = game;
			this.spriteClip = null;
			this.dx = 0;
			this.dy = 0;
		}

		// Abstract Init Method
		protected function init(event:Event):void { }
		
		// Abstract Update Method
		public function update(event:Event):void { }
		
	}
	
}
