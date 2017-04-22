/**
 * Created by knightaria on 3/12/2017.
 */
package {
import Events.navigationEvent;

import Screens.InGame;

import Screens.Welcome;

import managers.core.ScreenManager;

import starling.display.Sprite;
import starling.events.Event;
import starling.display.Quad;


public class Game extends Sprite{

    private var screenWelcome:Welcome;
    private var screenInGame:InGame;


    public function Game() {

        super ();
        trace("ScreenManager.flashW : "+ScreenManager.flashW);
        trace("ScreenManager.flashH : "+ScreenManager.flashH);
        var qu:Quad = new Quad(ScreenManager.flashW-10,ScreenManager.flashH-10,0x00ff00);
        qu.x = 5;
        qu.y = 5;
        //this.addChild(qu);

        this.addEventListener(starling.events.Event.ADDED_TO_STAGE,onAddedToStage);
        ScreenManager.eventDispatcher.addEventListener(Event.RESIZE,controllSize);
    }

    protected function controllSize(event:Event):void
    {
        trace("Screen size changed for starling : "+ScreenManager.scaleFactor );
        this.scaleX = this.scaleY = ScreenManager.scaleFactor ;
        trace("ScreenManager.deltaXOnScaleFactor() : "+ScreenManager.deltaXOnScaleFactor());
        trace("ScreenManager.deltaYOnScaleFactor() : "+ScreenManager.deltaYOnScaleFactor());
        this.x = ScreenManager.deltaXOnScaleFactor() ;
        this.y = ScreenManager.deltaYOnScaleFactor() ;
    }

    private function onAddedToStage(event:Event):void {

        trace("Starling FramWork initialized! ");
        controllSize(null);
        //Debug return
            //return;

        this.addEventListener(Events.navigationEvent.CHANCHE_SCREEN,onChangeScreen);

        screenInGame = new InGame();
        screenInGame.disposeTemporary();
        this.addChild(screenInGame);

        screenWelcome = new Welcome();
        this.addChild(screenWelcome);
        screenWelcome.initialize();

    }

    private function onChangeScreen(event:navigationEvent):void {

        switch (event.params.id)
        {
            case "Play":
                    screenWelcome.disposeTemporary();
                    screenInGame.initialize();
                break;
        }

    }
}
}
