package gameplay 
{
	
	import gameplay.NetworkElement;
	import net.flashpunk.graphics.Image;

	public class Farm extends NetworkElement
	{
		[Embed(source = '../../assets/farm.png')] private const FARM:Class;
		private const sheepPopStep:Number = 0.05;
		private var m_progression:Number = 0;
		private var m_networkElement: NetworkElement;
		private var m_image:Image;
		
		public function Farm() 
		{
			m_image = new Image(FARM);
			graphic = m_image;
		}
		
		public override function getNext(direction:Boolean):NetworkElement
		{
			return m_networkElement;
		}
		
	    override public function update():void 
		{
			
			super.update();
		}
		
		public override function getPos(progression:Number, direction:Boolean):IntPoint
		{
			p:IntPoint = new IntPoint;
			p.x = x * (1 - progession) + m_networkElement.x * progression;
			p.y = y * (1 - progression) + m_networkElement.y * progression;
			return ;
		}

		public override function getDir(srcElem:NetworkElement):Boolean 
		{
			return true;
		}
	}

}