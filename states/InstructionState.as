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
	import objects.FloatingText;
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

		private var themeChannel:SoundChannel;
		private var ce:CitrusEngine;
		
		public function InstructionState() {
			super();
		}

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
 			// Add Portals
			var portal:Portal = getObjectByName("portal") as Portal;
			
 			// Add instruction texts
			/*
			var moveText:FloatingText = new FloatingText(30, 30, "Use");
			addChild(moveText);
			var tf:TextField = new TextField(100, 20, "Hello", "Verdana", 12, Color.WHITE);
			addChild(tf);
			*/
			
			// Play Instruction Theme
			themeChannel = Assets.instructionSound.play(0, int.MAX_VALUE, new SoundTransform(0.25));
			
			// get the keyboard
			ce = CitrusEngine.getInstance();
			var kb:Keyboard = ce.input.keyboard;
			 
			// Add continue action
			//kb.addKeyAction("space", Keyboard.SPACE);

			this.nextState = new MenuState();
		}
		
		override public function destroy():void {
			super.destroy();
			// Stop Theme
			themeChannel.stop();
		}
		
		override public function update(timeDelta:Number):void {
			super.update(timeDelta);
	
		}
		
	}
	
}
