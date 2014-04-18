package objects {
	
	import starling.events.Event;
	import starling.display.Sprite;
	
	import extensions.Base64;
	import extensions.TMXLayer;
	import extensions.TMXTileMap;
	import extensions.TMXTileSheet;
	
	public class TileMap extends BaseObject {

		var TMX:TMXTileMap = null;
		
		public function TileMap(game:Game, url:String) {
			super(game);

			loadTileMap(url);
		}

		public function loadTileMap(url:String) {
			// Load Tile Map from TMX File
			TMX = new TMXTileMap();
			TMX.addEventListener(Event.COMPLETE, drawLayers);
			TMX.load(url);
		}
		
		private function drawLayers(event:Event):void
		{
			
		   for(var i:int = 0; i < TMX.layers().length; i++)
		   {
			   trace("I: " + i);
			   addChild(TMX.layers()[i].getHolder());
			 /*  trace(TMX.layers()[i].getData());
				addChild(TMX.layers()[i].getHolder());
				trace(TMX.layers()[i].getHolder().width); */
		   }

		}
		
		override public function update(event:Event):void { 

		}
		
		public function destroy():void {
			this.removeChildren();
		}
	}
	
}
