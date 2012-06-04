package screenmanager
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.utils.Dictionary;

	public class ScreenManager
	{
		private var _root:DisplayObjectContainer;
		private var _currentScreen:Screen;
		private var _currentScreenName:String = null;
		private var _nextScreenName:String = null;
		private var _registeredScreens:Dictionary = new Dictionary();
		private var _transitions:Dictionary = new Dictionary();
		
		public function ScreenManager(root:DisplayObjectContainer):void {
			_root = root;
		}
		
		public function start(initialScreen:String):void {
			enterScreen(initialScreen);
			
			_root.stage.addEventListener(Event.ENTER_FRAME, onFrame);
		}
		
		private function onFrame(event:Event):void
		{
			_currentScreen.update(30);
			
			if (_nextScreenName != null) { 
				exitScreen();
				enterScreen(_nextScreenName);
				_nextScreenName = null;
			}
		}
		
		public function registerScreen(name:String, ScreenClass:Class):void {
			_registeredScreens[name] = ScreenClass;
		}
		
		public function addTransition(fromScreen:String, toScreen:String, event:String):void {
			if (!(fromScreen in _transitions))
				_transitions[fromScreen] = new Dictionary();
			_transitions[fromScreen][event] = toScreen;
		}
		
		public function dispatch(event:String):void {
			if (_currentScreenName in _transitions && event in _transitions[_currentScreenName])
				_nextScreenName = _transitions[_currentScreenName][event];
		}
		
		public function enterScreen(name:String):void {
			if (!(name in _registeredScreens))
				throw new Error("Screen " + name + " is not registered");
			
			_currentScreen = new _registeredScreens[name];
			_currentScreenName = name;
			_root.addChild(_currentScreen.view);
			_currentScreen.screenManager = this;
			_currentScreen.enter();
		}
		
		public function exitScreen():void {
			_currentScreen.exit();
			_root.removeChild(_currentScreen.view);
			_currentScreen = null;
		}
	}
}