/*
 * Author Names: 
 *		Justin Hellsten 	(http://justinhellsten.com/)
 *		Michael Burnie 		(http://michaelburnie.com/)
 *
 * Source File Name: EndState.as
 * Last Modified by: Justin Hellsten
 * Date Last Modified: April 21st, 2014
 *
 * Program Description: 
 *
 *		End state. This last state, which is shown when the user dies or beats the game. When Enter is press the 
 *		Player is redirected to the menu state.
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
	 * EndState -> BaseState
	 *     
	 *		End state shows the final score, that is all...
	 */
	public class EndState extends BaseState {

		// End theme 
		private var themeChannel:SoundChannel;
		
		// Reference to Citrus Engine, needed for keyboard input, and object references.
		private var ce:CitrusEngine;
		
		// Final score
		public var scoreCounter:int;
		
		// EndState() - Constructor for the class.
		//
		public function EndState() {
			super();
		}

		// initialize() - Initialize the play state, things like the map, map objects, instruction text, portals, etc.
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
			var map:XML = XML(new Assets.END_MAP());
            ObjectMaker2D.FromTiledMap(map, [bitmapView]);  
			// Set jibbly as center focus
			var jibbly:Jibbly = getObjectByName("jibbly") as Jibbly;
			view.camera.setUp(jibbly, new Rectangle(0, 0, map.@width * map.@tilewidth, map.@height * map.@tileheight));
 
 			// Add instruction text
			var scoreText:TextField = new TextField(300, 64, "Score: " + scoreCounter);
			scoreText.x = 260;
			scoreText.y = 250;
			scoreText.fontName = "JibblyFont";
			scoreText.fontSize = 32;
			scoreText.color = Color.WHITE;
			
			var gameOverText:TextField = new TextField(600, 64, "Game Over! Press Enter to Continue!");
			gameOverText.x = 100;
			gameOverText.y = 150;
			gameOverText.fontName = "JibblyFont";
			gameOverText.fontSize = 32;
			gameOverText.color = Color.WHITE;
			
			addChild(scoreText);
			addChild(gameOverText);
			
 			// Add Portals
			var portal:Portal = getObjectByName("portal") as Portal;

			// Play Instruction Theme
			themeChannel = Assets.menuSound.play(0, int.MAX_VALUE, new SoundTransform(0.25));
			
			// get the keyboard
			ce = CitrusEngine.getInstance();
			var kb:Keyboard = ce.input.keyboard;
			 
			// Add continue action
			kb.addKeyAction("continue", Keyboard.ENTER);

			this.nextState = new MenuState();
		}
		
		// destroy() - Destroys the end state, and stops the music theme.
		//
		override public function destroy():void {
			super.destroy();
			themeChannel.stop();
		}
		
		// update() - Updates the emd state. If enter is press destroy the state.
		//
		override public function update(timeDelta:Number):void {
			super.update(timeDelta);
	
			if (ce.input.isDoing("continue")) {
				destroy();
			}
			
		}
		
	}
	
}
