class Digger 
{
	public var dugHoles:Array<Array<Int>> = new Array();
	var mapHeight:Int;
	var mapWidth:Int;
	var x:Int;
	var y:Int;
	var lifespan:Int = 10;
	var random:PseudoRandom;
	var dir:Int = 0;
	
	public function new (rand:PseudoRandom, w:Int, h:Int, startx:Int, starty:Int) 
	{
		mapWidth  = w;
		mapHeight = h;
		x = startx;
		y = starty;
		random = rand;
	}		
	
	public function dig():Array<Array<Int>>
	{
		for(i in 0...lifespan)
		{
			var num:Float = random.nextFloatRange(0,1);
			
			if ( num < 1/7 ) // turn left 
			{
				dir += 90;
			}
			else if ( num < 2/7 ) // turn right 
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
		}
		
		return dugHoles;
	}
}
