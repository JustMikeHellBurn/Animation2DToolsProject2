package  {
	
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import flash.media.Sound;
	import flash.media.SoundTransform;
	import objects.Jibbly;
	
	public class Assets {

		// Embed the MailPilot Texture Atlas
		[Embed(source="assets/gfx/atlas.png")]
		private static var atlasBitmap:Class;
		
		public static var mpAtlas:TextureAtlas;
		
		[Embed(source="assets/gfx/atlas.xml", mimeType="application/octet-stream")]
		private static var atlasXML:Class;

		[Embed(source="assets/sfx/theme.mp3")]
		public static var playTheme:Class;
		public static var playSound:Sound;
		
		[Embed(source="assets/sfx/instructionstheme.mp3")]
		public static var instructionsTheme:Class;
		public static var instructionSound:Sound;
		
		[Embed(source="assets/sfx/menutheme.mp3")]
		public static var menuTheme:Class;
		public static var menuSound:Sound;
		
		[Embed(source="assets/sfx/splashtheme.mp3")]
		public static var splashTheme:Class;
		public static var splashSound:Sound;
		
		// Alien Animation Graphics
		[Embed(source="assets/gfx/jibblyAtlas.xml", mimeType="application/octet-stream")]
		private static var jibblyXML:Class;
		
		[Embed(source="assets/gfx/jibbly.png")] 
		private static var jibblyBitmap:Class;
		
		public static var jibblyAtlas:TextureAtlas;
		
		
		//[Embed(source = 'assets/gfx/jibblyidle.png')] 
		//public static var JIBBLY_IDLE:Class;
		
		public static function init():void {

			mpAtlas = new TextureAtlas(Texture.fromBitmap(new atlasBitmap()), XML(new atlasXML()));
			jibblyAtlas = new TextureAtlas(Texture.fromBitmap(new jibblyBitmap()), XML(new jibblyXML()));
			
			// Load Themes
			splashSound = new splashTheme();
			splashSound.play(0,0, new SoundTransform(0));
		}
		
	}
	
}
