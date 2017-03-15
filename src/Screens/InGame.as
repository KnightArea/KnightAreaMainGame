/**
 * Created by knightaria on 3/12/2017.
 */
package Screens {
import Objects.Hero;

import starling.display.Image;

import starling.display.Sprite;
import starling.events.Event;


public class InGame extends Sprite{

    private var hero:Hero;
    private var back:Image;

    public function InGame() {
        super ();
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {

        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        drawGame();

    }

    private function drawGame():void {


        back = new Image(Assets.getTexture("back"));
        back.width = stage.stageWidth;
        back.height = stage.stageHeight;
        this.addChild(back);

        hero = new Hero();
        hero.scaleX = .2;
        hero.scaleY = .2;
        hero.x = stage.stageWidth/2;
        hero.y = stage.stageHeight/2;
        this.addChild(hero);

    }

    public function disposeTemporary():void {
        this.visible = false;
        
    }

    public function initialize():void {

        this.visible = true;

    }
}
}
