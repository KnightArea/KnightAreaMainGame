/**
 * Created by knightaria on 3/12/2017.
 */
package Screens {
import Events.navigationEvent;

import com.greensock.TweenLite;

import starling.display.Image;
import starling.display.Sprite;
import starling.events.EnterFrameEvent;
import starling.events.Event;


public class Welcome extends Sprite {


    private var logo:Image;
    public static var cunt:int = 0;

    public function Welcome() {
        super();
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {
        trace("welcom screeninitialized!");

        drawScreen();

    }

    private function drawScreen():void {

        logo = new Image(Assets.getTexture("logo"));
        logo.scaleX = 0.2;
        logo.scaleY = 0.2;
        this.addChild(logo);
        logo.x = -logo.width;
        logo.y = 150;

    }

    public function initialize():void
    {
        this.visible = true;

        logo.x = -logo.width;
        logo.y = 150;

        TweenLite.to(logo,2,{x:200});

        this.addEventListener(Event.ENTER_FRAME,logoAnimation);

    }

    private function logoAnimation(event:Event):void {

        var currentDate:Date = new Date();
        logo.y = 100 + (Math.cos(currentDate.getTime() * 0.002) * 25);
        cunt++;
        if(cunt == 400)
        {
           //this.visible = false;
            this.dispatchEvent(new navigationEvent(navigationEvent.CHANCHE_SCREEN,{id:"Play"}, true));
        }

    }

    public function disposeTemporary():void {
        this.visible = false;

        if(this.hasEventListener(Event.ENTER_FRAME)) this.removeEventListener(Event.ENTER_FRAME,logoAnimation);


    }
}
}
