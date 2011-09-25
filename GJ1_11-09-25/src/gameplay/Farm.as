package gameplay 
{
	
	import gameplay.NetworkElement;
	import gameplay.IntPoint;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	public class Farm extends NetworkElement
	{
		[Embed(source = '../../assets/popSheep.mp3')] private const SOUNDPOP:Class;
		public var soundpop:Sfx = new Sfx(SOUNDPOP);
		
		[Embed(source = '../../assets/farm.png')] private const FARM:Class;
		private const sheepPopStep:Number = 0.005;
		private var m_progression:Number = 0;
		private var m_networkElement: NetworkElement;
		private var m_image:Image;
		private var m_isGroing: Boolean = false;
		
		public function Farm(a_x:int , a_y:int) 
		{
			x = a_x;
			y = a_y;
			m_image = new Image(FARM);
			this.setHitbox(m_image.width, m_image.height, x, y);
			graphic = m_image;
		}
		
		public override function getNext(direction:Boolean):NetworkElement
		{
			return m_networkElement;
		}
		
	    override public function update():void 
		{
			m_progression += sheepPopStep;
			if (m_progression >= 1.0) {
				m_progression = 0;
				popSheep();
			}
			if (!m_isGroing && m_image.scale > 1) {
				m_image.scale -= 0.07;
			}
			if (m_isGroing) {
				m_image.scale += 0.07;
				if (m_image.scale > 1.5)
					m_isGroing = false;
			}
			this.setHitbox(m_image.scaledWidth, m_image.scaledHeight, x, y);
			super.update();
		}
		
		private function popSheep():void
		{
			var sh:Sheep;
			var rand:int = Math.random() * 4;
			var color:SheepColor = new SheepColor(rand);
			sh = new Sheep(color, this);
			FP.world.add(sh);
			soundpop.play();
			m_isGroing = true;
		}
		
		
		public override function getPos(progression:Number, direction:Boolean):IntPoint
		{
			var p:IntPoint = new IntPoint;
			p.x = x * (1 - progression) + m_networkElement.x * progression;
			p.y = y * (1 - progression) + m_networkElement.y * progression;
			return p;
		}

		public override function getDir(srcElem:NetworkElement):Boolean 
		{
			return true;
		}
		
		

	}

}