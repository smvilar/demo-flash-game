package game
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;

	public class Actor
	{
		protected var _sprite:Sprite;
		protected var _speed:Number;
		
		public function addTo(parent:DisplayObjectContainer):void {
			parent.addChild(_sprite);
		}
		
		public function update(elapsed:int):void {
			// override me
		}
		
		protected function loadFromXML(xml:XML):void {
			if (xml.x != undefined)
				_sprite.x = xml.x;
			if (xml.y != undefined)
				_sprite.y = xml.y;
		}
	}
}