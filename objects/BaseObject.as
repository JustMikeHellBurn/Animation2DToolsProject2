package objects {

	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.MovieClip;
	import starling.core.Starling;
	import flash.display.Stage;
	
	public class BaseObject extends Sprite {

		protected var spriteClip:MovieClip;
		protected var nativeStage:Stage;
		
		protected var game:Game;
		public var dx:Number, dy:Number;
		
		public function BaseObject(game:Game) {
			// Establish a reference to the native stage
			nativeStage = Starling.current.nativeStage;
			
			this.game = game;
			this.spriteClip = null;
			this.dx = 0;
			this.dy = 0;
			
		}

		// Abstract Init Method
		public function init():void { }
		
		// Abstract Update Method
		public function update(event:Event):void { }
		
	}
	
}
