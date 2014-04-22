/*
 * Author Names: 
 *		Justin Hellsten 	(http://justinhellsten.com/)
 *		Michael Burnie 		(http://michaelburnie.com/)
 *
 * Source File Name: JibblyTheOutcast.as
 * Last Modified by: Justin Hellsten
 * Date Last Modified: April 21st, 2014
 *
 * Program Description: 
 *
 *		This is the main class which the .fla for this project is linked to. This class instantiates the starling + citrus engine,
 *		initializes the game assets, and starts the splash state.
 *		
 * Revision	History: See Github: https://github.com/JustMikeHellBurn/Animation2DToolsProject2
 *				
 */
package  
{
	// Import starling + citrus engine
	import citrus.core.starling.StarlingCitrusEngine;
	import starling.core.Starling;
	
	// Import flash components
	import flash.events.Event;
	
	// Import splash state, using this as the start state.
	import states.SplashState;
	
	// Set the width and height of window to 800 by 600, frameRate is typical 60fps. 
	[SWF(width=800, height=600, frameRate=60, backgroundColor=0x000000)]
	
	/*
	 * JibblyTheOutcast -> StarlingCitrusEngine
	 *     
	 *		The entry point for the game.
	 */
	public class JibblyTheOutcast extends StarlingCitrusEngine {

		// JibblyTheOutcast() - Constructor for the class
		//
		public function JibblyTheOutcast() {
			super();
		}
		
		// initialize() - Intializes starling
		// 		
		override public function initialize():void {
			setUpStarling(true);
		}
		
		// handleStarlingReady() - Intializes assets and opens up splash state
		//
		override public function handleStarlingReady():void {
			Assets.init();
			state = new SplashState();
		}
		
	}
}