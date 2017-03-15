/**
 * Created by knightaria on 3/12/2017.
 */
package {
import flash.display.Bitmap;
import flash.utils.Dictionary;

import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class Assets {

    [Embed(source="../media/graphics/logo.png")]
    public static const logo:Class;

 [Embed(source="../media/graphics/back.jpg")]
    public static const back:Class;

   [Embed(source="../media/graphics/direction.png")]
    public static const AtlasTextureGame:Class;

    [Embed(source="../media/graphics/direction.xml" , mimeType = "application/octet-stream")]
    public static const AtlasXmlGame:Class;

    private static var gameTextures:Dictionary = new Dictionary();
    private static var gameTextureAtlas:TextureAtlas;



    public static function getAltas():TextureAtlas
    {
       if(gameTextureAtlas == null)
       {
           var texture:Texture = getTexture("AtlasTextureGame");
           var xml:XML = XML(new AtlasXmlGame());
           gameTextureAtlas = new TextureAtlas(texture,xml);
       }
        return gameTextureAtlas;
    }

    public static function getTexture(name:String):Texture
    {

        if(gameTextures[name] == undefined)
        {

             var bitmap:Bitmap = new Assets[name]();
            gameTextures[name] = Texture.fromBitmap(bitmap);

        }
        return gameTextures[name];
    }

}
}
