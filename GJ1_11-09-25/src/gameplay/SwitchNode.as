package gameplay 
{
	/**
	 * ...
	 * @author ur mom
	 */
	
	import gameplay.NetworkElement;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class SwitchNode extends Entity implements NetworkElement 
	{
		public static const UP:int = 0;
		public static const LEFT:int = 1;
		public static const DOWN:int = 2;
		public static const RIGHT:int = 3;
		
		public static const DIRECTIONS_NUMBER:int = 4;
		
		[Embed(source = '../../assets/switchleft.png')] private const PICLEFT:Class;
		[Embed(source = '../../assets/switchright.png')] private const PICRIGHT:Class;
		[Embed(source = '../../assets/switchup.png')] private const PICUP:Class;
		[Embed(source = '../../assets/switchdown.png')] private const PICDOWN:Class;
		
		private var m_picLeft : Image;
		private var m_picRight : Image;
		private var m_picUp : Image;
		private var m_picDown : Image;
		private var m_pictures: Array;
		private var m_direction: int;
		private var m_isPushed: Boolean;
		
		public function SwitchNode() 
		{
			m_isPushed = false;
			m_pictures = new Array(4);
			m_pictures[UP] = new Image(PICUP);
			m_pictures[LEFT] = new Image(PICLEFT);
			m_pictures[DOWN] = new Image(PICDOWN);
			m_pictures[RIGHT] = new Image(PICRIGHT);
			x = 100;
			y = 100;
			setDirection(UP);
		}
		
		public function turnSwitch(): void 
		{
			setDirection((getDirection() + 1) % DIRECTIONS_NUMBER);
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
		}
		
		public function getDirection(): int {
			return m_direction;
		}
	}
}