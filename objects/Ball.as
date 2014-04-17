package objects {
	
	import starling.core.Starling;
	import starling.display.MovieClip;
	
	public class Ball extends BaseObject {

		public static var MOVE_SPEED:int = 5;
		public static var REBOUND:int = -20;
		
		import starling.events.Event;
		
		public function Ball(game:Game) {
			super(game);
			// Load our Plane image from our Texture Atlas
			spriteClip = new MovieClip(Assets.mpAtlas.getTextures("alien"), 25);
			Starling.juggler.add(spriteClip);
			
			addChild(spriteClip);
		}

		override public function update(event:Event):void {
			// Make the ball fall
			this.dy += 0.5;
			this.dx = 0;
			this.dy = 0;
			
			// Move ball Horizontally
			if (game.keys[Game.KEY_LEFT]) {
				this.dx = -MOVE_SPEED;
				this.pivotX = 0;
				this.scaleX = 1;
			}
			if (game.keys[Game.KEY_RIGHT]) {
				this.dx = MOVE_SPEED;
				this.pivotX = this.width;
				this.scaleX = -1;
			}
			if (game.keys[Game.KEY_UP]) {
				this.dy = -MOVE_SPEED;
			}
			if (game.keys[Game.KEY_DOWN]) {
				this.dy = MOVE_SPEED;
			}
			this.y += this.dy;
			this.x += this.dx;
			
			// Check collisions with tile boundaries
			if (this.x < 0) this.x = 0;
			if (this.y < 0) this.y = 0;
			if (this.x + this.width > game.currentTileMap.width) this.x = game.currentTileMap.width - this.width;
			if (this.y + this.height > game.currentTileMap.height) { // Rebound
				this.y = game.currentTileMap.height - this.height;
				this.dy = REBOUND;
			}
		}
		
	}
	
}
