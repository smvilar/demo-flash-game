package game
{
	public class ActorFactory
	{
		public function parseXML(xml:XML):Actor {
			var type:String = xml.@type;
			switch (type) {
				case "player":
					return new Player(xml);
				case "enemyA":
					return new EnemyA(xml);
				case "enemyB":
					return new EnemyB(xml);
			}
			return null;
		}
	}
}