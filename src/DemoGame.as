package
{
	import flash.display.Sprite;
	
	import screenmanager.ScreenManager;
	
	import screens.*;
	
	[SWF(width="640", height="480")]
	public class DemoGame extends Sprite
	{
		public function DemoGame() {
			var screenMgr:ScreenManager = new ScreenManager(this);
			screenMgr.registerScreen("MainMenu", MainMenuScreen);
			screenMgr.registerScreen("Ingame", IngameScreen);
			screenMgr.registerScreen("Pause", PauseScreen);
			
			screenMgr.addTransition("MainMenu", "Ingame", "play");
			screenMgr.addTransition("Ingame", "Pause", "pause");
			screenMgr.addTransition("Pause", "Ingame", "resume");
			screenMgr.addTransition("Pause", "MainMenu", "quit");
			
			screenMgr.start("MainMenu");
		}
	}
}