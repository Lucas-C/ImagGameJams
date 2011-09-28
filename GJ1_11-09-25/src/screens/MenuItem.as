package screens 
{
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author Kak0
	 */
	public class MenuItem extends TextEntity 
	{		
		public var m_previous:MenuItem;
		public var m_next:MenuItem;
		public var m_returnCode:int;
		
		private var m_isSelected:Boolean = false;
		
		public function MenuItem(a_text:String, a_size:int, a_color:int, a_x:int = 0, a_y:int = 0) 
		{
			super(a_text, a_size, a_color, a_x, a_y);
		}
		
		public function select():void
		{
			m_isSelected = true;
		}
		
		public function selectNext():MenuItem
		{
			if (m_next != null)
			{
				m_isSelected = false;
				m_next.select();
			}
			
			return m_next;
		}
		
		public function selectPrevious():MenuItem
		{
			if (m_previous != null)
			{
				m_isSelected = false;
				m_previous.select();
			}
			
			return m_previous;
		}
	}
}