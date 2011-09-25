package gameplay 
{
	/**
	 * ...
	 * @author ...
	 */
	public final class Color 
	{
		public static const RED:Color = new Color();	
		public static const BLUE:Color = new Color();
		public static const GREEN:Color = new Color();
		public static const YELLOW:Color = new Color();
		
		private int a_index;
		
		public function Color(int a_index)
		{
			m_index = a_index;
		}
	}

}