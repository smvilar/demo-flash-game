package game
{
	import flash.display.Sprite;

	public class EnemyA extends Actor
	{
		private var _timer:int;
		private var _initialX:Number = 0;
		private var _initialY:Number = 0;
		
		public function EnemyA(xml:XML = null) {
			_sprite = new Sprite;
			_sprite.graphics.beginFill(0xff0000);
			_sprite.graphics.drawCircle(0, 0, 20);
			_sprite.graphics.endFill();
			
			if (xml)
				loadFromXML(xml);

			_initialX = _sprite.x;
			_initialY = _sprite.y;
			
			_timer = Math.random() * 1000;
		}
		
		override public function update(elapsed:int):void {
			_timer += elapsed;
			
			var angle:Number = (_timer * 0.01) % (Math.PI * 2);
			_sprite.y = _initialY + 50 * Math.sin(angle);
		}
	}
}