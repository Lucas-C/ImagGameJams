package gameplay 
{
	import gameplay.SwitchNode;
	import net.flashpunk.World;
	/**
	 * @author Lucas Cimon
	 */
	public class LevelData extends World
	{
		public function LevelData() 
		{
		}

		public function init():void
		{
			add(new StraightWire(100,100,100,200));

			//var pp:PowerPlant = new PowerPlant(SheepColor.RED, 40, 50);
			//var sh:Sheep = new Sheep(SheepColor.RED);
			//trace(pp.getPower());
			//pp.recieveSheep(sh);
			//trace(pp.getPower());
			//add (new SwitchNode);
		}

	}

}