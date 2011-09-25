package 
{
	import gameplay.LevelData;
	import gameplay.PowerPlant;
	import gameplay.Sheep;
	import gameplay.SheepColor;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	public class Main extends Engine 
	{
		public function Main():void 
		{
			super(400, 300, 60, false);
			FP.screen.scale = 2;
			FP.screen.color = 0xFFFFFFFF;
			FP.world = new MyWorld;
			var level:LevelData = new LevelData;
			level.init();
		}
	}
	
}