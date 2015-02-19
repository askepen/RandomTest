import com.grapefrukt.utils.Toggler;

class Settings 
{
	public static var RANDOM_SEED:UInt		= 404; 
	public static var RANDOM_RAND_SEED:Bool	= true; 

	//Digger
	@range(1,70)	public static var DIGGER_NUMBER				:Int	= 12;	// number of diggers 
	@range(0,1)		public static var DIGGER_TURN_FREQUENCY		:Float	= 0.5;	// percent
	@range(0,1)		public static var DIGGER_SHATTER_FREQUENCY	:Float	= 0.7;	// percent
	@range(0,1)		public static var DIGGER_HOLE_FREQUENCY		:Float	= 0.5;	// percent
	@range(0,1)		public static var DIGGER_PILLAR_FREQUENCY	:Float	= 0.4;	// percent
	@range(1,100)	public static var DIGGER_LIFESPAN_MIN		:Int	= 20;	// max length
	@range(1,100)	public static var DIGGER_LIFESPAN_MAX		:Int	= 30;	// min length
	
	//Map
	public static var MAP_TILES_X:Int 	= 60; // width in tiles
	public static var MAP_TILES_Y:Int	= 60; // height in tiles

}
