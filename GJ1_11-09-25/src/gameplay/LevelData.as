package gameplay 
{
	import net.flashpunk.World;
	
	/**
	 * @author Lucas Cimon
	 */
	public class LevelData extends World
	{
		private var frame:Number;
		private var pp:PowerPlant = new PowerPlant(SheepColor.RED, 40, 50);
		private var sh:Sheep = new Sheep(SheepColor.RED);
		
		public function LevelData() 
		{
		}

		public function init():void
		{
			add(new StraightWire(new IntPoint(100,100), new IntPoint(100,200)));

			//var pp:PowerPlant = new PowerPlant(SheepColor.RED, 40, 50);
			//var sh:Sheep = new Sheep(SheepColor.RED);
			//trace(pp.getPower());
			//pp.recieveSheep(sh);
			//trace(pp.getPower());
			
			pp.x = 300;
			pp.y = 100;
			add(pp);
			
			sh.x = 100;
			sh.y = 100;
			add(sh);
			
			add(new StraightWire(new Point(100, 100), new Point(100, 200)));
			add(new SwitchNode);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}