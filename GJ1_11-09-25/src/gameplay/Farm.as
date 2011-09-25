package gameplay 
{
	
	import gameplay.NetworkElement;
	import gameplay.IntPoint;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Sfx;
	public class Farm extends NetworkElement
	{
		[Embed(source = '../../assets/popSheep.mp3')] private const SOUNDPOP:Class;
		public var soundpop:Sfx = new Sfx(SOUNDPOP);
		
		private static const FARMLAYER:int = 4;
		
		[Embed(source = '../../assets/farm.png')] private const FARM:Class;
		public var m_anim:Spritemap = new Spritemap(FARM, 64, 64);
		private const sheepPopStep:Number = 0.005;
		private var m_progression:Number = 0;
		public var networkElement: NetworkElement;
		private var m_isGroing: Boolean = false;
		
		public function Farm(a_x:int , a_y:int) 
		{
			layer = FARMLAYER;
			x = a_x;
			y = a_y;
			this.setHitbox(m_anim.width, m_anim.height, x, y);
			m_anim.add("plop", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], 10, true);
			m_anim.play("plop");
			graphic = m_anim;
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
			if (!m_isGroing && m_anim.scale > 1) {
				m_anim.scale -= 0.07;
			}
			if (m_isGroing) {
				m_anim.scale += 0.07;
				if (m_anim.scale > 1.5)
					m_isGroing = false;
			}
			this.setHitbox(m_anim.scaledWidth, m_anim.scaledHeight, x, y);
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
			p.x = x * (1 - progression) + networkElement.x * progression;
			p.y = y * (1 - progression) + networkElement.y * progression;
			return p;
		}

		public override function getDir(srcElem:NetworkElement):Boolean 
		{
			return true;
		}
		
		

	}

}