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
		
		public function LevelData() 
		{
		}

		public function init():void
		{
			var powerplant_ord:int = 200;
			var farm_abs:int = 200;
			var switch_ord:int = 120;
			
			var farm:Farm = new Farm(farm_abs, 0);
			add(farm);
			
			var power1:PowerPlant = new PowerPlant(SheepColor.RED, 30, 60);
			power1.x = 100;
			
			var power2:PowerPlant = new PowerPlant(SheepColor.BLUE, 40, 80);
			power2.x = 300;
			power1.y = power2.y = powerplant_ord;
			
			add(power1);
			add(power2);
			
			var switchnode:SwitchNode = new SwitchNode(farm_abs, switch_ord);
			add(switchnode);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}