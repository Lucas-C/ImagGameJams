package gameplay 
{
	/**
	 * @author Lucas Cimon
	 */
	public class LevelData 
	{
		public function LevelData() 
		{
		}

		public function init():void
		{
			var wire:StraightWire = new StraightWire(0,0,0,1);

			var pp:PowerPlant = new PowerPlant(SheepColor.RED, 40, 50);
			var sh:Sheep = new Sheep(SheepColor.RED);
			trace(pp.getPower());
			pp.recieveSheep(sh);
			trace(pp.getPower());
		}

	}

}