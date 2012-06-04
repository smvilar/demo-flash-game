package game
{
	import flash.display.DisplayObjectContainer;

	public class ActorFactory
	{
		private var _actors:Vector.<Actor> = new Vector.<Actor>;
		private var _parent:DisplayObjectContainer;
		
		private var _player:Player;
		
		public function ActorFactory(parent:DisplayObjectContainer) {
			_parent = parent;
		}
		
		public function addActor(xml:XML):Actor {
			const type:String = xml.@type;
			var actor:Actor;
			switch (type) {
				case "player":
					actor = new Player(xml);
					_player = actor as Player;
					break;
				case "enemyA":
					actor = new EnemyA(xml);
					break;
				case "enemyB":
					actor = new EnemyB(xml);
					break;
				case "enemyC":
					actor = new EnemyC(xml);
					(actor as EnemyC).player = _player;
					break;
			}
			if (actor) {
				actor.addTo(_parent);
				_actors.push(actor);
			}
			return actor;
		}
		
		public function update(elapsed:int):void {
			for each (var actor:Actor in _actors) {
				if (actor != _player) {
					actor.checkCollision(_player);
				}
				actor.update(elapsed);
			}
		}
	}
}