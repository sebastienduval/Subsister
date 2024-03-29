package
{
	import org.flixel.*;
	
	public class MenuState extends FlxState
	{
		override public function create():void
		{
			FlxG.bgColor = 0xFF000000;
			var t:FlxText;
			t = new FlxText(0, FlxG.height/2-20, FlxG.width, "Subsister");
			t.size = 20;
			t.alignment = "center";
			add(t);
						
			t = new FlxText(FlxG.width/2-100,FlxG.height-30,200,"click to start");
			t.size = 16;
			t.alignment = "center";
			add(t);
			
			FlxG.mouse.show();
		}
		
		override public function update():void
		{
			super.update();
			
			if(FlxG.mouse.justPressed())
			{
				FlxG.switchState(new PlayState());
			}
		}
	}
}