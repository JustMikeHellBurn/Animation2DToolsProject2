package states  {

	import starling.events.Event;
	import citrus.core.starling.StarlingState;
	import citrus.core.CitrusEngine;
	
	import flash.system.fscommand;
	
	public class BaseState extends StarlingState  {

		public var nextState:BaseState;
		
		public function BaseState() {
			super();
			nextState = null;
		}
		
		override public function destroy():void {
			if (nextState != null) {
				CitrusEngine.getInstance().state = nextState;
			} else {
				fscommand("quit");
			}
		}

	}
	
}
