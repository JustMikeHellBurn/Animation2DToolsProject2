package objects {
	import citrus.objects.CitrusSprite;
	
	public class PlayText extends CitrusSprite {

		public function PlayText(name:String, params:Object=null) {
			super(name, params);
			view = Assets.mpAtlas.getTexture("playtext");
		}

	}
	
}
