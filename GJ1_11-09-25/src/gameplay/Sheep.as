package gameplay 
{
	/**
	 * ...
	 * @author ...
	 */
	public class Sheep 
	{
		private var m_color:SheepColor;
		
		public function Sheep(a_color:SheepColor) 
		{
			m_color = a_color;
		}
		
		public function getColor():SheepColor
		{
			return m_color;
		}
	}

}