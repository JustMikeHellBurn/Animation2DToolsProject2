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

	public class MenuState extends BaseState {

		private var themeChannel:SoundChannel;
		private var ce:CitrusEngine;
		
		public function MenuState() {
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
			themeChannel = Assets.menuSound.play(0, 0, new SoundTransform(0.25));
			
			// get the keyboard
			ce = CitrusEngine.getInstance();
			var kb:Keyboard = ce.input.keyboard;
			 
			this.nextState = new PlayState();

		}
		
		override public function destroy():void {
			super.destroy();
			// Stop Theme
			themeChannel.stop();
		}
		
		override public function update(timeDelta:Number):void {
			super.update(timeDelta);
			
			if (ce.input.justDid("space"))
				destroy();
	
		}
		
	}
	
}
