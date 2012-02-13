package
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		private var level:FlxTilemap;
		private var player:FlxSprite;		
		
		[Embed(source="../Assets/Tiles/DesertTileset.png")]
		private var desertTileset:Class;
		
		[Embed(source="../Assets/Characters/Adam/Idle.png")]
		private var adam:Class;		
		
		override public function create():void
		{
			FlxG.bgColor = 0xFF7777FF;
			
			var i:int;
			/*
			var data:Array = new Array();
			for ( i = 0; i < 40 * 30; i ++ )
			{
				data.push(0);
			}
			
			level = new FlxTilemap();
			level.loadMap(FlxTilemap.arrayToCSV(data,40), desertTileset, 8, 8, FlxTilemap.OFF, 0, 0, 1);
			add(level);	
			*/
			
			var data2:Array = new Array();
			for ( i = 0; i < 40 * 30; i ++ )
			{
				var r:Number = Math.random();
				var v:int = 2;
				if ( r < 0.8 )
				{
					v = 0;
				}
				else if ( r < 0.9 )
				{
					v = 1;
				}
				
				data2.push(v);
			}			
			
			var level2:FlxTilemap = new FlxTilemap();
			level2.loadMap(FlxTilemap.arrayToCSV(data2,40), desertTileset, 8, 8, FlxTilemap.OFF, 0, 1, 1);
			add(level2);				
			
			player = new FlxSprite(6, 12);
			player.loadGraphic(adam, true, false, 8, 16); 
			player.addAnimation("run", new Array(1, 2), 6, true);
			player.addAnimation("walk", new Array(0, 1, 0, 2), 6, true);			
			player.play("walk");
			player.maxVelocity.x = 80;
			player.maxVelocity.y = 80;
			player.drag.x = player.maxVelocity.x*4;
			player.drag.y = player.maxVelocity.y*4;
			player.height = 4;
			player.offset = new FlxPoint(0, 12);
			add(player);
			
			FlxG.mouse.show();
		}
		
		override public function update():void
		{
			super.update();
						
			player.acceleration.x = 0;
			player.acceleration.y = 0;
			
			if(FlxG.keys.LEFT)
			{
				player.acceleration.x = -player.maxVelocity.x*4;
			}
			else if(FlxG.keys.RIGHT)
			{
				player.acceleration.x = player.maxVelocity.x*4;	
			}
			else if(FlxG.keys.UP)
			{
				player.acceleration.y = -player.maxVelocity.y*4;
			}
			else if(FlxG.keys.DOWN)
			{
				player.acceleration.y = player.maxVelocity.y*4;	
			}
			
			function PrintCollision(a:FlxBasic, b:FlxBasic):void
			{
				if ( a is FlxTilemap )
				{
					var tilemap:FlxTilemap = (a as FlxTilemap);
					trace(tilemap.x + " " + tilemap.y);
				}
				
				if ( b is FlxSprite )
				{
					var sprite:FlxSprite = (b as FlxSprite);
					trace(sprite.x + " " + sprite.y);
					trace(sprite.isTouching(FlxObject.LEFT));
					trace(sprite.isTouching(FlxObject.RIGHT));
					trace(sprite.isTouching(FlxObject.UP));
					trace(sprite.isTouching(FlxObject.DOWN));					
				}
			}
			
			FlxG.collide(level, player, PrintCollision);			
		}
	}
}