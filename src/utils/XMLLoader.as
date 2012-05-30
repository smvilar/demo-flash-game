package utils {
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class XMLLoader {
		private var _loader:URLLoader;
		private var _loadedCallback:Function;

		public function load(filename:String, loadedCallback:Function):void {
			_loader = new URLLoader(new URLRequest(filename));
			_loader.addEventListener(Event.COMPLETE, onLoadComplete);
			_loadedCallback = loadedCallback;
		}

		private function onLoadComplete(ev:Event):void {
			_loadedCallback(XML(ev.target.data));
		}
	}
}