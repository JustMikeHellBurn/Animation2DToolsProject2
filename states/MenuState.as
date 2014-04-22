/*
 * Author Names: 
 *		Justin Hellsten 	(http://justinhellsten.com/)
 *		Michael Burnie 		(http://michaelburnie.com/)
 *
 * Source File Name: MenuState.as
 * Last Modified by: Justin Hellsten
 * Date Last Modified: April 21st, 2014
 *
 * Program Description: 
 *
 *		Menu state. This state contains two portals, one that goes into the play state, the other which exits the game.
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
	import objects.PlayText;
	import objects.ExitText;
	import objects.PlayPortal;
	import objects.ExitPortal;
	
	// Starling Imports
	import starling.events.Event;
	
	// Citrus Imports
	import citrus.physics.box2d.Box2D;
	import citrus.utils.objectmakers.ObjectMaker2D;   
	import citrus.core.CitrusEngine;
	import citrus.input.controllers.Keyboard;
	import citrus.view.starlingview.StarlingArt;

	/*
	 * MenuState -> BaseState
	 *     
	 *		Menu state shows two portals, play and exit. If you go through the play portal you'll
	 *		get redirected to the play state, otherwise you'll be redirected to the splash state
	 *		if you choose to exit.
	 */
	public class MenuState extends BaseState {

		// Menu theme 
		private var themeChannel:SoundChannel;
		
		// Reference to Citrus Engine, needed for keyboard input, and object references.
		private var ce:CitrusEngine;
		
		// MenuState() - Constructor for the class.
		//
		public function MenuState() {
			super();
		}

		// initialize() - Initialize the menu state, things like the map, map objects, instruction text, portals, etc.
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
			var map:XML = XML(new Assets.MENU_MAP());
            ObjectMaker2D.FromTiledMap(map, [bitmapView]);  
			// Set jibbly as center focus
			var jibbly:Jibbly = getObjectByName("jibbly") as Jibbly;
			view.camera.setUp(jibbly, new Rectangle(0, 0, map.@width * map.@tilewidth, map.@height * map.@tileheight));
			
			// Add texts for portals
			var playText:PlayText = getObjectByName("playText") as PlayText;
			var exitText:ExitText = getObjectByName("exitText") as ExitText;

			var playPortal:PlayPortal = getObjectByName("playportal") as PlayPortal;
			var exitPortal:ExitPortal = getObjectByName("exitportal") as ExitPortal;

			// Play Instruction Theme
			themeChannel = Assets.menuSound.play(0, int.MAX_VALUE, new SoundTransform(0.25));
			
			// get the keyboard
			ce = CitrusEngine.getInstance();
			var kb:Keyboard = ce.input.keyboard;
			 
			this.nextState = new PlayState();

		}
		
		// destroy() - Destroys the menu state, and stops the music theme.
		//
		override public function destroy():void {
			super.destroy();
			themeChannel.stop();
		}
		
		// update() - Updates the menu state. Really all thats need is to make sure jibbly has > 0 lives, otherwise
		//			  After three deaths the player will be redirected to the play state.
		//
		override public function update(timeDelta:Number):void {
			super.update(timeDelta);
			// Jibbly can't die here, give him > 0 lives
			var jibbly:Jibbly = getObjectByName("jibbly") as Jibbly;
			jibbly.lives = 3;
		}
		
	}
	
}
