package gameplay 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Kak0
	 */
	public class PowerPlant extends Entity
	{
		[Embed(source = '../../assets/powerplant.png')] private const POWERPLANT:Class;
		[Embed(source = '../../assets/explosion2.png')] private static const EXPLOSION:Class;
		
		private var m_power:int;
		private var m_min_power:int;
		private var m_max_power:int;
		
		private var m_color:SheepColor;
		private var m_image:Image;
		private static var m_explosion_image:Image = new Image(EXPLOSION);
		
		private static var m_color_power:Array = null;
		
		public function PowerPlant(a_color:SheepColor, a_min_power:int, a_max_power:int) 
		{
			m_power = 0;
			m_min_power = a_min_power;
			m_max_power = a_max_power;
			m_color = a_color;
			
			m_image = new Image(POWERPLANT);
			m_image.color = m_color.getCode();
			m_image.scale = 0.5;
			graphic = m_image;
			
			if (m_color_power == null)
			{
				var red:Array = new Array(20, -20, -10, 10);
				var blue:Array = new Array(-20, 20, 10, -10);
				var green:Array = new Array(-10, 10, 20, -20);
				var yellow:Array = new Array(10, -10, -20, 20);
				m_color_power = new Array(red, blue, green, yellow);
			}
		}
		
		public function receiveSheep(a_sheep:Sheep):void
		{
			var power:int = m_color_power[a_sheep.getColor().getIndex()][m_color.getIndex()];
			increasePower(power);
		}
		
		public function increasePower(a_power:int):void
		{
			m_power += a_power;
		}
		
		public function getPower():int
		{
			return m_power;
		}
	}

}