package objects {
	import citrus.objects.platformer.box2d.MovingPlatform;
	
	public class JibblyMovingPlatform extends MovingPlatform {

		public function JibblyMovingPlatform(name:String, params:Object=null) {
			super(name, params);
			view = Assets.mpAtlas.getTexture("movingplatform");
		}

	}
	
}
