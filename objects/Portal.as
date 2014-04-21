package objects {
	import citrus.objects.CitrusSprite;
	import citrus.view.starlingview.AnimationSequence;
	
	public class Portal extends CitrusSprite {

		public function Portal(name:String, params:Object=null) {
			super(name, params);
			view = new AnimationSequence(Assets.mpAtlas, ["portal"], "portal", 10);
			updateCallEnabled = true;
			x -= view.width / 2;
			y -= view.height / 2;
		}

		override public function update(timeDelta:Number):void {
			super.update(timeDelta);
			_animation = "portal"
		}
		
	}
	
}
