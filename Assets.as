package  {
	
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import flash.media.Sound;
	import flash.media.SoundTransform;
	
	public class Assets {

		// Embed the MailPilot Texture Atlas
		[Embed(source="assets/gfx/atlas.png")]
		private static var atlas:Class;
		
		public static var mpAtlas:TextureAtlas;
		
		[Embed(source="assets/gfx/atlas.xml", mimeType="application/octet-stream")]
		private static var atlasXML:Class;

		[Embed(source="assets/sfx/theme.mp3")]
		public static var themeSound:Class;
		public static var theme:Sound;
		
		public static function init():void {
			mpAtlas = new TextureAtlas(Texture.fromBitmap(new atlas()),
				XML(new atlasXML()));
				
			theme = new themeSound();
			theme.play(0,0, new SoundTransform(0));
		}
		
	}
	
}
