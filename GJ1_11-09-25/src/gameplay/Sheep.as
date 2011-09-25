package gameplay 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	/**
	 * ...
	 * @author ...
	 */
	public class Sheep extends Entity 
	{
		[Embed(source = '../../assets/mouton.png')] private const MOUTON:Class;
		private const STEP:Number = 0.01;
		private var m_color:SheepColor;
		private var m_image:Image;
		private var m_currentWire:NetworkElement;
		private var m_id:int = -1;
		private var m_direction:Boolean = true;
		private var m_progression:Number = 0;
		
		public function Sheep(a_id:int, a_color:SheepColor, a_currentWire:NetworkElement) 
		{
			m_id = a_id;
			m_color = a_color;
			m_image = new Image(MOUTON);
			m_image.color = m_color.getCode();
			graphic = m_image;
		}
		
		override public function update():void 
		{
			m_progression+=STEP;
			if (m_progression >= 1.0) {
				if (m_currentWire != null) {
					var m_precWire:NetworkElement = m_currentWire;
					m_progression = 0;
					m_currentWire.getNext(m_direction);
					if (m_currentWire != null)
						m_direction = m_currentWire.getDir(m_precWire);
				} else {
					// Destruction du mouton à l'arrivee a la centrale
					FP.world.remove(this);
					//FP.world.SheepArray.splice(m_id, 1); 
				}
			}
			super.update();
		}
		
		override public function render():void 
		{
			var xy:Point = m_currentWire.getPos(m_progression, m_direction);
			x = xy.x;
			y = xy.y;
			//var prog1:int;
			//var prog2:int;
			//if (m_direction) {
				//prog1 = 1 - m_progression;
				//prog2 = m_progression;
			//} else {
				//prog1 = m_progression;
				//prog2 = 1 - m_progression;
			//}
			//var sumx:int = m_currentWire.xExt1 + m_currentWire.xExt2;
			//var sumy:int = m_currentWire.yExt1 + m_currentWire.yExt2;
			//
			//x = (m_currentWire.xExt1 * prog1 + m_currentWire.xExt2 * prog2) / sumx;
			//y = (m_currentWire.yExt1 * prog1 + m_currentWire.yExt2 * prog2) / sumy;
			super.render();
		}
		
		public function getColor():SheepColor
		{
			return m_color;
		}
	}

}