package scenes {
	
	import flash.media.SoundChannel;
	import starling.events.Event;
	
	public class MenuScene extends Scene {

		public function MenuScene(game:Game) {
			super(game);
		}

		override public function init():void {
			game.currentTileMap = game.menuTileMap;
			addChild(game.menuTileMap);
			addChild(game.ball);
			themeChannel = Assets.menuSound.play(0, int.MAX_VALUE);
			game.ball.x = 500;
			game.ball.y = 500;
		}
		
		override public function update(event:Event):void {
			game.currentTileMap.update(event);
			game.ball.update(event);
			// Check if player wants to continue (pressing escape or space)
			if (game.keys[Game.KEY_ESC] || game.keys[Game.KEY_SPACEBAR]) {
				destroy();
				game.reset();
				game.removeChild(game.liveScene);
				game.addChild(game.playScene);
				game.liveScene = game.playScene;
			}
		}
		
		override public function destroy():void {
			game.menuTileMap.destroy();
			removeChild(game.ball);
			themeChannel.stop();
		}
		
		
	}
	
}
