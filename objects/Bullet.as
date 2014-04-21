package objects {
	import citrus.core.CitrusEngine;
	import citrus.objects.platformer.box2d.Missile;
	
	public class Bullet extends Missile {

		public function Bullet(name:String, params:Object=null) {
			super(name, params);
			
			// Load splash image to view
			view = Assets.mpAtlas.getTexture("bullet");
			
			
		}

	}
	
}
