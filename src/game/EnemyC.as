package game
{
	import flash.display.Sprite;
	import flash.geom.Point;

	public class EnemyC extends Actor
	{
		private var _player:Player;
		
		public function set player(value:Player):void {
			_player = value;
		}
		
		public function EnemyC(xml:XML = null) {
			_sprite = new Sprite;
			_sprite.graphics.beginFill(0xffff00);
			_sprite.graphics.drawCircle(0, 0, 20);
			_sprite.graphics.endFill();
			
			if (xml)
				loadFromXML(xml);
		}
		
		override public function update(elapsed:int):void {
			if (_player) {
				var targetPos:Point = new Point(_player.sprite.x, _player.sprite.y);
				var pos:Point = new Point(_sprite.x, _sprite.y);
				var velocity:Point = targetPos.subtract(pos);
				
				_sprite.x += velocity.x * 0.1;
				_sprite.y += velocity.y * 0.1;
			}
		}
	}
}