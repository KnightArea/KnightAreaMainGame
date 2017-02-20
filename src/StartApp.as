/**
 * Created by knightaria on 2/20/2017.
 */
package {
import flash.display.Bitmap;
import starling.core.Starling;
import starling.display.Image;
import starling.display.Sprite;
import starling.textures.Texture;



public class StartApp extends Sprite {

    [Embed(source="assets/flag.png")]

    public static const Labrique:Class;
    public var bitmap:Bitmap;
    public var textur:Texture;
    public var image:Image;

    public function StartApp() {

        bitmap = new Labrique();
        textur = Texture.fromBitmap(bitmap);
        image = new Image(textur);
        image.width = Starling.current.nativeStage.stageWidth;
        image.scaleY= image.scaleX;
        addChild(image);





    }


}
}
