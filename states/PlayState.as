package states {
	
	// Flash Imports
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.display.Bitmap; 
	
	// Object Imports
	import objects.SplashImage;
	import objects.Jibbly;
	
	// Starling Imports
	import starling.events.Event;
	
	// Citrus Imports
	import citrus.physics.box2d.Box2D;
	import citrus.utils.objectmakers.ObjectMaker2D;   
	import citrus.core.CitrusEngine;
	import citrus.input.controllers.Keyboard;
	import citrus.objects.platformer.box2d.MovingPlatform;
	import citrus.view.starlingview.StarlingArt;
	import flash.geom.Rectangle;
	
	public class PlayState extends BaseState {

		private var themeChannel:SoundChannel;
		private var splashImage:SplashImage;
		private var ce:CitrusEngine;
		
		public function PlayState() {
			super();
		}

		override public function initialize():void {
    		super.initialize();
			
			// Make animations loop
			StarlingArt.setLoopAnimations(["idle", "jump", "walk", "fall"]);
			
			// Add physics (box2D) to the game
			var box2D:Box2D = new Box2D("box2D");
			add(box2D);

			// Load Map, and its objects
            var bitmapView:Bitmap = new Assets.TILESET();
            bitmapView.name = "tileset.png";    

			var map:XML = XML(new Assets.LEVEL1_MAP());
			
            ObjectMaker2D.FromTiledMap(map, [bitmapView]);   
			
			var movingPlatforms:MovingPlatform = getObjectByName("movingPlatform") as MovingPlatform;
			
			
			// Set jibbly as center focus
			var jibbly:Jibbly = getObjectByName("jibbly") as Jibbly;
			view.camera.setUp(jibbly, new Rectangle(0, 0, map.@width * map.@tilewidth, map.@height * map.@tileheight));
			
			// Play Instruction Theme
			themeChannel = Assets.playSound.play(0, 0, new SoundTransform(0.25));
			
			// get the keyboard
			ce = CitrusEngine.getInstance();
			ce.input.keyboard.resetAllKeyActions();
			var kb:Keyboard = ce.input.keyboard;
			 

		}
		
		override public function destroy():void {
			super.destroy();
			// Stop Theme
			themeChannel.stop();
			CitrusEngine.getInstance().state = new SplashState();
		}
		
		override public function update(timeDelta:Number):void {
			super.update(timeDelta);
	
		}
		
	}
	
}
