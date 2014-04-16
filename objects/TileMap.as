package objects {
	
	import starling.events.Event;
	import starling.display.Sprite;
	
	import extensions.Base64;
	import extensions.TMXLayer;
	import extensions.TMXTileMap;
	import extensions.TMXTileSheet;
	
	public class TileMap extends Sprite {

		var TMX:TMXTileMap = null;
		
		public function TileMap(url:String) {
			// Load Tile Map from TMX File
			TMX = new TMXTileMap();
			TMX.addEventListener(Event.COMPLETE, drawLayers);
			TMX.load(url);
		}

		private function drawLayers(event:Event):void
		{
			
		   for(var i:int = 0; i < TMX.layers().length; i++)
		   {
				addChild(TMX.layers()[i].getHolder());
		   }

		}
		
	}
	
}
