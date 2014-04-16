package scenes  {
	
	import objects.BaseObject;
	
	import starling.events.Event;
	
	public class Scene extends BaseObject {

		public function Scene(game:Game) {
			super(game);
		}
		
		override public function update(event:Event):void {
			trace(this.game.keys);
		}
		

		
	}
	
}
