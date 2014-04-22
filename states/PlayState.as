﻿package states {
	
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
	import objects.JibblyEnemy;
	import objects.JibblyMovingPlatform;
	
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
			add(box2D);

			// Load Map, and its objects
            var bitmapView:Bitmap = new Assets.TILESET();
            bitmapView.name = "tileset.png";    

			var map:XML = XML(new Assets.LEVEL1_MAP());
			
            ObjectMaker2D.FromTiledMap(map, [bitmapView]);   
			
			var movingPlatforms:JibblyMovingPlatform = getObjectByName("movingPlatform") as JibblyMovingPlatform;
			var coin:JibblyCoin = getObjectByName("coin") as JibblyCoin;
			var enemy:JibblyEnemy = getObjectByName("coin") as JibblyEnemy;
	
			lives = new TextField(300, 64, "Lives: 3");
			lives.x = 500;
			lives.y = 10;
			lives.fontName = "JibblyFont";
			lives.fontSize = 32;
			lives.color = Color.WHITE;
			addChild(lives);
			
			health = new TextField(300, 64, "Health: 3");
			health.x = 0;
			health.y = 10;
			health.fontName = "JibblyFont";
			health.fontSize = 32;
			health.color = Color.WHITE;
			addChild(health);
			
			score = new TextField(300, 64, "Score");
			score.x = 250;
			score.y = 10;
			score.fontName = "JibblyFont";
			score.fontSize = 32;
			score.color = Color.WHITE;
			addChild(score);
			
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
