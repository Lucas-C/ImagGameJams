package gameplay 
{
	import net.flashpunk.World;
	
	/**
	 * @author Lucas Cimon
	 */
	public class LevelData extends World
	{
		private var frame:Number;
		private var pp:PowerPlant = new PowerPlant(SheepColor.RED, 40, 50);
		
		public function LevelData() 
		{
		}

		public function init():void
		{
			var powerplant_ord:int = 150;
			var farm_abs:int = 200;
			var switch_ord:int = 100;
			
			var farm:Farm = new Farm(farm_abs, 20);
			add(farm);
			
			var power1:PowerPlant = new PowerPlant(SheepColor.RED, 30, 60);
			power1.x = 60;
			
			var power2:PowerPlant = new PowerPlant(SheepColor.BLUE, 40, 80);
			power2.x = power1.x + 200;
			power1.y = power2.y = powerplant_ord;
			
			add(power1);
			add(power2);
			
			var switchnode:SwitchNode = new SwitchNode(farm_abs, switch_ord);
			add(switchnode);
			
			var wire_farm_switch:StraightWire = new StraightWire(new IntPoint(farm.x, farm.y), new IntPoint(switchnode.x, switchnode.y));
			add(wire_farm_switch);
			
			var inter_point_1:IntPoint = new IntPoint(power1.x, switch_ord);
			var wire_switch_power1_1:StraightWire = new StraightWire(new IntPoint(switchnode.x, switchnode.y), inter_point_1);
			add(wire_switch_power1_1);
			var wire_switch_power1_2:StraightWire = new StraightWire(inter_point_1, new IntPoint(power1.x, power1.y));
			add(wire_switch_power1_2);
			
			var inter_point_2:IntPoint = new IntPoint(power2.x, switch_ord);
			var wire_switch_power2_1:StraightWire = new StraightWire(new IntPoint(switchnode.x, switchnode.y), inter_point_2);
			add(wire_switch_power2_1);
			var wire_switch_power2_2:StraightWire = new StraightWire(inter_point_2, new IntPoint(power2.x, power2.y));
			add(wire_switch_power2_2);
			
			farm.networkElement = wire_farm_switch;
			wire_farm_switch.ext1 = farm;
			wire_farm_switch.ext2 = switchnode;
			
			wire_switch_power1_1.ext1 = wire_farm_switch;
			wire_switch_power1_1.ext2 = wire_switch_power1_2;
			
			wire_switch_power1_2.ext1 = wire_switch_power1_1;
			wire_switch_power1_2.ext2 = power1;
			
			wire_switch_power2_1.ext1 = switchnode;
			wire_switch_power2_1.ext2 = wire_switch_power2_2;
			
			wire_switch_power2_2.ext1 = wire_switch_power2_1;
			wire_switch_power2_2.ext2 = power2;
			switchnode.addStraightWire(wire_farm_switch, SwitchNode.UP);
			switchnode.addStraightWire(wire_switch_power1_1, SwitchNode.LEFT);
			switchnode.addStraightWire(wire_switch_power2_1, SwitchNode.RIGHT);
			farm.popSheep();
		}	
		
		override public function update():void
		{
			super.update();
		}
	}
}