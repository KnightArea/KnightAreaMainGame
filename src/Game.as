/**
 * Created by knightaria on 3/12/2017.
 */
package {
import Events.navigationEvent;

import Screens.InGame;

import Screens.Welcome;

import starling.display.Sprite;
import starling.events.Event;


public class Game extends Sprite{

    private var screenWelcome:Welcome;
    private var screenInGame:InGame;


    public function Game() {

        super ();
         this.addEventListener(starling.events.Event.ADDED_TO_STAGE,onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {

        trace("Starling FramWork initialized! ");

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
