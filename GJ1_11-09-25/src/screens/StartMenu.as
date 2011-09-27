package screens 
{
	import flash.text.Font;
	import flash.text.TextField;
	import gameplay.Farm;
	import gameplay.LevelData;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	/**
	 * ...
	 * @author Kak0
	 */
	public class StartMenu extends World implements MenuObserver
	{
		[Embed(source = '../../assets/menu_pointer.png')] private const POINTER:Class;
		private var m_pointer:Entity;
		private var m_selectedItem:MenuItem;
		private var m_keyUpdateCooldown:int;
		
		public function StartMenu() 
		{
			// Title
			var title:TextEntity = new TextEntity("Electrosheep", 70, 0xEEEE00);
			title.x = (FP.screen.width - title.textWidth) / 2;
			title.y = 0;
			add(title);
			
			// Difficulty
			var difficulty:TextEntity = new TextEntity("Difficulty", 40, 0xEEEE00);
			difficulty.x = (FP.screen.width - difficulty.textWidth) / 2;
			difficulty.y = title.y + title.textHeight + 20;
			add(difficulty);
			
			// Options
			var easy:MenuItem = new MenuItem("Easy", 30, 0x0000EE);
			var common_abs:int = difficulty.x + difficulty.textWidth / 4;
			easy.x = common_abs;
			easy.y = difficulty.y + difficulty.textHeight + 20;
			easy.m_observer = this;
			easy.select();
			add(easy);
			
			var normal:MenuItem = new MenuItem("Normal", 30, 0x00EE00);
			normal.x = common_abs;
			normal.y = easy.y + easy.textHeight;
			normal.m_observer = this;
			add(normal);
			
			var hard:MenuItem = new MenuItem("Hard", 30, 0xEE0000);
			hard.x = common_abs;
			hard.y = normal.y + normal.textHeight;
			hard.m_observer = this;
			add(hard);
			
			// Linking menu items
			easy.m_previous = hard;
			easy.m_next = normal;
			
			normal.m_previous = easy;
			normal.m_next = hard;
			
			hard.m_previous = normal;
			hard.m_next = easy;
			
			// Pointer
			m_selectedItem = easy;
			m_pointer = new Entity();
			m_pointer.addGraphic(new Spritemap(POINTER, 16, 16));
			add(m_pointer);
			m_pointer.x = common_abs - 20;
			m_pointer.y = easy.y + (m_selectedItem.textHeight - 16)/ 2;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (m_keyUpdateCooldown > 0)
			{
				m_keyUpdateCooldown--;
				return;
			}
			
			if (Input.check(Key.DOWN))
			{
				m_selectedItem = m_selectedItem.selectNext();
				m_pointer.y = m_selectedItem.y + (m_selectedItem.textHeight - 16)/ 2;
				m_keyUpdateCooldown = 10;
			}
			else if (Input.check(Key.UP))
			{
				m_selectedItem = m_selectedItem.selectPrevious();
				m_pointer.y = m_selectedItem.y + (m_selectedItem.textHeight - 16)/ 2;
				m_keyUpdateCooldown = 10;
			}
			else if (Input.check(Key.ENTER))
			{
				onMenuValidation(m_selectedItem.m_returnCode);
			}
		}
		
		/* INTERFACE screens.MenuObserver */
		
		public function onMenuValidation(returnCode:int):void 
		{
			FP.world = new LevelData();
		}
	}

}