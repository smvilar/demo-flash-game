package screens
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import game.Actor;
	import game.ActorFactory;
	
	import screenmanager.Screen;
	
	import utils.GUI;
	import utils.XMLLoader;
	
	public class IngameScreen extends Screen
	{
		private var _view:Sprite = new Sprite;
		private var _hudLayer:Sprite = new Sprite;
		private var _gameLayer:Sprite = new Sprite;
		
		private var _actors:Vector.<Actor> = new Vector.<Actor>;
		
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
			_hudLayer.addChild(GUI.createButton(10, 10, 20, 20, "||", onPause));
			
			// begin loading xmls
			var xmlLoader:XMLLoader = new XMLLoader();
			xmlLoader.load("actors.xml", onActorsLoaded);
			
			_view.stage.focus = _view.stage;
		}
		
		private function onActorsLoaded(xml:XML):void
		{
			// create actors!
			var actorFactory:ActorFactory = new ActorFactory();
			for each (var actorXML:XML in xml.actor) {
				var actor:Actor = actorFactory.parseXML(actorXML);
				actor.addTo(_gameLayer);
				_actors.push(actor);
			}
		}
		
		private function onPause(event:MouseEvent):void
		{
			screenManager.dispatch("pause");
		}
		
		override public function update(elapsed:int):void {
			for each (var actor:Actor in _actors) {
				actor.update(elapsed);
			}
		}
		
		override public function exit():void {
			trace("Ingame exit");
		}
	}
}