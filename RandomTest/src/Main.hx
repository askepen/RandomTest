import com.haxepunk.Engine;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;

class Main extends Engine
{
	var psrnd:PseudoRandom = new PseudoRandom();
	
	override public function init()
	{
#if debug
		HXP.console.enable();
#end
		psrnd.seed = 77;
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
		var currD:Float = Date.now().getTime();
		psrnd.seed = Std.int(currD);
	//	psrnd.seed = 1014;
		
		HXP.scene = new MainScene(psrnd);
	}
}