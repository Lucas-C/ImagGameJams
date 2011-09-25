package 
{
	import gameplay.PowerPlant;
	import gameplay.Sheep;
	import gameplay.SheepColor;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	public class Main extends Engine 
	{
		public function Main():void 
		{
			trace("Hello World!");
			super(400, 300, 60, false);
			FP.screen.scale = 2;
			FP.screen.color = 0xFFFFFFFF;
			FP.world = new MyWorld;
			
			var pp:PowerPlant = new PowerPlant(SheepColor.RED, 40, 50);
			var sh:Sheep = new Sheep(SheepColor.RED);
			trace(pp.getPower());
			pp.recieveSheep(sh);
			trace(pp.getPower());
		}
	}
	
}