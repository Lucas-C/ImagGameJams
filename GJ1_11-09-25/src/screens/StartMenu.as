package screens 
{
	import flash.geom.Point;
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
	public class StartMenu extends World
	{
		[Embed(source = '../../assets/menu_pointer.png')] private const POINTER:Class;
		private var m_items:Array;
		
		private var m_pointer:Entity;
		private var m_selectedItem:MenuItem;
		
		private var m_lastMouseCoordinates:Point;
		private var m_keyUpdateCooldown:int;
		
		public function StartMenu() 
		{
			// Title
			var title:TextEntity = new TextEntity("Elektrosheep", 70, 0xEEEE00);
			title.x = (FP.screen.width - title.textWidth) / 2;
			title.y = 0;
			add(title);
			
			// Difficulty
			var difficulty:TextEntity = new TextEntity("Difficulty", 40, 0xEEEE00);
			difficulty.x = (FP.screen.width - difficulty.textWidth) / 2;
			difficulty.y = title.y + title.textHeight + 20;
			add(difficulty);
			
			// Options
			var easy:MenuItem = new MenuItem(	LevelData.DIFFICULTY_EASY,
												"Easy", 30, 0x0000EE
											);
			var common_abs:int = difficulty.x + difficulty.textWidth / 4;
			easy.x = common_abs;
			easy.y = difficulty.y + difficulty.textHeight + 20;
			easy.isSelected = true;
			add(easy);
			
			var normal:MenuItem = new MenuItem(	LevelData.DIFFICULTY_NORMAL,
												"Normal", 30, 0x00EE00);
			normal.x = common_abs;
			normal.y = easy.y + easy.textHeight;
			add(normal);
			
			var hard:MenuItem = new MenuItem(	LevelData.DIFFICULTY_HARD,
												"Hard", 30, 0xEE0000);
			hard.x = common_abs;
			hard.y = normal.y + normal.textHeight;
			add(hard);
			
			// Linking menu items
			easy.previous = hard;
			easy.next = normal;
			
			normal.previous = easy;
			normal.next = hard;
			
			hard.previous = normal;
			hard.next = easy;
			
			// Put all items into an array
			m_items = new Array(easy, normal, hard);
			
			// Pointer
			m_selectedItem = easy;
			m_pointer = new Entity();
			m_pointer.addGraphic(new Spritemap(POINTER, 16, 16));
			add(m_pointer);
			m_pointer.x = common_abs - 20;
			m_pointer.y = easy.y + (m_selectedItem.textHeight - 16) / 2;
			
			// Other inits
			m_lastMouseCoordinates = new Point();
		}
		
		private function updatePointer():void
		{
			m_pointer.y = m_selectedItem.y + (m_selectedItem.textHeight - 16)/ 2;
		}
		
		private function selectItem(a_item:MenuItem)
		{
			m_selectedItem.isSelected = false;
			m_selectedItem = a_item;
			m_selectedItem.isSelected = true;
			updatePointer();
		}
		
		private function selectItemUnderMouse():Boolean
		{
			for each(var item:MenuItem in m_items)
			{
				if (item.isPointOnItem(Input.mouseX, Input.mouseY))
				{
					selectItem(item);
					return true;
				}
			}
			
			return false;
		}
		
		private function choiceValidated():void
		{
			FP.world = new LevelData(m_selectedItem.returnCode);
		}
		
		override public function update():void 
		{
			super.update();
			
			// Managing mouse
			
			// If the user clicks on an item, we select it and validate the choice
			if (Input.mousePressed && selectItemUnderMouse())
			{
				choiceValidated();
				return;
			}
			
			// Else, if the mouse moved, we select the item under the mouse
			if (m_lastMouseCoordinates.x != Input.mouseX
				|| m_lastMouseCoordinates.y != Input.mouseY)
			{
				selectItemUnderMouse();
				m_lastMouseCoordinates.x = Input.mouseX;
				m_lastMouseCoordinates.y = Input.mouseY;
				return;
			}
			
			// Managing keyboard
			// Note that we only look at the keyboard events if the mouse stays still
			
			// Wait for the cooldown to finish
			if (m_keyUpdateCooldown > 0)
			{
				m_keyUpdateCooldown--;
				return;
			}
			
			// If an arrow is pressed, we select the appropriate item
			// If the ENTER key is pressed, we validate the choice
			if (Input.check(Key.DOWN))
			{
				m_selectedItem = m_selectedItem.selectNext();
				m_keyUpdateCooldown = 10;
			}
			else if (Input.check(Key.UP))
			{
				m_selectedItem = m_selectedItem.selectPrevious();
				m_keyUpdateCooldown = 10;
			}
			else if (Input.check(Key.ENTER))
			{
				choiceValidated();
			}
			else // No interesting event, the pointer doesn't need to move
			{
				return;
			}
			
			// Moves the pointer to its new position
			updatePointer();
		}
	}

}