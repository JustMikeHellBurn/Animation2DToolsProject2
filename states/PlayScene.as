package scenes {
	
	import flash.media.SoundChannel;
	import starling.events.Event;
	
	public class PlayScene extends Scene {

		public function PlayScene(game:Game) {
			super(game);
		}

		override public function init():void {
			game.currentTileMap = game.playTileMap;
			addChild(game.playTileMap);
			addChild(game.ball);
			themeChannel = Assets.playSound.play(0, int.MAX_VALUE);			
			game.ball.x = 300;
			game.ball.y = 300;
		}
		
		override public function update(event:Event):void {
			game.currentTileMap.update(event);
			game.ball.update(event);
			// Check if player wants to continue (pressing escape or space)
			if (game.keys[Game.KEY_ESC] || game.keys[Game.KEY_SPACEBAR]) {
				
			}
		}
		
		override public function destroy():void {
			game.playTileMap.destroy();
			removeChild(game.ball);
			themeChannel.stop();
		}
		
		
	}
	
}
