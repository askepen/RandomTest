class Digger 
{
	public var dugHoles:Array<Array<Int>> = new Array();
	var mapHeight:Int;
	var mapWidth:Int;
	var x:Int;
	var y:Int;
	var lifespan:Int;
	var random:PseudoRandom;
	var dir:Int = 0;
	var turnFreq:Int = 8;
	
	public function new (seed:UInt, w:Int, h:Int, startx:Int, starty:Int) 
	{
		random = new PseudoRandom();
		random.seed = seed;
		
		mapWidth  = w;
		mapHeight = h;
		
		x = startx;
		y = starty;
		
		lifespan = random.nextIntRange(2,20);
	}		
	
	public function dig():Array<Array<Int>>
	{
		dugHoles.push([x,y]);
		
		for(i in 0...lifespan)
		{
			var num:Float = random.nextFloatRange(0,1);
			
			if ( num < 1/turnFreq ) // turn left 
			{
				dir += 90;
			}
			else if ( num < 2/turnFreq ) // turn right 
			{
				dir -= 90;
			}
			
			//correct dircetion
			if ( dir >= 360) dir = 0; 
			else if ( dir < 0) dir = 270; 
			
			//move in direction
			switch (dir)
			{
				case 0:
					x += 1;
				
				case 90:
					y += 1;
				
				case 180:
					x -= 1;
				
				case 270:
					y -= 1;
			}
			
			dugHoles.push([x,y]);
/*			dugHoles.push([x+1,y]);
			dugHoles.push([x,y+1]);
			dugHoles.push([x+1,y+1]);*/
			
			
			//chance to create a 3x3 room
			if (random.nextFloatRange(0,1) < 1/3 && i == lifespan-1)
			{
				dugHoles.push([x-1,y]);
				dugHoles.push([x+1,y]);
				dugHoles.push([x+1,y-1]);
				
				dugHoles.push([x,y-1]);
				dugHoles.push([x,y+1]);
				dugHoles.push([x-1,y+1]);
				
				dugHoles.push([x+-1,y-1]);
				dugHoles.push([x+1,y+1]);
			}
			
		}
		
		return dugHoles;
	}
}
