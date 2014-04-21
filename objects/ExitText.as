package objects {
	import citrus.objects.CitrusSprite;
	
	public class ExitText extends CitrusSprite {

		public function ExitText(name:String, params:Object=null) {
			super(name, params);
			view = Assets.mpAtlas.getTexture("exittext");
			x -= view.width / 2;
			y -= view.height / 2;
		}

	}
	
}
