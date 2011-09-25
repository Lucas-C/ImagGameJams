package gameplay 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
	/**
	 * @author Lucas Cimon
	 */
	public class StraightWire extends Entity implements NetworkElement
	{
		/**
		 * Ext1 boundary
		 */
		public var ext1:NetworkElement = null;

		/**
		 * Ext2 boundary
		 */
		public var ext2:NetworkElement = null;

		/**
		 * X position of the Ext1 boundary
		 */
		public var posExt1:Point;
		
		/**
		 * X position of the Ext2 boundary
		 */
		public var posExt2:Point;
		
		/**
		 * Constructor
		 */
		public function StraightWire(pos1:Point, pos2:Point) 
		{
			this.posExt1 = pos1;
			this.posExt2 = pos2;
			super(posExt1.x, posExt1.y);
			if (posExt1.x == posExt2.x)
				if (posExt1.y == posExt2.y)
					throw new Error("Null StraightWire");
				else 
					this.graphic = Image.createRect(1, Math.abs(posExt2.y - posExt1.y), 0xFF000000);
			else if (posExt1.y == posExt2.y)
					this.graphic = Image.createRect(Math.abs(posExt2.x - posExt1.x), 1, 0xFF000000);
			else
				throw new Error("Non flat StraightWire");
		}
		
		/**
		 * Access next wire in given direction
		 * @param direction true for progression ext1 -> ext2. Modified by method.
		 */
		public function getNext(direction:Boolean):NetworkElement
		{
			return null;
		}
		
		public function getPos(progression:Number, direction:Boolean):Point
		{
			return new Point;
		}
	}
}