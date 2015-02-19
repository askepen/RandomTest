import com.haxepunk.Engine;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.grapefrukt.utils.Toggler;

class Main extends Engine
{
	var psrnd:PseudoRandom = new PseudoRandom();
	var t:Toggler;
	
	var newMapMaxTime:Int = 10;
	var newMapTime:Int = 0;
	
	override public function init()
	{
#if debug
		HXP.console.enable();
		t = new Toggler(Settings,true,300);
		t.x = HXP.width - 400;
		this.addChild(t);
#end
		psrnd.seed = Settings.RANDOM_SEED;
		HXP.scene = new MainScene(psrnd);
		
	}
	
	public static function main() { new Main(); }
	
	override public function update():Void
	{
		if ( Input.mousePressed || Input.pressed(Key.SPACE) ) newMap(); 
		
		if ( newMapTime > newMapMaxTime )
		{
			newMap(); 
			newMapTime = 0;
		}
		newMapTime ++;
		
		super.update();
	}
	
	function newMap():Void
	{
		psrnd.seed = Settings.RANDOM_SEED; // set seed as settings says it
		var currD:Float = Date.now().getTime(); //get the number of milliseconds since 1st of jan 1970. This is kinda random
		if(Settings.RANDOM_RAND_SEED) psrnd.seed = Std.int(currD); // set seed to the "kinda random" time 
		
		HXP.console.log([psrnd.seed]);
		
		HXP.scene = new MainScene(psrnd);
	}
}