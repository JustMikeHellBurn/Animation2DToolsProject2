package states {
	
	// Flash Imports
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.display.Bitmap; 
	import flash.geom.Rectangle;
	
	// Object Imports
	import objects.SplashImage;
	import objects.Jibbly;
	
	// Starling Imports
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.Color;
	
	// Citrus Imports
	import citrus.physics.box2d.Box2D;
	import citrus.utils.objectmakers.ObjectMaker2D;   
	import citrus.core.CitrusEngine;
	import citrus.input.controllers.Keyboard;
	import citrus.objects.platformer.box2d.MovingPlatform;
	import citrus.core.starling.StarlingState;
	import citrus.objects.platformer.box2d.Enemy;
	import citrus.objects.platformer.box2d.Coin;
	import citrus.view.starlingview.StarlingArt;
	import objects.JibblyCoin;
	
	public class PlayState extends BaseState {

		private var themeChannel:SoundChannel;
		private var ce:CitrusEngine;
		
		public var score:TextField;
		public var health:TextField;
		public var lives:TextField;
		public var scoreCounter:int;
		
		public function PlayState() {
			super();
		}

		override public function initialize():void {
    		super.initialize();
			scoreCounter = 0;
			
			// Make animations loop
			StarlingArt.setLoopAnimations(["idle", "jump", "walk", "fall", "portal"]);
			
			// Add physics (box2D) to the game
			var box2D:Box2D = new Box2D("box2D");
			box2D.visible = true;
			add(box2D);

			// Load Map, and its objects
            var bitmapView:Bitmap = new Assets.TILESET();
            bitmapView.name = "tileset.png";    

			var map:XML = XML(new Assets.LEVEL1_MAP());
			
            ObjectMaker2D.FromTiledMap(map, [bitmapView]);   
			
			var movingPlatforms:MovingPlatform = getObjectByName("movingPlatform") as MovingPlatform;
			var coin:Coin = getObjectByName("coin") as JibblyCoin;
			
			// Put text fields 
			score = new TextField(200, 32, "Score: 0");
			health = new TextField(200, 32, "Health: 3");
			lives = new TextField(200, 32, "Lives: 3");
			
			health.x = 10;
			health.y = 10;
			score.x = 550;
			score.y = 10;
			score.fontName = "jibblyFont";
			score.fontSize = 32;
			health.fontName = "jibblyFont";
			health.fontSize = 32;
			score.color = Color.WHITE;
			health.color = Color.WHITE;
			
			lives.x = 250;
			lives.y = 10;
			lives.fontName = "jibblyFont";
			lives.fontSize = 32;
			lives.color = Color.WHITE;
			
			addChild(lives);
			addChild(score);
			addChild(health);
			
			// Set jibbly as center focus
			var jibbly:Jibbly = getObjectByName("jibbly") as Jibbly;
			view.camera.setUp(jibbly, new Rectangle(0, 0, map.@width * map.@tilewidth, map.@height * map.@tileheight));
			
			// Play Instruction Theme
			themeChannel = Assets.playSound.play(0, int.MAX_VALUE, new SoundTransform(0.25));
			
			// get the keyboard
			ce = CitrusEngine.getInstance();
			var kb:Keyboard = ce.input.keyboard;
			
			this.nextState = new EndState();
		}
	
		override public function destroy():void {
			(this.nextState as EndState).scoreCounter = scoreCounter;
			super.destroy();
			// Stop Theme
			themeChannel.stop();
		}

		override public function update(timeDelta:Number):void {
			super.update(timeDelta);
	
			// Detect collisions between objects
			var jibbly:Jibbly = getObjectByName("jibbly") as Jibbly;
			var enemy:Enemy = getObjectByName("enemy") as Enemy;
			
			score.text =  "Score: " + scoreCounter;
			health.text = "Health: " + jibbly.health;
			lives.text = "Lives: " + jibbly.lives;
		}
	
	}
	
}
