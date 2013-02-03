package code {
	
	import flash.display.MovieClip;
	//import Math;
	
	
	public class Main extends MovieClip {
		
		public var t:MyTurtle;

		
		public function Main() {
			// constructor code
		
			t = new MyTurtle(0,0,0);
			addChild(t);


			t.absPosition(0,0,0);
			t.rectLoop(0x212a63,0x212a63,1200,2,150,0,3,238,238,221);

			//Mountain
			t.absPosition(0,430,-6);
			t.mainMountain();
	
			//Mountain Top
			t.absPosition(624,268,-31);
			t.mainMountainTop();

			//Water Gradient
			t.absPosition(1200,800,180);
			t.rectLoop(0x9f9cbc,0x9f9cbc,1200,2.7,130,0,1,238,238,221);


			//Water Gradient Mask
			t.absPosition(0,500,0);
			t.sameColor(0x59825d);
			t.fwd(75);
			t.curveTop(20,65,0.2);
			t.turnLeft(103);
			t.fwd(221);
			t.turnLeft(90);
			t.fwd(1450);
			t.turnLeft(90);
			t.fwd(100);
			
			//Cloud work
			t.absPosition(1200,240,180);
			t.cloudRenderingTop();
			
			t.setColor(0x544735);
			t.absPosition(650,373,180);
			t.cloudRenderingSide();
			
			t.absPosition(200,462,0);
			t.cloudCover(400,2.5,200);
			t.endFill();
			
		
			t.absPosition(400,443,0);
			t.cloudRenderingMiddle();
			
			//green mountains
			t.absPosition(230,470,-40);
			t.greenMountain(12,17,5);
			t.distanceBetween(160,40,-40);
			t.greenMountain(12,17,5);
			t.distanceBetween(-7,500,-40);
			t.greenMountain(12,17,5);
			t.distanceBetween(-182,330,-40);
			t.greenMountain(12,17,5);
			t.distanceBetween(-182,330,-40);
			t.greenMountain(12,17,5);
			t.distanceBetween(-180,330,-40);
			t.greenMountain(12,17,5);
			
			
			t.absPosition(190,483,0);
			t.beginFill(0xe6c290,1);
			t.cloudCover(200,2,170);
			t.endFill();
			
		
			t.absPosition(200,469,0);
			t.cloudCover(20,1,20);
			t.endFill();
			
			//Wave work
			t.frontWaveLoop(-75,680,0xb7b6e5,6);
			t.frontWaveLoop(0,720,0x8f8ebc,6);
			t.frontWaveLoop(-125,760,0x6a6995,6);// 2f3974
			t.frontWaveLoop(0,800,0x2f3974,6);


			t.hideTurtle();
		}
	}
	
}
