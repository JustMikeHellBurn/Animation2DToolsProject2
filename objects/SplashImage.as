package objects {
	
	import starling.core.Starling;
	import starling.display.MovieClip;
	import flash.display.Stage;
	
	public class SplashImage extends BaseObject {

		public function SplashImage(game:Game) {
			super(game);
			// Load our Plane image from our Texture Atlas
			spriteClip = new MovieClip(Assets.mpAtlas.getTextures("splashimage"), 1);
			Starling.juggler.add(spriteClip);
			
			this.x = nativeStage.stageWidth / 2 - spriteClip.width / 2;
			this.y = nativeStage.stageHeight / 2 - spriteClip.height / 2;
			addChild(spriteClip);
		}

	}
	
}
