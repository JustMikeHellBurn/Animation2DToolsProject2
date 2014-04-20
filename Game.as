package 
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.core.Starling;
	
	import objects.TileMap;
	import scenes.*;
	
	import objects.Ball;
	import objects.SplashImage;
	import objects.Jibbly;
	
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.display.Stage;
	import flash.display.Scene;
	import flash.media.SoundChannel;
	
	import citrus.core.starling.StarlingState;
	
	import citrus.core.starling.StarlingCitrusEngine;
	import citrus.objects.platformer.box2d.Platform;
	import citrus.objects.platformer.box2d.MovingPlatform;
	import citrus.objects.platformer.box2d.Hero;
	import citrus.objects.platformer.box2d.Enemy;
	import citrus.objects.platformer.box2d.Crate;
	import citrus.physics.box2d.IBox2DPhysicsObject;
	import citrus.physics.box2d.Box2DUtils;
	import citrus.physics.box2d.Box2D;

	
	import citrus.math.MathVector;
	
	import citrus.utils.objectmakers.ObjectMaker2D;   
	import flash.display.Bitmap; 
	import flash.geom.Rectangle;
	import Box2D.Common.Math.b2Vec2;
	
	import citrus.view.starlingview.AnimationSequence;
	import citrus.view.starlingview.StarlingArt;
	import citrus.view.starlingview.StarlingView;
	
	import citrus.core.CitrusEngine;
	import citrus.core.State;
	
	public class Game extends StarlingState
	{
		// Game Constants
		public static var KEY_MAX:int = 256;
		public static var KEY_LEFT:int = 37;
		public static var KEY_UP:int = 38;
		public static var KEY_RIGHT:int = 39;
		public static var KEY_DOWN:int = 40;
		public static var KEY_SPACEBAR:int = 32;
		public static var KEY_ESC:int = 27;
		
		protected var nativeStage:Stage;
		
		// ==================================
		// Key/Mouse Event Variables
		// ==================================
		public var keys:Array;
		
		// ==================================
		// Game Objects
		// ==================================
		public var ball:Ball;
		public var instructionTileMap:TileMap;
		public var playTileMap:TileMap;
		public var menuTileMap:TileMap;
		public var gameOverTileMap:TileMap;
		public var currentTileMap:TileMap;
		
		public var splashImage:SplashImage;
		
		public var enemy:Enemy;
		
		// ==================================
		// Game Variables (Score/Life/etc)
		// ==================================
		public var score:int;
		public var lifeCounter:int;
		
		public var scrollSpeed:int;
		
		// Keeps track of scroll position. This is needed for tile map boundary collision.
		// Set these values to the player/avatar coordinates and the tile map will do the rest 
		// of the work.
		public var scrollXPoint:int, scrollYPoint:int;
		
		// ==================================
		// Game Scenes
		// ==================================
		public var splashScene:SplashScene;
		public var instructionScene:InstructionScene;
		public var menuScene:MenuScene;
		public var playScene:PlayScene;
		public var gameOverScene:GameOverScene;
		public var liveScene:Scene;
		
        [Embed(source="assets/maps/test3.tmx", mimeType="application/octet-stream")]    
        private var tileMap:Class;     
		
        [Embed(source="assets/gfx/tileset.png")]    
        private var tileView:Class;  
		
		public function Game()
		{
			super();
			
			// Set up game assets
			Assets.init();
			
			
			/*
			// Initialize assets
			Assets.init();
			
			// Set Key Values
			keys = [];
			for (var i:int = 0; i < Game.KEY_MAX; ++i) {
				keys[i] = false;
			}
			scrollSpeed = 20;
			
			// Establish a reference to the native stage
			nativeStage = Starling.current.nativeStage;
			nativeStage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			nativeStage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			nativeStage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyboardDown);
			nativeStage.addEventListener(KeyboardEvent.KEY_UP, onKeyboardUp);
			
			
			// Update the game
			addEventListener(Event.ENTER_FRAME, update);
			
			// initialize the game by adding objects to the stage
			addEventListener(Event.ADDED_TO_STAGE, init);
			
			*/
		}

		override public function initialize():void {
    		super.initialize();
			Assets.playSound.play();
			
			// Make animations loop
			StarlingArt.setLoopAnimations(["idle", "jump", "walk", "fall"]);
			
			// Add physics (box2D) to the game
			var box2D:Box2D = new Box2D("box2D");
			//box2D.visible = true;
			add(box2D);

			CitrusEngine.getInstance().state = this;
			
            var bitmapView:Bitmap = new tileView();    
            bitmapView.name = "tileset.png";    
			
            ObjectMaker2D.FromTiledMap(XML(new tileMap()), [bitmapView]);     
			
			var jibbly:Jibbly = getObjectByName("jibbly") as Jibbly; 
			
			view.camera.setUp(jibbly);
			
			//var ball:Ball = new Ball("coin", {x:360, y:200, view:"levels/SoundPatchDemo/jewel.png"});
/*
			add(new Platform("bottom", {x:stage.stageWidth / 2, y:stage.stageHeight, width:stage.stageWidth}));
			add(new Platform("cloud", {x:250, y:250, width:170, oneWay:true}));
		*/	 

			// If you update any properties on the state's view, call updateCanvas() afterwards.
			//view.camera.cameraLensWidth = 800;
			//view.camera.cameraLensHeight = 400;

			//BlittingView(view).updateCanvas(); // Don't forget to call this
			
		}
		
		private function init(event:Event):void
		{
			// Intialize Game Objects
			instructionTileMap = new TileMap(this, "assets/maps/instructions.tmx");
			menuTileMap = new TileMap(this, "assets/maps/menu.tmx");
			playTileMap = new TileMap(this, "assets/maps/test3.tmx");
			currentTileMap = instructionTileMap;
			
			ball = new Ball(this);
			
			
			splashImage = new SplashImage(this);
			
			// Initialize Scenes
			splashScene = new SplashScene(this);
			instructionScene = new InstructionScene(this);
			menuScene = new MenuScene(this);
			playScene = new PlayScene(this);
			gameOverScene = new GameOverScene(this);
			liveScene = splashScene;
			addChild(liveScene);
			
			enemy = new Enemy("enemy",{x:900,y:700,width:78,height:132,leftBound:60,rightBound:950});
			add(enemy);
			
		}
		
		public function reset():void {
			// Reset keys
			for (var i:int = 0; i < Game.KEY_MAX; ++i) {
				keys[i] = false;
			}
		}
		
/*
		public function update(event:Event):void {
			// Update Objects
			liveScene.update(event);

			// Scroll game screen
			
			//if (this.keys[Game.KEY_LEFT]) { this.x += scrollSpeed; }
			//if (this.keys[Game.KEY_UP]) { this.y += scrollSpeed; }
			//if (this.keys[Game.KEY_RIGHT]) { this.x -= scrollSpeed; }
			//if (this.keys[Game.KEY_DOWN]) { this.y -= scrollSpeed; }
			
		
			// Lock game screen to ball
			this.x = -ball.x + stage.stageWidth / 2 - ball.width / 2;
			this.y = -ball.y + stage.stageHeight / 2 - ball.height / 2;

			// Boundary Collision
			if (this.x > 0) this.x = 0;
			if (this.x < stage.stageWidth - currentTileMap.width) this.x = stage.stageWidth - currentTileMap.width;
			if (this.y > 0) this.y = 0;
			if (this.y < stage.stageHeight - currentTileMap.height) this.y = stage.stageHeight - currentTileMap.height;

		}

		*/
		/* Key/Mouse Event Listeners */
		
		// Key On Down
		protected function onKeyboardDown(event:KeyboardEvent):void {
			this.keys[event.keyCode] = true;
		}
		
		// Key On Up
		protected function onKeyboardUp(event:KeyboardEvent):void {
			this.keys[event.keyCode] = false;
		}
		
		// Mouse On Down
		protected function onMouseDown(event:MouseEvent):void
		{
			trace("down");
		}

		//Mouse On Up
		protected function onMouseUp(event:MouseEvent):void
		{
			trace("up");
		}
		
	}

}