package screens
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import screenmanager.Screen;
	
	import utils.GUI;
	
	public class MainMenuScreen extends Screen
	{
		private var _view:Sprite;
		
		override public function get view():DisplayObject {
			return _view;
		}
		
		public function MainMenuScreen() {
			_view = new Sprite;
		}
		
		override public function enter():void {
			trace("Main Menu enter");
			
			// background
			_view.graphics.beginFill(0xcccccc);
			_view.graphics.drawRect(0, 0, _view.stage.stageWidth, _view.stage.stageHeight); 
			_view.graphics.endFill();
			
			// title
			var title:TextField = new TextField();
			title.defaultTextFormat = new TextFormat("_sans", 20, 0, true, false, false, null, null, TextFormatAlign.CENTER); 
			title.selectable = false;
			title.text = "MainMenu";
			title.width = _view.stage.stageWidth;
			_view.addChild(title);
			
			// play button
			_view.addChild(GUI.createButton(100, 100, 100, 24, "Play", onPlay));
		}
		
		override public function update(elapsed:int):void {
		}
		
		override public function exit():void {
			trace("Main Menu exit");
		}
		
		private function onPlay(event:MouseEvent):void
		{
			(event.target as DisplayObject).removeEventListener(MouseEvent.CLICK, onPlay);
			screenManager.dispatch("play");
		}
	}
}