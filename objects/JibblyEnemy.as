package objects {
	import citrus.objects.platformer.box2d.Enemy;
	
	public class JibblyEnemy extends Enemy {

		public function JibblyEnemy(name:String, params:Object=null) {
			super(name, params);
			view = Assets.mpAtlas.getTexture("enemy");
		}

	}
	
}
