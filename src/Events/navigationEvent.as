/**
 * Created by knightaria on 3/12/2017.
 */
package Events {
import starling.events.Event;


public class navigationEvent extends Event{

    public static const CHANCHE_SCREEN:String = "changeScreen";
    public var params:Object;


    public function navigationEvent(type:String,_params:Object = null , bubbles:Boolean =false) {
        super (type,bubbles);

        this.params = _params;
    }
}
}
