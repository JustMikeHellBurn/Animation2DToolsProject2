﻿package  {
	
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
		public static var playTheme:Class;
		public static var playSound:Sound;
		
		[Embed(source="assets/sfx/instructionstheme.mp3")]
		public static var instructionsTheme:Class;
		public static var instructionSound:Sound;
		
		[Embed(source="assets/sfx/menutheme.mp3")]
		public static var menuTheme:Class;
		public static var menuSound:Sound;
		
		
		// Alien Animation Graphics
		[Embed(source="assets/gfx/jibblyAtlas.xml", mimeType="application/octet-stream")]
		private static var jibblyXML:Class;
		
		[Embed(source="assets/gfx/jibbly.png")] 
		private static var jibbly:Class;
		public static var jibblyAtlas:TextureAtlas;
		
		
		//[Embed(source = 'assets/gfx/jibblyidle.png')] 
		//public static var JIBBLY_IDLE:Class;
		
		public static function init():void {
			mpAtlas = new TextureAtlas(Texture.fromBitmap(new atlas()),
				XML(new atlasXML()));
				
			jibblyAtlas = new TextureAtlas(Texture.fromBitmap(new jibbly()),
				XML(new jibblyXML()));
				
			playSound = new playTheme();
			playSound.play(0,0, new SoundTransform(0));
		
			instructionSound = new instructionsTheme();
			instructionSound.play(0,0, new SoundTransform(0));
			
			menuSound = new menuTheme();
			menuSound.play(0,0, new SoundTransform(0));
			
		}
		
	}
	
}
