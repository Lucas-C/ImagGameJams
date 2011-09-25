package gameplay 
{
	/**
	 * ...
	 * @author ur mom
	 */
	
	import gameplay.NetworkElement;
	import gameplay.StraightWire;
	import gameplay.IntPoint;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Key;
	
	public class SwitchNode extends NetworkElement 
	{
		public static var nodesNumber:int = 1;
		public static const UP:int = 0;
		public static const LEFT:int = 1;
		public static const DOWN:int = 2;
		public static const RIGHT:int = 3;
		
		
		public static const DIRECTIONS_NUMBER:int = 4;
		
		[Embed(source = '../../assets/switchleft.png')] private const PICLEFT:Class;
		[Embed(source = '../../assets/switchright.png')] private const PICRIGHT:Class;
		[Embed(source = '../../assets/switchup.png')] private const PICUP:Class;
		[Embed(source = '../../assets/switchdown.png')] private const PICDOWN:Class;
		

		
		[Embed(source = '../../assets/turnswitch.mp3')] private const SOUNDSWITCH:Class;
		public var soundswitch:Sfx = new Sfx(SOUNDSWITCH);
		
		private var m_picLeft : Image;
		private var m_picRight : Image;
		private var m_picUp : Image;
		private var m_picDown : Image;
		private var m_pictures: Array;
		private var m_straightsWires: Array;
		private var m_direction: int;
		private var m_isPushed: Boolean;
		private var m_id: int;
		
		public function SwitchNode(switchx: int = 0, switchy: int  = 0) 
		{
			m_id = nodesNumber;
			nodesNumber++;
			x = switchx;
			y = switchy;
			m_isPushed = false;
			m_pictures = new Array(4);
			m_pictures[UP] = new Image(PICUP);
			m_pictures[LEFT] = new Image(PICLEFT);
			m_pictures[DOWN] = new Image(PICDOWN);
			m_pictures[RIGHT] = new Image(PICRIGHT);
			m_straightsWires = new Array(4);
			var i: int;
			for (i = 0; i < 4; i++) {
				m_straightsWires[i] = null;
			}
			setDirection(UP);
		}
		
		public function turnSwitch(): void 
		{
			var i: int;
			i = 1;
			while (i < 4 && m_straightsWires[(i + getDirection()) % 4] == null) {
				i++;
			}

			setDirection((getDirection() + i) % DIRECTIONS_NUMBER);
			soundswitch.play();
		}
		
		public function setDirection(direction: int): void
		{
			m_direction = direction;
			graphic = m_pictures[direction];
			setHitbox(m_pictures[direction].width, m_pictures[direction].height, x, y);
		}
		
		override public function update():void
		{
			if (Input.mouseDown) {
				if (!m_isPushed) {
					if (Input.mouseX >= this.x 
						&& Input.mouseX <= this.x + this.width
						&& Input.mouseY >= this.y
						&& Input.mouseY <= this.y + this.height) {
						m_isPushed = true;
						turnSwitch();
					}
				}
			}
			if (Input.mouseUp) {
				m_isPushed = false;
			}
			if (Input.check(Key.NUMPAD_1) && m_id == 1)
				turnSwitch();
			if (Input.check(Key.NUMPAD_2) && m_id == 2)
				turnSwitch();
			if (Input.check(Key.NUMPAD_3) && m_id == 3)
				turnSwitch();
			if (Input.check(Key.NUMPAD_4) && m_id == 4)
				turnSwitch();
			if (Input.check(Key.NUMPAD_5) && m_id == 5)
				turnSwitch();
			if (Input.check(Key.NUMPAD_6) && m_id == 6)
				turnSwitch();
			if (Input.check(Key.NUMPAD_7) && m_id == 7)
				turnSwitch();
			if (Input.check(Key.NUMPAD_8) && m_id == 8)
				turnSwitch();
			if (Input.check(Key.NUMPAD_9) && m_id == 9)
				turnSwitch();
		}
		
		public function getDirection(): int {
			return m_direction;
		}
		
		public function addStraightWire(sw : StraightWire, direction : int): void {
			if (direction < 0 || direction > 3) {
				trace("In SwitchNode.addStraightWire: direction must be between 0 and 3");
			}
			if (m_straightsWires[direction] != null) {
				trace("In SwitchNode.addStraightWire: this direction already has a straightwire associated, it will be erased");
			}
			m_straightsWires[direction] = sw;
			setDirection(direction);
		}
		
		public function getStraightWire(direction : int): StraightWire {
			return m_straightsWires[direction];
		}
		
		public override function getNext(direction:Boolean):NetworkElement
		{
			return getStraightWire(m_direction);
		}
		
		public override function getPos(progression:Number, direction:Boolean):IntPoint
		{
			return new IntPoint(x + halfWidth, y + halfHeight);
		}
		
		public override function getDir(srcElem:NetworkElement):Boolean
		{
			return true;
		}
	}
}