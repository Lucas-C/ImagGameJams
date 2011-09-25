package gameplay 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
	/**
	 * @author Lucas Cimon
	 */
	public class StraightWire extends Entity
	{

		/**
		 * X position of the Ext1 boundary
		 */
		public var xExt1:Number = 0;
		
		/**
		 * Y position of the Ext1 boundary
		 */
		public var yExt1:Number = 0;

		/**
		 * X position of the Ext2 boundary
		 */
		public var xExt2:Number = 0;
		
		/**
		 * Y position of the Ext2 boundary
		 */
		public var yExt2:Number = 0;

		[Embed(source = '../../assets/switchleft.png')] private const PAF:Class;

		/**
		 * Constructor
		 */
		public function StraightWire(xExt1_:int, yExt1_:int, xExt2_:int, yExt2_:int) 
		{
			this.xExt1 = xExt1_;
			this.yExt1 = yExt1_;
			this.xExt2 = xExt2_;
			this.yExt2 = yExt2_;
			super(xExt1, yExt1);
			if (xExt1 == xExt2)
				if (yExt1 == yExt2)
					throw new Error("Null StraightWire");
				else 
					this.graphic = Image.createRect(1, Math.abs(yExt2 - yExt1), 0xFF000000);
			else if (yExt1 == yExt2)
					this.graphic = Image.createRect(Math.abs(xExt2 - xExt1), 1, 0xFF000000);
			else
				throw new Error("Non flat StraightWire");
		}
	}
}