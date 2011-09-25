package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	public class Main extends Engine 
	{
		public function Main():void 
		{
			trace("Hello World!");
			super(800, 500, 60, false);
			FP.world = new MyWorld;
		}	
	}
	
}