package objects  {
	import citrus.objects.platformer.box2d.Coin;
	import Box2D.Dynamics.Contacts.b2Contact;
	
	public class JibblyCoin extends Coin {

		public function JibblyCoin(name:String, params:Object=null) {
			super(name, params);
			trace("DSF");
		}

		override public function handleBeginContact(contact:b2Contact):void
		{
			super.handleBeginContact(contact);
			trace("contact");
		}
		
	}
	
}
