import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.Entity;
import com.haxepunk.utils.Input;
import com.haxepunk.graphics.Image;

class MainScene extends Scene
{
	var random:PseudoRandom;
	
	//map details:
	var holes:Array<Array<Int>> = new Array(); //generate a 2D array
	var tilesX:Int;
	var tilesY:Int;
	var playerSpawnX:Int;
	var playerSpawnY:Int;
	
	public function new(rand:PseudoRandom)
	{
		random = rand;
		super();
	}
	
	public override function begin()
	{
		caves();
	}
	
	/**
	*  digs out caves based on seed
	*/
	function caves():Void
	{
		tilesX = Settings.MAP_TILES_X;
		tilesY = Settings.MAP_TILES_Y;
		
	 	//populate the array with 1's 
	 	for (j in 0...tilesY) 
		{
			holes.push(new Array());
			for (i in 0...tilesX) holes[j].push(0);
		}
		
		//Spawn diggers and dig
		for ( i in 0...Settings.DIGGER_NUM_OF_DIGGERS )
		{
			digger();
		}
			
		//Spawn entities, where applicable 
		for (j in 0...tilesY) 
			for (i in 0...tilesX)
				if ( holes[j][i] == 1 )
					add(new Entity(i*32,j*32,new Image("graphics/tile.png")));
			
	}
	
	function digger():Void
	{
		playerSpawnX = Math.round(tilesX/2);
		playerSpawnY = Math.round(tilesY/2);
		
		var d:Digger = new Digger(random.nextInt(), tilesX, tilesY, playerSpawnX, playerSpawnY);
		var arr:Array<Array<Int>> = d.dig();
		
		for (i in 0...arr.length)
			holes[ arr[i][1] ] [ arr[i][0] ] = 1;
	}
	
	
	/**
	*  generates tiles in random places, based on the seed
	*/
	function basicRandomTiles():Void
	{
		for (i in 0...Math.round(HXP.width/32)) 
		{
			for (j in 0...Math.round(HXP.height/32)) 
			{
				var visBool = random.nextFloatRange(0,1);
				//1 in 3 chance to spawn a tile
				if ( visBool < 1/3 )
				{
					var e:Entity = new Entity(i*32,j*32,new Image("graphics/tile.png"));
					add(e);
				}
			}
		}	
	}
}