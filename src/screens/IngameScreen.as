package screens
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import game.Actor;
	import game.ActorFactory;
	import game.Player;
	
	import screenmanager.Screen;
	
	import utils.GUI;
	import utils.XMLLoader;
	
	public class IngameScreen extends Screen
	{
		private var _view:Sprite = new Sprite;
		private var _hudLayer:Sprite = new Sprite;
		private var _gameLayer:Sprite = new Sprite;

		private var _actorFactory:ActorFactory;
		
		override public function get view():DisplayObject {
			return _view;
		}
		
		override public function enter():void {
			trace("Ingame enter");
			
			// background
			_view.graphics.beginFill(0);
			_view.graphics.drawRect(0, 0, _view.stage.stageWidth, _view.stage.stageHeight);
			_view.graphics.endFill();
			
			// layers
			_view.addChild(_gameLayer);
			_view.addChild(_hudLayer);
			
			// pause button
			_hudLayer.addChild(GUI.createButton(10, 10, 26, 26, "||", onPause));
			
			// begin loading xmls
			var xmlLoader:XMLLoader = new XMLLoader();
			xmlLoader.load("actors.xml", onActorsLoaded);
			
			_view.stage.focus = _view.stage;
			
			_actorFactory = new ActorFactory(_view);
		}
		
		private function onActorsLoaded(xml:XML):void
		{
			// create actors!
			for each (var actorXML:XML in xml.actor) {
				var actor:Actor = _actorFactory.addActor(actorXML);
			}
		}
		
		private function onPause(event:MouseEvent):void
		{
			screenManager.dispatch("pause");
		}
		
		override public function update(elapsed:int):void {
			_actorFactory.update(elapsed);
		}
		
		override public function exit():void {
			trace("Ingame exit");
		}
	}
}