package 
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.core.Starling;
	
	import objects.TileMap;
	import scenes.*;
	
	import objects.Ball;
	import objects.SplashImage;
	
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.display.Stage;
	import flash.display.Scene;
	import flash.media.SoundChannel;
	
	public class Game extends Sprite
	{
		// Game Constants
		public static var KEY_MAX:int = 256;
		public static var KEY_LEFT:int = 37;
		public static var KEY_UP:int = 38;
		public static var KEY_RIGHT:int = 39;
		public static var KEY_DOWN:int = 40;
		
		protected var nativeStage:Stage;
		
		// ==================================
		// Key/Mouse Event Variables
		// ==================================
		public var keys:Array;
		
		// ==================================
		// Game Objects
		// ==================================
		public var ball:Ball;
		public var tileMap:TileMap;
		public var splashImage:SplashImage;
		
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
		
		public function Game()
		{
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
		}

		private function init(event:Event):void
		{
			// Intialize Game Objects
			tileMap = new TileMap(this, "assets/maps/test3.tmx");
			
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
			
		}
		
		public function update(event:Event):void {
			// Update Objects
			liveScene.update(event);

			// Scroll game screen
			/*
			if (this.keys[Game.KEY_LEFT]) { this.x += scrollSpeed; }
			if (this.keys[Game.KEY_UP]) { this.y += scrollSpeed; }
			if (this.keys[Game.KEY_RIGHT]) { this.x -= scrollSpeed; }
			if (this.keys[Game.KEY_DOWN]) { this.y -= scrollSpeed; }
			*/
		
			// Lock game screen to ball
			this.x = -ball.x + stage.stageWidth / 2 - ball.width / 2;
			this.y = -ball.y + stage.stageHeight / 2 - ball.height / 2;

			// Boundary Collision
			if (this.x > 0) this.x = 0;
			if (this.x < stage.stageWidth - tileMap.width) this.x = stage.stageWidth - tileMap.width;
			if (this.y > 0) this.y = 0;
			if (this.y < stage.stageHeight - tileMap.height) this.y = stage.stageHeight - tileMap.height;

		}
		
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