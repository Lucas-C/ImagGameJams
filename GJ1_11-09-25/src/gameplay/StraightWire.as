package gameplay 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
	/**
	 * @author Lucas Cimon
	 */
	public class StraightWire extends NetworkElement
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
		public var posExt1:IntPoint;
		
		/**
		 * X position of the Ext2 boundary
		 */
		public var posExt2:IntPoint;
		
		/**
		 * Constructor
		 */
		public function StraightWire(pos1:IntPoint, pos2:IntPoint) 
		{
			this.posExt1 = pos1;
			this.posExt2 = pos2;
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
		 * @param direction true for progression ext1 -> ext2
		 */
		public override function getNext(direction:Boolean):NetworkElement
		{
			if (direction)
				return ext2;
			else
				return ext1;
		}
		
		public override function getPos(progression:Number, direction:Boolean):IntPoint
		{
			if (direction)
				return new IntPoint(	posExt1.x + (posExt2.x - posExt1.x) * progression,
									posExt1.y + (posExt2.y - posExt1.y) * progression);
			else
				return new IntPoint(	posExt2.x + (posExt1.x - posExt2.x) * progression,
									posExt2.y + (posExt1.y - posExt2.y) * progression);
		}

		public override function getDir(srcElem:NetworkElement):Boolean
		{
			if (srcElem == ext1)
				return true;
			else if (srcElem == ext2)
				return false;
			else
				throw new Error("StraightWire.getDir - Invalid jonction");
		}
	}
}