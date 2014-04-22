/*
 * Author Names: 
 *		Justin Hellsten 	(http://justinhellsten.com/)
 *		Michael Burnie 		(http://michaelburnie.com/)
 *
 * Source File Name: InstructionState.as
 * Last Modified by: Justin Hellsten
 * Date Last Modified: April 21st, 2014
 *
 * Program Description: 
 *
 *		Instruction state, which shows the splash image for 5 seconds, then continues into the instruction state.
 *		
 * Revision	History: See Github: https://github.com/JustMikeHellBurn/Animation2DToolsProject2
 *				
 */
package states {
	
	// Flash Imports
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.display.Bitmap; 
	import flash.geom.Rectangle;
	
	// Object Imports
	import objects.Jibbly;
	import objects.Portal;
	
	// Starling Imports
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.Color;
	
	// Citrus Imports
	import citrus.physics.box2d.Box2D;
	import citrus.utils.objectmakers.ObjectMaker2D;   
	import citrus.core.CitrusEngine;
	import citrus.input.controllers.Keyboard;
	import citrus.view.starlingview.StarlingArt;

	/*
	 * InstructionState -> BaseState
	 *     
	 *		Instruction state shows the instructions, and executes a tiled map where the user can contro Jibbly. 
	 *		The only way to exit this state is by going through the portal.
	 */
	public class InstructionState extends BaseState {

		// Instruction's theme
		private var themeChannel:SoundChannel;
		
		// Reference to Citrus Engine, needed for keyboard input, and object references.
		private var ce:CitrusEngine;
		
		// InstructionState() - Constructor for the class.
		//
		public function InstructionState() {
			super();
		}

		// initialize() - Initialize the instruction state, things like the map, map objects, instruction text, etc.
		//
		override public function initialize():void {
    		super.initialize();
			
			// Make animations loop
			StarlingArt.setLoopAnimations(["idle", "jump", "walk", "fall", "portal"]);
			
			// Add physics (box2D) to the game
			var box2D:Box2D = new Box2D("box2D");
			add(box2D);

			// Load Map, and its objects
            var bitmapView:Bitmap = new Assets.TILESET();
            bitmapView.name = "tileset.png";    
			var map:XML = XML(new Assets.INSTRUCTIONS_MAP());
            ObjectMaker2D.FromTiledMap(map, [bitmapView]);  
			// Set jibbly as center focus
			var jibbly:Jibbly = getObjectByName("jibbly") as Jibbly;
			view.camera.setUp(jibbly, new Rectangle(0, 0, map.@width * map.@tilewidth, map.@height * map.@tileheight));
 
 			// Add instruction text
			var instructionText:TextField = new TextField(750, 100, "Use arrow keys to move. Z to shoot, T to go through\n portals, Space to Jump. Good Luck Jibbly!");
			instructionText.x = 25;
			instructionText.y = 25;
			instructionText.fontName = "JibblyFont";
			instructionText.fontSize = 32;
			instructionText.color = Color.WHITE;
			addChild(instructionText);
			
 			// Add Portal
			var portal:Portal = getObjectByName("portal") as Portal;
			
			// Play Instruction Theme
			themeChannel = Assets.instructionSound.play(0, int.MAX_VALUE, new SoundTransform(0.25));
			
			this.nextState = new MenuState();
		}
		
		// destroy() - Destroys the instruction state, and stops the music theme.
		//
		override public function destroy():void {
			super.destroy();
			themeChannel.stop();
		}
		
	}
	
}
