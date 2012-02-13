package
{
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	[SWF(width="640", height="480", backgroundColor="#FFFFFF")] //Set the size and color of the Flash file	
	public class Subsister extends FlxGame
	{
		public function Subsister()
		{
			super(160, 120, PlayState, 4); 	
		}
	}
}