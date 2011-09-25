package gameplay 
{
	import net.flashpunk.World;
	
	/**
	 * @author Lucas Cimon
	 */
	public class GameOver extends World
	{
		override public function update():void
		{
			super.update();
			add(new EndSheep(true));
		}
	}

}