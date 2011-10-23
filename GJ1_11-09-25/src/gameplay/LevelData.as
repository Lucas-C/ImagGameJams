package gameplay 
{
	import net.flashpunk.World;
	import net.flashpunk.Sfx;
	import net.flashpunk.FP;
	import screens.GameOver;
	import screens.Victory;

	/**
	 * @author Lucas Cimon
	 */
	public class LevelData extends World
	{
		public static const DIFFICULTY_EASY:int = 0;
		public static const DIFFICULTY_NORMAL:int = 1;
		public static const DIFFICULTY_HARD:int = 2;
		private var m_diffculty:int;
		
		private var m_powerplants:Array = new Array;
		private var m_farms:Array = new Array;
		private var m_switches:Array = new Array;
		private var m_wires:Array = new Array;
		
		private var initialized:Boolean = false;
		
		[Embed(source = '../../assets/music.mp3')] private const MUSIC:Class;
		public var music:Sfx = new Sfx(MUSIC);
		
		public function LevelData(a_difficulty:int) 
		{
			m_diffculty = a_difficulty;
			create_level();
			music.loop();
		}
		
		private function create_level():void
		{
			// Places
			var ord_1:int = 40;
			var ord_2:int = 140;
			var ord_3:int = 240;
			
			var abs_1:int = 40;
			var abs_2:int = 190;
			var abs_3:int = 340;
			
			var point_11:IntPoint = new IntPoint(abs_1, ord_1);
			var point_12:IntPoint = new IntPoint(abs_1, ord_2);
			var point_13:IntPoint = new IntPoint(abs_1, ord_3);
			
			var point_21:IntPoint = new IntPoint(abs_2, ord_1);
			var point_22:IntPoint = new IntPoint(abs_2, ord_2);
			var point_23:IntPoint = new IntPoint(abs_2, ord_3);
			
			var point_31:IntPoint = new IntPoint(abs_3, ord_1);
			var point_32:IntPoint = new IntPoint(abs_3, ord_2);
			var point_33:IntPoint = new IntPoint(abs_3, ord_3);
			
			// Difficulty changes
			
			var color_2:SheepColor;
			var color_3:SheepColor;
			var pop_delay_1:int;
			var pop_delay_2:int;
			var pop_rate:int;
			
			switch(m_diffculty)
			{
				case DIFFICULTY_EASY:
				{
					color_2 = SheepColor.BLUE;
					color_3 = SheepColor.YELLOW;
					
					pop_delay_1 = 240;
					pop_delay_2 = 360;
					pop_rate = 180;
				}
				break;
				
				case DIFFICULTY_NORMAL:
				{
					color_2 = SheepColor.BLUE;
					color_3 = SheepColor.YELLOW;
					
					pop_delay_1 = 180;
					pop_delay_2 = 240;
					pop_rate = 120;
				}
				break;
				
				case DIFFICULTY_HARD:
				{
					color_2 = SheepColor.YELLOW;
					color_3 = SheepColor.BLUE;
					
					pop_delay_1 = 120;
					pop_delay_2 = 180;
					pop_rate = 120;
				}
				break;
			}
			
			// Powerplants
			m_powerplants[0] = new PowerPlant(SheepColor.RED, 80, 100);
			m_powerplants[0].x = abs_1;
			m_powerplants[0].y = ord_1;
			add(m_powerplants[0]);
			
			m_powerplants[1] = new PowerPlant(color_2, 80, 100);
			m_powerplants[1].x = abs_1;
			m_powerplants[1].y = ord_3;
			add(m_powerplants[1]);
			
			m_powerplants[2] = new PowerPlant(color_3, 80, 100);
			m_powerplants[2].x = abs_3;
			m_powerplants[2].y = ord_1;
			add(m_powerplants[2]);
			
			m_powerplants[3] = new PowerPlant(SheepColor.GREEN, 80, 100);
			m_powerplants[3].x = abs_3;
			m_powerplants[3].y = ord_3;
			add(m_powerplants[3]);
			
			// Farms
			m_farms[0] = new Farm(abs_1, ord_2, pop_delay_1, pop_rate);
			add(m_farms[0]);
			
			m_farms[1] = new Farm(abs_3, ord_2, pop_delay_2, pop_rate);
			add(m_farms[1]);
			
			// Switches
			m_switches[0] = new SwitchNode(abs_2, ord_1);
			add(m_switches[0]);
			
			m_switches[1] = new SwitchNode(abs_2, ord_2);
			add(m_switches[1]);
			
			m_switches[2] = new SwitchNode(abs_2, ord_3);
			add(m_switches[2]);
			
			// Wires
			m_wires[0] = new StraightWire(point_11, point_21);
			m_wires[0].ext1 = m_powerplants[0];
			m_wires[0].ext2 = m_switches[0];
			add(m_wires[0]);
			
			m_wires[1] = new StraightWire(point_21, point_31);
			m_wires[1].ext1 = m_switches[0];
			m_wires[1].ext2 = m_powerplants[2];
			add(m_wires[1]);
			
			m_wires[2] = new StraightWire(point_21, point_22);
			m_wires[2].ext1 = m_switches[0];
			m_wires[2].ext2 = m_switches[1];
			add(m_wires[2]);
						
			m_wires[3] = new StraightWire(point_12, point_22);
			m_wires[3].ext1 = m_farms[0];
			m_wires[3].ext2 = m_switches[1];
			add(m_wires[3]);
			
			m_wires[4] = new StraightWire(point_22, point_32);
			m_wires[4].ext1 = m_switches[1];
			m_wires[4].ext2 = m_farms[1];
			add(m_wires[4]);
			
			m_wires[5] = new StraightWire(point_22, point_23);
			m_wires[5].ext1 = m_switches[1];
			m_wires[5].ext2 = m_switches[2];
			add(m_wires[5]);
			
			m_wires[6] = new StraightWire(point_13, point_23);
			m_wires[6].ext1 = m_powerplants[1];
			m_wires[6].ext2 = m_switches[2];
			add(m_wires[6]);
			
			m_wires[7] = new StraightWire(point_23, point_33);
			m_wires[7].ext1 = m_switches[2];
			m_wires[7].ext2 = m_powerplants[3];
			add(m_wires[7]);
			
			// Connecting Wires to Farms and Switches
			m_farms[0].networkElement = m_wires[3];
			m_farms[1].networkElement = m_wires[4];
			
			m_switches[0].addStraightWire(m_wires[0], SwitchNode.LEFT);
			m_switches[0].addStraightWire(m_wires[1], SwitchNode.RIGHT);
			
			m_switches[1].addStraightWire(m_wires[2], SwitchNode.UP);
			m_switches[1].addStraightWire(m_wires[5], SwitchNode.DOWN);
			
			m_switches[2].addStraightWire(m_wires[6], SwitchNode.LEFT);
			m_switches[2].addStraightWire(m_wires[7], SwitchNode.RIGHT);
			
			initialized = true;
		}
		
		private function allPowered():Boolean
		{
			for each(var pp:PowerPlant in m_powerplants)
			{
				if (!pp.isPowered())
				{
					return false;
				}
			}
			
			return true;
		}
		
		private function allUnpowered():Boolean
		{
			for each(var pp:PowerPlant in m_powerplants)
			{
				if (!pp.hasNoPower())
				{
					return false;
				}
			}
			
			return true;
		}
		
		override public function update():void
		{
			super.update();
			if (!initialized)
			{
				return;
			}
			
			// Victory test
			if (allPowered())
			{
				FP.world =  new Victory;
			}
			
			// Defeat test
			if (allUnpowered())
			{
				FP.world = new GameOver;
			}
		}
	}
}