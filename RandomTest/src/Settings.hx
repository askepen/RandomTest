import com.grapefrukt.utils.Toggler;

class Settings 
{
	public static var RANDOM_SEED:UInt			 = 1024; 
	public static var RANDOM_RAND_SEED:Bool		 = false; 

	//Digger
	@range(1,100)public static var DIGGER_TURN_FREQUENCY:Int = 100;
	@range(1,100)public static var DIGGER_NUM_OF_DIGGERS:Int = 10;
	
	//Map
	public static var MAP_TILES_X:Int		 = 43;
	public static var MAP_TILES_Y:Int		 = 31; 

}
