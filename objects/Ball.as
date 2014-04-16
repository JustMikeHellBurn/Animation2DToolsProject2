package objects {
	
	public class Ball extends BaseObject {

		import starling.events.Event;
		
		public function Ball(game:Game) {
			super(game);
			//this.spriteClip = 
		}

		override public function update(event:Event):void {
			// Make the ball fall
			this.dy += 1;
			this.y += this.dy;
		}
		
	}
	
}
