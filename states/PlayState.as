/*
 * Author Names: 
 *		Justin Hellsten 	(http://justinhellsten.com/)
 *		Michael Burnie 		(http://michaelburnie.com/)
 *
 * Source File Name: PlayState.as
 * Last Modified by: Justin Hellsten
 * Date Last Modified: April 21st, 2014
 *
 * Program Description: 
 *
 *		Play state. This state is actually Level 1, and is where the action happens.
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
	
	/*
	 * PlayState -> BaseState
	 *     
	 *		Play State has one portal, which will lead to the end state. The player can control
	 *		jibbly, and must go through the obstacles and enemies to reach the exits. The player
	 *		can also pick up coins along the way for points. You have three lives, which if you run out
	 *		you will be sent to the end state with your final score.
	 */
	public class PlayState extends BaseState {

		// Play theme 
		private var themeChannel:SoundChannel;
		
		// Reference to Citrus Engine, needed for keyboard input, and object references.
		private var ce:CitrusEngine;
		
		// Text Fields (score, health, and lives counters)
		public var score:TextField;
		public var health:TextField;
		public var lives:TextField;
		public var scoreCounter:int;
		
		// PlayState() - Constructor for the class.
		//
		public function PlayState() {
			super();
		}

		// initialize() - Initialize the play state, things like the map, map objects, instruction text, portals, etc.
		//
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
	
			// Set up lives, health, and score text fields
			// ===========================================
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
	
		// destroy() - Destroys the play state, and stops the music theme.
		//
		override public function destroy():void {
			// Pass on the score to the end state
			(this.nextState as EndState).scoreCounter = scoreCounter;
			super.destroy();
			themeChannel.stop();
		}

		// update() - Updates the play state. This updates the score, health, and life counters.
		//
		override public function update(timeDelta:Number):void {
			super.update(timeDelta);

			var jibbly:Jibbly = getObjectByName("jibbly") as Jibbly;
			
			score.text =  "Score: " + scoreCounter;
			health.text = "Health: " + jibbly.health;
			lives.text = "Lives: " + jibbly.lives;
		}
	
	}
	
}
