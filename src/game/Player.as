package game
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class Player extends Actor
	{
		private var _pressingLeft:Boolean = false;
		private var _pressingRight:Boolean = false;
		private var _pressingUp:Boolean = false;
		private var _pressingDown:Boolean = false;
		private var _speed:Number;
		
		private var _lives:int = 10;
		
		public function Player(xml:XML = null) {
			_sprite = new Sprite;
			_sprite.graphics.beginFill(0x0000ff);
			_sprite.graphics.drawCircle(0, 0, 20);
			_sprite.graphics.endFill();
			
			_sprite.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			if (xml) {
				loadFromXML(xml);
			}
		}
		
		override protected function loadFromXML(xml:XML):void {
			super.loadFromXML(xml);
			
			if (xml.speed != undefined)
				_speed = xml.speed;
			if (xml.lives != undefined)
				_lives = xml.lives;
		}
		
		private function onAddedToStage(event:Event):void {
			_sprite.stage.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			_sprite.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			_sprite.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onKeyDown(event:KeyboardEvent):void {
			onKey(event.keyCode, true);
		}
		
		private function onKeyUp(event:KeyboardEvent):void {
			onKey(event.keyCode, false);
		}
		
		private function onKey(keyCode:uint, pressed:Boolean):void
		{
			switch (keyCode) {
				case Keyboard.LEFT:
					_pressingLeft = pressed;
					break;
				case Keyboard.RIGHT:
					_pressingRight = pressed;
					break;
				case Keyboard.UP:
					_pressingUp = pressed;
					break;
				case Keyboard.DOWN:
					_pressingDown = pressed;
					break;
			}
		}
		
		override public function update(elapsed:int):void {
			if (_pressingLeft) {
				_sprite.x -= _speed * elapsed;
			}
			if (_pressingRight) {
				_sprite.x += _speed * elapsed;
			}
			if (_pressingUp) {
				_sprite.y -= _speed * elapsed;
			}
			if (_pressingDown) {
				_sprite.y += _speed * elapsed;
			}
		}
		
		override public function collide(actor:Actor):void {
			_lives--;
		}
	}
}