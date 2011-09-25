package gameplay 
{
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author ur mom
	 */
	public class NetworkElement extends Entity 
	{
		public function getNext(direction:Boolean):NetworkElement
		{
			return null;
		}
		
		/**
		 * @param progression between 0 & 1
		 */
		public function getPos(progression:Number, direction:Boolean):IntPoint
		{
			return null;
		}

		public function getDir(srcElem:NetworkElement):Boolean
		{
			return false;
		}
		
		public function getBehaviour():void
		{
			
		}
		
		public function getProgressionStep():Number
		{
			return 1;
		}
		
		override public function render():void 
		{
			x -= width / 2;
			y -= halfHeight;
			super.render();
			x += halfWidth;
			y += halfHeight;		
		}
	}
	
}