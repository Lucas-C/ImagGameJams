package gameplay 
{
	import net.flashpunk.World;
	
	/**
	 * @author Lucas Cimon
	 */
	public class LevelData extends World
	{
		private var frame:Number;
		// Points du level.
		private var pp1:IntPoint = new IntPoint(20, 50);
		private var pp2:IntPoint = new IntPoint(40, 50);
		private var pf:IntPoint = new IntPoint(30, 30);
		private var ps:IntPoint = new IntPoint(30, 40);
		private var pe1:IntPoint  = new IntPoint(20, 40);
		private var pe2:IntPoint = new IntPoint(40, 40);
		
		
		//Nodes du Level.
		private var p1:PowerPlant = new PowerPlant(SheepColor.RED, pp1.x, pp1.y);
		private var p2:PowerPlant = new PowerPlant(SheepColor.BLUE, pp2.x , pp2.y);
		private var f:Farm = new Farm(pf.x, pf.y);
		private var s:SwitchNode = new SwitchNode(ps.x, ps.y);
	
		
		//Fils du Level.
		private var wfs:StraightWire = new StraightWire(pf, ps);
		private var wse1:StraightWire = new StraightWire(ps, pe1);
		private var wse2:StraightWire = new StraightWire(ps, pe2);
		private var we1p1:StraightWire = new StraightWire(pe1, pp1);
		private var we2p2:StraightWire = new StraightWire(pe2, pp2);
		
		public function LevelData() 
		{
		}

		public function init():void
		{
			//add(new StraightWire(new IntPoint(100,100), new IntPoint(100,200)));
			//wg1.ext2 = wg2;
			//wd1.ext2 = wd2;
			//var pp:PowerPlant = new PowerPlant(SheepColor.RED, 40, 50);
			//var sh:Sheep = new Sheep(SheepColor.RED);
			//trace(pp.getPower());
			//pp.recieveSheep(sh);
			//trace(pp.getPower());

			add(p1);
			add(p2);
			add(f);
			add(s);
			wfs.ext1 = f;
			wfs.ext2 = s;
			wse1.ext1 = s;
			wse1.ext2 = we1p1;
			wse2.ext1 = s;
			wse2.ext2 = we2p2;
			we1p1.ext1 = wse1;
			we1p1.ext2 = p1;
			we2p2.ext1 = wse2;
			we2p2.ext2 = p2;
			
			add(wfs);
			add(wse1);
			add(wse2);
			add(we1p1);
			add(we2p2);
			//pp.x = 300;
			//pp.y = 100;
			//add(pp);
			//add (new Farm);
			//
			//add(new SwitchNode);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}