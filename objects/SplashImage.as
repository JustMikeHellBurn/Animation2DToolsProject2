package objects {
	
	import starling.core.Starling;
	import citrus.objects.CitrusSprite;
	import citrus.core.CitrusEngine;
	
	public class SplashImage extends CitrusSprite {

		public function SplashImage() {
			super("SplashImage");

			// Load splash image to view
			view = Assets.mpAtlas.getTexture("splashimage");

			// Center splash image
			x = CitrusEngine.getInstance().stage.stageWidth / 2 - view.width / 2;
			y = CitrusEngine.getInstance().stage.stageHeight / 2 - view.height / 2;
		}

	}
	
}
