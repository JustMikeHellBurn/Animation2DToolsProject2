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

	
	public class EndState extends BaseState {

		private var themeChannel:SoundChannel;
		private var ce:CitrusEngine;
		public var scoreCounter:int;
		
		public function EndState() {
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
			var map:XML = XML(new Assets.END_MAP());
            ObjectMaker2D.FromTiledMap(map, [bitmapView]);  
			// Set jibbly as center focus
			var jibbly:Jibbly = getObjectByName("jibbly") as Jibbly;
			view.camera.setUp(jibbly, new Rectangle(0, 0, map.@width * map.@tilewidth, map.@height * map.@tileheight));
 
 			// Add instruction text
			var scoreText:TextField = new TextField(250, 32, "Score: " + scoreCounter);
			scoreText.x = 260;
			scoreText.y = 250;
			scoreText.fontName = "jibblyFont";
			scoreText.fontSize = 32;
			scoreText.color = Color.WHITE;
			
			var gameOverText:TextField = new TextField(500, 32, "Game Over! Press Enter to Continue!");
			gameOverText.x = 150;
			gameOverText.y = 150;
			gameOverText.fontName = "jibblyFont";
			gameOverText.fontSize = 32;
			gameOverText.color = Color.WHITE;
			
			addChild(scoreText);
			addChild(gameOverText);
			
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
			themeChannel = Assets.menuSound.play(0, 0, new SoundTransform(0.25));
			
			// get the keyboard
			ce = CitrusEngine.getInstance();
			var kb:Keyboard = ce.input.keyboard;
			 
			// Add continue action
			kb.addKeyAction("continue", Keyboard.ENTER);

			this.nextState = new SplashState();
		}
		
		override public function destroy():void {
			super.destroy();
			// Stop Theme
			themeChannel.stop();
		}
		
		override public function update(timeDelta:Number):void {
			super.update(timeDelta);
	
			if (ce.input.isDoing("continue")) {
				destroy();
			}
			
		}
		
	}
	
}
