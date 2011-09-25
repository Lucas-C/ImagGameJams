package gameplay 
{
	/**
	 * ...
	 * @author Kak0
	 */
	public class PowerPlant 
	{
		private var m_power:int;
		private var m_min_power:int;
		private var m_max_power:int;
		private var m_color:SheepColor;
		private static var m_color_scores:Array = null;
		
		public function PowerPlant(a_color:SheepColor, a_min_power:int, a_max_power:int) 
		{
			m_power = 0;
			m_min_power = a_min_power;
			m_max_power = a_max_power;
			m_color = a_color;
			
			if (m_color_scores == null)
			{
				var red:Array = new Array(20, -20, -10, 10);
				var blue:Array = new Array(-20, 20, 10, -10);
				var green:Array = new Array(-10, 10, 20, -20);
				var yellow:Array = new Array(10, -10, -20, 20);
				m_color_scores = new Array(red, blue, green, yellow);
			}
		}
		
		public function recieveSheep(a_sheep:Sheep):void
		{
			var score:int = m_color_scores[a_sheep.getColor().getIndex()][m_color.getIndex()];
			increasePower(score);
		}
		
		public function increasePower(a_score:int):void
		{
			m_power += a_score;
		}
		
		public function getPower():int
		{
			return m_power;
		}
	}

}