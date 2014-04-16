package 
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.core.Starling;
	
	import objects.TileMap;
	import scenes.*;
	
	import objects.Ball;
	
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.display.Stage;
	
	public class Game extends Sprite
	{
		// Game Constants
		public static var KEY_MAX:int = 256;
		public static var KEY_LEFT:int = 37;
		public static var KEY_UP:int = 38;
		public static var KEY_RIGHT:int = 39;
		public static var KEY_DOWN:int = 40;
		
		protected var nativeStage:Stage;
		
		// Key/Mouse Event Variables
		public var keys:Array;
		
		// Game Objects
		public var ball:Ball;
		public var tileMap:TileMap;
		
		// Game Variables (Score/Life/etc)
		public var score:int;
		public var lifeCounter:int;
		
		// Game Scenes
		private var splashScene:SplashScene;
		private var instructionScene:InstructionScene;
		private var menuScene:MenuScene;
		private var playScene:PlayScene;
		private var gameOverScene:GameOverScene;
		
		public function Game()
		{
			// Set Key Values
			keys = [];
			for (var i:int = 0; i < Game.KEY_MAX; ++i) {
				keys[i] = false;
			}
			
			// Establish a reference to the native stage
			nativeStage = Starling.current.nativeStage;
			nativeStage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			nativeStage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			nativeStage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyboardDown);
			nativeStage.addEventListener(KeyboardEvent.KEY_UP, onKeyboardUp);
			
			// initialize the game by adding objects to the stage
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(event:Event):void
		{
			// Initialize Scenes
			splashScene = new SplashScene(this);
			instructionScene = new InstructionScene(this);
			menuScene = new MenuScene(this);
			playScene = new PlayScene(this);
			gameOverScene = new GameOverScene(this);
			
			// Intialize Game Objects
			tileMap = new TileMap(this, "assets/maps/test.tmx");
			addChild(tileMap);
			
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