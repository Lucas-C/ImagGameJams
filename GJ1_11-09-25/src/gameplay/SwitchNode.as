package gameplay 
{
	/**
	 * ...
	 * @author ur mom
	 */
	
	import gameplay.NetworkElement;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class SwitchNode extends Entity implements NetworkElement 
	{
		[Embed(source = '../../assets/switchleft.png')] private const PICLEFT:Class;
		[Embed(source = '../../assets/switchright.png')] private const PICRIGHT:Class;
		[Embed(source = '../../assets/switchup.png')] private const PICUP:Class;
		[Embed(source = '../../assets/switchdown.png')] private const PICDOWN:Class;
		private var m_picLeft : Image;
		private var m_picRight : Image;
		private var m_picUp : Image;
		private var m_piDown : Image;
		public function SwitchNode() 
		{
			m_picLeft = new Image(PICLEFT);
			
			graphic = m_picLeft;
		}
		
	}

}