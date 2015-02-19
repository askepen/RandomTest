import com.haxepunk.HXP;

class Digger 
{
	public var dugHoles:Array<Array<Int>> = new Array();
	var mapHeight:Int;
	var mapWidth:Int;
	var x:Int;
	var y:Int;
	var lifespan:Int;
	var random:PseudoRandom;
	var dir:Int;
	var turnFreq:Float;
	
	public function new (seed:UInt, w:Int, h:Int, startx:Int, starty:Int) 
	{
		random = new PseudoRandom();
		random.seed = seed;
		
		turnFreq = Settings.DIGGER_TURN_FREQUENCY;
		
		mapWidth  = w;
		mapHeight = h;
		
		x = startx;
		y = starty;
		
		dir = Math.round(random.nextFloatRange(0,3)) * 90;
		
		lifespan = random.nextIntRange(Settings.DIGGER_LIFESPAN_MIN , Settings.DIGGER_LIFESPAN_MAX);
	}		
	
	public function dig():Array<Array<Int>>
	{
		dugHoles.push([x,y]);
		
		for(i in 0...lifespan)
		{
			//set chances
			var turnChance:Float 	= random.nextFloatRange(0,1);
			var shatterChance:Float = random.nextFloatRange(0,1);
			var endHoleChance:Float	= random.nextFloatRange(0,1);
			var pillarChance:Float	= random.nextFloatRange(0,1);
			
			if ( turnChance < turnFreq / 2) // turn left 
				dir += 90;
			
			else if ( turnChance < turnFreq ) // turn right 
				dir -= 90;
			
			//correct dircetion
			if ( dir >= 360) dir = 0; 
			else if ( dir < 0) dir = 270; 
			
			//move in direction if it doesn't go outside the map bounds
			switch (dir)
			{
				case 0:
					if (x + 1 < mapWidth-1)  x += 1;
				
				case 90:
					if (y + 1 < mapHeight-1) y += 1;
				
				case 180:
					if (x - 1 > 1) x -= 1;
				
				case 270:
					if (y - 1 > 1) y -= 1;
			}
			
			// chance to create a 3x3 room if it's journey has ended
			if (endHoleChance < Settings.DIGGER_HOLE_FREQUENCY && i == lifespan-1)
			{
				dugHoles.push([x-1	,y]);
				dugHoles.push([x+1	,y]);
				dugHoles.push([x+1	,y-1]);
				
				dugHoles.push([x	,y-1]);
				dugHoles.push([x	,y+1]);
				dugHoles.push([x-1	,y+1]);
					
				dugHoles.push([x-1	,y-1]); 	
				dugHoles.push([x+1	,y+1]);
				
				if (pillarChance < 1 - Settings.DIGGER_PILLAR_FREQUENCY) dugHoles.push([x,y]); // chance to spawn a pillar
			}
			else //push the array 
			{
				
				if (shatterChance < Settings.DIGGER_SHATTER_FREQUENCY / 2)
				{	
					dugHoles.push([x+1,	y]);
					dugHoles.push([x,	y+1]);
					dugHoles.push([x+1,	y+1]);
				}
				else if (shatterChance < Settings.DIGGER_SHATTER_FREQUENCY)
				{	
					dugHoles.push([x-1,	y]);
					dugHoles.push([x,	y-1]);
					dugHoles.push([x-1,	y-1]);
				}
				dugHoles.push([x,y]);
			}
			
		}
		
		return dugHoles;
	}
}
