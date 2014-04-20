package states  {
	
	import objects.BaseObject;
	import flash.media.SoundChannel;
	import starling.events.Event;
	
	public class BaseState extends BaseObject {
		protected var themeChannel:SoundChannel;
		
		public function Scene(game:Game) {
			super(game);
			// initialize the game by adding objects to the stage
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

		override public function init():void { }
		public function destroy():void { }

		override public function update(event:Event):void { }
		

		
	}
	
}
