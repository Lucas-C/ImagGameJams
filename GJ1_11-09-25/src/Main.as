package 
{
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
		}
	}
	
}