package game
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;

	public class Actor
	{
		protected var _sprite:Sprite;
		
		public function get sprite():Sprite { return _sprite; }
		
		public function addTo(parent:DisplayObjectContainer):void {
			parent.addChild(_sprite);
		}
		
		public function update(elapsed:int):void {
			throw new Error("Override me!");
		}
		
		public function collide(actor:Actor):void {
			
		}
		
		protected function loadFromXML(xml:XML):void {
			if (xml.x != undefined)
				_sprite.x = xml.x;
			if (xml.y != undefined)
				_sprite.y = xml.y;
		}
		
		public function checkCollision(actor:Actor):void
		{
			if (sprite.hitTestObject(actor.sprite)) {
				collide(actor);
			}
		}
	}
}