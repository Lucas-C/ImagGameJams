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

		/**
		 * Constructor
		 */
		public function StraightWire(xExt1_:int, yExt1_:int, xExt2_:int, yExt2_:int) 
		{
			this.xExt1 = xExt1_;
			this.yExt1 = yExt1_;
			this.xExt2 = xExt2_;
			this.yExt2 = yExt2_;
			//this._pipe = Image.createRect(Math.abs(yExt1 - xExt1), Math.abs(yExt2 - xExt2));
			super(xExt1, yExt1/*, _pipe*/);
		}

		// StraighWire information.
		/** @private */ internal var _pipe:Graphic;
	}
}