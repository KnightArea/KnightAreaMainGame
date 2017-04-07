package {



import flash.display.Sprite
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Rectangle;

import net.hires.debug.Stats;

import starling.core.Starling;
import starling.core.StatsDisplay;
import managers.core.ScreenManager;

[SWF(width="2736", height="1824", frameRate="60", backgroundColor="#000000")]

public class Main extends Sprite {
    private var testView:Sprite ;




   // private var stats:Stats;
    private var myStarling:Starling;



    public function Main() {

        trace("hi");

        testView = new Sprite();
        testView.graphics.beginFill(0xff0000,0.5);
        testView.graphics.drawRoundRect(0,0,2736,1824,100);
        this.addChild(testView);

      //  stats = new Stats();
     //   this.addChild(stats);

        myStarling = new Starling(Game,stage);
        myStarling.antiAliasing = 1;
        myStarling.start();


        ScreenManager.eventDispatcher.addEventListener(Event.RESIZE,manageStageSize);
        ScreenManager.setUp(stage,2736,1824,NaN);

        stage.addEventListener(MouseEvent.MOUSE_DOWN,manageStageSize);


    }

    private function manageStageSize(e:Event):void
    {
        trace("Manage stage size : "+ScreenManager.scaleFactor)
        if(true)
        {
            root.scaleX = testView.scaleY = ScreenManager.scaleFactor ;
            root.x = ScreenManager.deltaXOnScaleFactor();
            root.y = ScreenManager.deltaYOnScaleFactor();
        }
        else if(false)
        {
            testView.graphics.clear();
            testView.graphics.beginFill(0xff0000,0.5);
            testView.graphics.drawRoundRect(0,0,ScreenManager.stageWidthOnScale(),ScreenManager.stageHeightOnScale(),100);
        }

        myStarling.viewPort = new Rectangle(0,0,ScreenManager.stageWidth,ScreenManager.stageHeight);
        myStarling.stage.stageWidth = ScreenManager.stageWidth ;
        myStarling.stage.stageHeight = ScreenManager.stageHeight ;
    }
}
}
