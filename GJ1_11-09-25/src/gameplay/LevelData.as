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
			level_2();
		}
		
		private function level_1():void
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
			
			wire_switch_power1_1.ext1 = switchnode;
			wire_switch_power1_1.ext2 = wire_switch_power1_2;
			
			wire_switch_power1_2.ext1 = wire_switch_power1_1;
			wire_switch_power1_2.ext2 = power1;
			
			wire_switch_power2_1.ext1 = switchnode;
			wire_switch_power2_1.ext2 = wire_switch_power2_2;
			
			wire_switch_power2_2.ext1 = wire_switch_power2_1;
			wire_switch_power2_2.ext2 = power2;
			
			switchnode.addStraightWire(wire_switch_power1_1, SwitchNode.LEFT);
			switchnode.addStraightWire(wire_switch_power2_1, SwitchNode.RIGHT);
		}
		
		private function level_2():void
		{
			var ord_1:int = 20;
			var ord_2:int = 120;
			var ord_3:int = 220;
			
			var abs_1:int = 20;
			var abs_2:int = 170;
			var abs_3:int = 320;
			
			var point_11:IntPoint = new IntPoint(abs_1, ord_1);
			var point_12:IntPoint = new IntPoint(abs_1, ord_2);
			var point_13:IntPoint = new IntPoint(abs_1, ord_3);
			
			var point_21:IntPoint = new IntPoint(abs_2, ord_1);
			var point_22:IntPoint = new IntPoint(abs_2, ord_2);
			var point_23:IntPoint = new IntPoint(abs_2, ord_3);
			
			var point_31:IntPoint = new IntPoint(abs_3, ord_1);
			var point_32:IntPoint = new IntPoint(abs_3, ord_2);
			var point_33:IntPoint = new IntPoint(abs_3, ord_3);
			
			// Powerplants
			var power_1:PowerPlant = new PowerPlant(SheepColor.RED, 30, 60);
			power_1.x = abs_1;
			power_1.y = ord_1;
			add(power_1);
			
			var power_2:PowerPlant = new PowerPlant(SheepColor.BLUE, 30, 60);
			power_2.x = abs_1;
			power_2.y = ord_3;
			add(power_2);
			
			var power_3:PowerPlant = new PowerPlant(SheepColor.YELLOW, 30, 60);
			power_3.x = abs_3;
			power_3.y = ord_1;
			add(power_3);
			
			var power_4:PowerPlant = new PowerPlant(SheepColor.GREEN, 30, 60);
			power_4.x = abs_3;
			power_4.y = ord_3;
			add(power_4);
			
			// Farms
			var farm_1:Farm = new Farm(abs_1, ord_2);
			add(farm_1);
			
			var farm_2:Farm = new Farm(abs_3, ord_2);
			add(farm_2);
			
			// Switches
			var switch_1:SwitchNode = new SwitchNode(abs_2, ord_1);
			add(switch_1);
			
			var switch_2:SwitchNode = new SwitchNode(abs_2, ord_2);
			add(switch_2);
			
			var switch_3:SwitchNode = new SwitchNode(abs_2, ord_3);
			add(switch_3);
			
			// Wires
			var wire_1:StraightWire = new StraightWire(point_11, point_21);
			wire_1.ext1 = power_1;
			wire_1.ext2 = switch_1;
			add(wire_1);
			
			var wire_2:StraightWire = new StraightWire(point_21, point_31);
			wire_2.ext1 = switch_1;
			wire_2.ext2 = power_2;
			add(wire_2);
			
			var wire_3:StraightWire = new StraightWire(point_21, point_22);
			wire_3.ext1 = switch_1;
			wire_3.ext2 = switch_2;
			add(wire_3);
			
			var wire_3:StraightWire = new StraightWire(point_21, point_22);
			wire_3.ext1 = switch_1;
			wire_3.ext2 = switch_2;
			add(wire_3);
			
			var wire_4:StraightWire = new StraightWire(point_12, point_22);
			wire_4.ext1 = farm_1;
			wire_4.ext2 = switch_2;
			add(wire_4);
			
			var wire_5:StraightWire = new StraightWire(point_22, point_23);
			wire_5.ext1 = switch_2;
			wire_5.ext2 = farm_2;
			add(wire_5);
			
			var wire_6:StraightWire = new StraightWire(point_22, point_32);
			wire_6.ext1 = switch_2;
			wire_6.ext2 = switch_3;
			add(wire_6);
			
			var wire_7:StraightWire = new StraightWire(point_32, point_31);
			wire_7.ext1 = switch_3;
			wire_7.ext2 = power_3;
			add(wire_7);
			
			var wire_8:StraightWire = new StraightWire(point_32, point_33);
			wire_8.ext1 = switch_3;
			wire_8.ext2 = power_4;
			add(wire_8);
			
			// Connecting Wires to Farms and Switches
			farm_1.networkElement = wire_4;
			farm_2.networkElement = wire_5;
			
			switch_1.addStraightWire(wire_1, SwitchNode.LEFT);
			switch_1.addStraightWire(wire_2, SwitchNode.RIGHT);
			
			switch_2.addStraightWire(wire_3, SwitchNode.UP);
			switch_2.addStraightWire(wire_6, SwitchNode.DOWN);
			
			switch_3.addStraightWire(wire_7, SwitchNode.LEFT);
			switch_3.addStraightWire(wire_8, SwitchNode.RIGHT);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}