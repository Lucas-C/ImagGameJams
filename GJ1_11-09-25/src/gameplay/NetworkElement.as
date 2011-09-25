package gameplay 
{
	
	/**
	 * ...
	 * @author ur mom
	 */
	public interface NetworkElement 
	{
		function getNext(direction:Boolean):NetworkElement;
		
		/**
		 * @param progression between 0 & 1
		 */
		function getPos(progression:Number, direction:Boolean):Point;

		function getDir(srcElem:NetworkElement):Boolean;
	}
	
}