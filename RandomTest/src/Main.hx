import com.haxepunk.Engine;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;
import com.grapefrukt.utils.Toggler;

class Main extends Engine
{
	var psrnd:PseudoRandom = new PseudoRandom();
	var t:Toggler;
	
	override public function init()
	{
#if debug
		HXP.console.enable();
		t = new Toggler(Settings,true,700);
		this.addChild(t);
#end
		psrnd.seed = Settings.RANDOM_SEED;
		HXP.scene = new MainScene(psrnd);
		
	}
	
	public static function main() { new Main(); }
	
	override public function update():Void
	{
		if ( Input.mousePressed ) newMap(); 
		super.update();
	}
	
	function newMap():Void
	{
		psrnd.seed = Settings.RANDOM_SEED;
		var currD:Float = Date.now().getTime();
		if(Settings.RANDOM_RAND_SEED) psrnd.seed = Std.int(currD); // set seed to seconds since 1st of jan 1970
		
		HXP.scene = new MainScene(psrnd);
	}
}