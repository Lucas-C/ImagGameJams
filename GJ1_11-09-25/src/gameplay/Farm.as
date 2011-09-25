package gameplay 
{
	
	import gameplay.NetworkElement;

	public class Farm implements NetworkElement
	{
		private var m_networkElement: NetworkElement;
		
		public function Farm() 
		{
			
		}
		
		public function getNext(direction:Boolean):NetworkElement
		{
			return m_networkElement;
		}
		
		public function getPos(progression:Number, direction:Boolean):Point
		{
			return null;
		}

		public function getDir(srcElem:NetworkElement):Boolean 
		{
			return true;
		}
	}

}