package screenmanager
{
	import flash.display.DisplayObject;

	public class Screen
	{
		private var _screenMgr:ScreenManager;
		
		public function get screenManager():ScreenManager { return _screenMgr; }
		public function set screenManager(screenMgr:ScreenManager):void { _screenMgr = screenMgr; }
		
		public function get view():DisplayObject { return null; }
		
		public function enter():void {}
		public function update(elapsed:int):void {}
		public function exit():void {}
	}
}