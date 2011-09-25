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
		
		private static const FARMLAYER:int = 4;
		private static const FARMSTEP:Number = 0.5;
		
		[Embed(source = '../../assets/farm.png')] private const FARM:Class;
		private const sheepPopStep:Number = 0.005;
		private var m_progression:Number = 0;
		public var networkElement: NetworkElement;
		private var m_image:Image;
		private var m_isGroing: Boolean = false;
		
		public function Farm(a_x:int , a_y:int) 
		{
			layer = FARMLAYER;
			x = a_x;
			y = a_y;
			m_image = new Image(FARM);
			this.setHitbox(m_image.width, m_image.height, x, y);
			this.setHitbox(m_image.scaledWidth, m_image.scaledHeight, x, y);
			
			graphic = m_image;
		}
		
		override public function getProgressionStep():Number 
		{
			return FARMSTEP;
		}
		
		public override function getNext(direction:Boolean):NetworkElement
		{
			return networkElement;
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
		
		public function popSheep():void
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
			p.x = x;
			p.y = y;
			return p;
		}

		public override function getDir(srcElem:NetworkElement):Boolean 
		{
			return true;
		}
		
		

	}

}