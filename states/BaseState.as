/*
 * Author Names: 
 *		Justin Hellsten 	(http://justinhellsten.com/)
 *		Michael Burnie 		(http://michaelburnie.com/)
 *
 * Source File Name: BaseState.as
 * Last Modified by: Justin Hellsten
 * Date Last Modified: April 21st, 2014
 *
 * Program Description: 
 *
 *		Base state for all states. Used to extend common attributes among all states.
 *		
 * Revision	History: See Github: https://github.com/JustMikeHellBurn/Animation2DToolsProject2
 *				
 */
package states  {

	// Import starling state, and citrus engine
	import starling.events.Event;
	import citrus.core.starling.StarlingState;
	import citrus.core.CitrusEngine;
	
	/*
	 * BaseState -> StarlingState
	 *     
	 *		Base class for all states. Use to extend common attributes among all states
	 */
	public class BaseState extends StarlingState  {

		// Next state is the next state to go to once the state is destroyed
		public var nextState:BaseState;
		
		// BaseState() - Constructor for the class. This really only sets the next state to null.
		//
		public function BaseState() {
			super();
			nextState = null;
		}
		
		// destroy() - Destroys the state, if the next state is null nothing will happen, the next state 
		//				must be set in order transition into the next state
		//
		override public function destroy():void {
			if (nextState != null) {
				CitrusEngine.getInstance().state = nextState;
			} 
		}

	}
	
}
