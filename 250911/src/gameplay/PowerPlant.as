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
		private var m_color:int;
		
		public function PowerPlant(Color a_color, int a_min_power, int a_max_power) 
		{
			m_power = 0;
			m_min_power = a_min_power;
			m_max_power = a_max_power;
			m_color = a_color;
		}
		
		public function recieveSheep(Sheep a_sheep)
		{
			
		}
	}

}