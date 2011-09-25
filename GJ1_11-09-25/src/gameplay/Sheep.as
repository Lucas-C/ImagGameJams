package gameplay 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	/**
	 * ...
	 * @author ...
	 */
	public class Sheep extends Entity 
	{
		[Embed(source = '../../assets/mouton.png')] private const MOUTON:Class;
		
		private var m_color:Color;
		private var m_image:Image;
		
		public function Sheep(a_color:Color) 
		{
			m_color = a_color;
			graphic = new Image(MOUTON);
		}
		
		public function getColor():Color
		{
			return m_color;
		}
	}

}