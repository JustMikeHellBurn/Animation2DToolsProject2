package scenes {
	
	import flash.media.SoundChannel;
	import starling.events.Event;
	
	public class InstructionScene extends Scene {

		public function InstructionScene(game:Game) {
			super(game);
		}

		override public function init():void {
			game.currentTileMap = game.instructionTileMap;
			addChild(game.instructionTileMap);
			addChild(game.ball);
			themeChannel = Assets.instructionSound.play(0, int.MAX_VALUE);
			game.ball.x = 100;
			game.ball.y = 600;
		}
		
		override public function update(event:Event):void {
			game.currentTileMap.update(event);
			game.ball.update(event);
			// Check if player wants to continue (pressing escape or space)
			if (game.keys[Game.KEY_ESC] || game.keys[Game.KEY_SPACEBAR]) {
				destroy();
				game.reset();
				game.removeChild(game.liveScene);
				game.addChild(game.menuScene);
				game.liveScene = game.menuScene;
			}
		}
		
		override public function destroy():void {
			game.instructionTileMap.destroy();
			removeChild(game.ball);
			themeChannel.stop();
		}
		
	}
	
}
