import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class MainScene extends Scene
{
	var random:PseudoRandom;
	
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
	*  
	*/
	function caves():Void
	{

//Make the map
		var holes:Array<Array<Int>> = new Array(); //generate a 2D array
		var tilesX = 21; // Math.round(HXP.width/32)
		var tilesY = 21; // Math.round(HXP.height/32)
	 	
	 	//populate the array with 1's 
	 	for (j in 0...tilesY) 
		{
			holes.push(new Array());
			for (i in 0...tilesX) holes[j].push(1);
		}
		
//Spawn diggers
		var d:Digger = new Digger(random, tilesX, tilesY, 10, 10);
		var arr:Array<Array<Int>> = d.dig();
		
		for (i in 0...arr.length-1)
		{
			holes[ arr[i][0] ] [ arr[i][1] ] = 0;
		}
	
//spawn entities
		for (j in 0...tilesY) 
			for (i in 0...tilesX)
				if ( holes[j][i] == 1 )
					add(new Entity(i*32,j*32,new Image("graphics/tile.png")));
				
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