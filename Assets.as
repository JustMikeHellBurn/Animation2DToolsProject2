/*
 * Author Names: 
 *		Justin Hellsten 	(http://justinhellsten.com/)
 *		Michael Burnie 		(http://michaelburnie.com/)
 *
 * Source File Name: Assets.as
 * Last Modified by: Justin Hellsten
 * Date Last Modified: April 21st, 2014
 *
 * Program Description: 
 *
 *		Contains all game assets, graphics, sounds effects and music, fonts, etc. All interaction with assets
 *		are through Assets.as
 *		
 * Revision	History: See Github: https://github.com/JustMikeHellBurn/Animation2DToolsProject2
 *				
 */
package  {
	
	// Import starling textures, and bitmaps
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	// Import flash sound objects to create sfx, and music sound channels.
	import flash.media.Sound;
	import flash.media.SoundTransform;
	
	/*
	 * Assets
	 *     
	 *		Container for all embedded game assets.
	 */
	public class Assets {

		// Embed the Jibbly the outcast Texture Atlas
		[Embed(source="assets/gfx/atlas.png")]
		private static var atlasBitmap:Class;
		public static var mpAtlas:TextureAtlas;
		
		[Embed(source="assets/gfx/atlas.xml", mimeType="application/octet-stream")]
		private static var atlasXML:Class;

		// Fonts
		[Embed(source="assets/fonts/jibblyFont.png")]
		private static var jibblyFont:Class;
		
		[Embed(source="assets/fonts/jibblyFont.fnt", mimeType="application/octet-stream")]
		private static var jibblyFontXML:Class;
		
		// Music Themes and Sounds
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
		
		[Embed(source="assets/sfx/jump.mp3")]
		public static var jumpSFX:Class;
		public static var jumpSound:Sound;
		
		[Embed(source="assets/sfx/shoot.mp3")]
		public static var shootSFX:Class;
		public static var shootSound:Sound;
		
		[Embed(source="assets/sfx/teleport.mp3")]
		public static var teleportSFX:Class;
		public static var teleportSound:Sound;
		
		[Embed(source="assets/sfx/hurt.mp3")]
		public static var hurtSFX:Class;
		public static var hurtSound:Sound;
		
		[Embed(source="assets/sfx/coin.mp3")]
		public static var coinSFX:Class;
		public static var coinSound:Sound;
		
		[Embed(source="assets/sfx/enemyhurt.mp3")]
		public static var enemyHurtSFX:Class;
		public static var enemyHurtSound:Sound;
		
		// Alien Animation Graphics
		[Embed(source="assets/gfx/jibblyAtlas.xml", mimeType="application/octet-stream")]
		private static var jibblyXML:Class;
		
		[Embed(source="assets/gfx/jibbly.png")] 
		private static var jibblyBitmap:Class;
		
		public static var jibblyAtlas:TextureAtlas;
		
		// Tile Set Graphics
        [Embed(source="assets/gfx/tileset.png")]    
        public static var TILESET:Class;  
		
		// Tmx Maps (levels, instruction, menu, and game over
		[Embed(source="assets/maps/level1.tmx", mimeType="application/octet-stream")]    
        public static var LEVEL1_MAP:Class;     
		
        [Embed(source="assets/maps/instructions.tmx", mimeType="application/octet-stream")]    
        public static var INSTRUCTIONS_MAP:Class;     
		
        [Embed(source="assets/maps/menu.tmx", mimeType="application/octet-stream")]    
        public static var MENU_MAP:Class;     
		
        [Embed(source="assets/maps/end.tmx", mimeType="application/octet-stream")]    
        public static var END_MAP:Class;     
		
		// init() - Initialize static assets.
		//
		public static function init():void {

			// Grab texture atlas
			mpAtlas = new TextureAtlas(Texture.fromBitmap(new atlasBitmap()), XML(new atlasXML()));
			jibblyAtlas = new TextureAtlas(Texture.fromBitmap(new jibblyBitmap()), XML(new jibblyXML()));
			
			// Load SFX Assets
			splashSound = new splashTheme();
			splashSound.play(0,0, new SoundTransform(0));
			
			instructionSound = new instructionsTheme();
			instructionSound.play(0,0, new SoundTransform(0));
			
			menuSound = new menuTheme();
			menuSound.play(0,0, new SoundTransform(0));
			
			playSound = new playTheme();
			playSound.play(0,0, new SoundTransform(0));
			
			jumpSound = new jumpSFX();
			jumpSound.play(0,0, new SoundTransform(0));
			
			jumpSound = new jumpSFX();
			jumpSound.play(0,0, new SoundTransform(0));
			
			shootSound = new shootSFX();
			shootSound.play(0,0, new SoundTransform(0));
			
			teleportSound = new teleportSFX();
			teleportSound.play(0,0, new SoundTransform(0));
			
			hurtSound = new hurtSFX();
			hurtSound.play(0,0, new SoundTransform(0));
			
			coinSound = new coinSFX();
			coinSound.play(0,0, new SoundTransform(0));
			
			enemyHurtSound = new enemyHurtSFX();
			enemyHurtSound.play(0,0, new SoundTransform(0));
			
			// Load Fonts
			TextField.registerBitmapFont(new BitmapFont(Texture.fromBitmap(new jibblyFont()),
				XML(new jibblyFontXML())));
				
		}
		
	}
	
}
