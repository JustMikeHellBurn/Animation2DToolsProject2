package scenes {
	
	import flash.media.SoundChannel;
	import starling.events.Event;
	
	public class InstructionScene extends Scene {
		private var themeChannel:SoundChannel;
		
		public function InstructionScene(game:Game) {
			super(game);
		}

		override public function init():void {
			addChild(game.tileMap);
			addChild(game.ball);
			themeChannel = Assets.theme.play();
		}
		
		override public function update(event:Event):void {
			game.tileMap.update(event);
			game.ball.update(event);
		}
		
		override public function destroy():void {
			removeChild(game.tileMap);
			removeChild(game.ball);
			themeChannel.stop();
		}
		
	}
	
}
