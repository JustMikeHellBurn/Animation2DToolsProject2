package objects  {
	import citrus.objects.platformer.box2d.Coin;
	import Box2D.Dynamics.Contacts.b2Contact;
	import states.PlayState;
	import citrus.core.CitrusEngine;
	
	public class JibblyCoin extends Coin {

		public function JibblyCoin(name:String, params:Object=null) {
			super(name, params);
			view = Assets.mpAtlas.getTexture("coin");
		}

		override public function handleBeginContact(contact:b2Contact):void
		{
			super.handleBeginContact(contact);
			Assets.coinSound.play();
			(CitrusEngine.getInstance().state as PlayState).scoreCounter += 20;
		}
		
	}
	
}
