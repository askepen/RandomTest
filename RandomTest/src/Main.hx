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
		HXP.scene = new MainScene();
		
		var currD:Float = Date.now().getTime();
		psrnd.seed = 100;//Std.int(currD);
		
	}
	
	public static function main() { new Main(); }
	
	override public function update():Void
	{
		if(Input.mousePressed)
		{
			
			
			HXP.console.log([psrnd.seed, psrnd.nextInt()]);
		}
		
		super.update();
	}
}