package gameplay 
{
	/**
	 * ...
	 * @author ...
	 */
	public final class Color 
	{
		public static const RED:Color = new Color(0);	
		public static const BLUE:Color = new Color(1);
		public static const GREEN:Color = new Color(2);
		public static const YELLOW:Color = new Color(3);
		
		private int m_index;
		
		public function Color(int a_index)
		{
			m_index = a_index;
		}
		
		public function getIndex():int
		{
			return m_index;
		}
	}

}