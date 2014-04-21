package states {
	
	// Flash Imports
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.display.Bitmap; 
	
	// Object Imports
	import objects.SplashImage;
	
	// Starling Imports
	import starling.events.Event;
	
	// Citrus Imports
	import citrus.physics.box2d.Box2D;
	import citrus.utils.objectmakers.ObjectMaker2D;   
	import citrus.core.CitrusEngine;
	import citrus.input.controllers.Keyboard;
	
	public class MenuState extends BaseState {

		private var themeChannel:SoundChannel;
		private var ce:CitrusEngine;
		
		public function MenuState() {
			super();
		}

		override public function initialize():void {
    		super.initialize();
			
			// Add physics (box2D) to the game
			var box2D:Box2D = new Box2D("box2D");
			add(box2D);

			// Load Map, and its objects
            var bitmapView:Bitmap = new Assets.TILESET();
            bitmapView.name = "tileset.png";    
            ObjectMaker2D.FromTiledMap(XML(new Assets.MENU_MAP()), [bitmapView]);   
			
			// Play Instruction Theme
			themeChannel = Assets.menuSound.play(0, 0, new SoundTransform(0.25));
			
			// get the keyboard
			ce = CitrusEngine.getInstance();
			var kb:Keyboard = ce.input.keyboard;
			 
			// Add continue action
			kb.addKeyAction("space", Keyboard.SPACE);

		}
		
		override public function destroy():void {
			super.destroy();
			// Stop Theme
			themeChannel.stop();
			CitrusEngine.getInstance().state = new PlayState();
		}
		
		override public function update(timeDelta:Number):void {
			super.update(timeDelta);
			
			if (ce.input.justDid("space"))
				destroy();
	
		}
		
	}
	
}
