package code {
	
	import flash.display.*;
	import Math;

	public class MyTurtle extends Turtle
	{
		public function MyTurtle(	aX:Number=400,
									aY:Number=300,
									aDelay:Number=50,
									aColor:Number=0x000000,
									aWidth:Number=0)
		
		{
			super (aX, aY, aDelay,aColor,aWidth);
		}
		
		public function greenMountain(mLength,mStep,mAngle):void
		{
			this.beginFill(0x59825d,1);
			this.setColor(0x3f4c44);
			this.curveTop(mLength,mStep,mAngle);
			this.setColor(0x59825d);
			this.endFill();
		}
		
		public function frontWaveLoop(absX,absY,lineColor,count):void
		{
			var i:int = 0;
			var shiftX:int = absX;
			var shiftY:int = absY;
			
			while (i < count)
			{
				frontWave(shiftX,shiftY,lineColor);
				shiftX = shiftX + 250;
				i++;
			}
		}
		
		public function frontWave(absX,absY,lineColor):void
		{
			this.absPosition(absX,absY,0);
			this.setColor(lineColor);
			this.curveBottom(10,7,4);
			this.curveTop(10,11,5.85);
			this.curveBottom(10,7,4);
			this.penUp();
			
			this.absPosition(absX+77,absY-20,-25);
			this.curveTop(9,10,6);
			this.curveBottom(8,7,4);
			this.penUp();
			
			this.absPosition(absX+73,absY-17,-15);
			this.curveTop(8,8,6);
			this.curveBottom(7,7,4);
			this.penUp();
			
			this.absPosition(absX+61,absY-10,-15);
			this.curveTop(5,8,6);
			this.curveBottom(4,7,4);
			this.penUp();
		}
		
		public function cloudRenderingTop():void
		{
			this.cloudCover(100,2,40);
			this.endFill();
			this.turnLeft(180);
			this.fwd(120*0.8);
			
			this.cloudCover(150,3,70);
			this.fwd(120);
			this.endFill();
			this.turnLeft(180);
			this.fwd(240);
			
			this.cloudCover(40,2,50);
			this.fwd(100);
			this.endFill();
			this.turnLeft(180);
			this.fwd(150);
			
			this.cloudCover(200,4,50);
			this.fwd(100);
			this.endFill();
			this.turnLeft(180);
			this.fwd(250);
			
			this.cloudCover(300,3,150);
			this.fwd(200);
			this.endFill();
			this.turnLeft(180);
			this.fwd(400);
			
			this.cloudCover(100,2,50);
			this.fwd(300);
			this.endFill();
			this.turnLeft(180);
			this.fwd(400);
			this.turnLeft(1);
			
			this.cloudCover(300,3,50);
			this.fwd(400);
			this.endFill();
		}
		
		public function cloudRenderingSide():void
		{
			this.beginFill(0xe6c290,1);
			this.fwd(650);
			this.turnLeft(90);
			this.fwd(110);
			this.turnLeft(90);
			this.fwd(200);
			this.setColor(0xe6c290);
			this.turnLeft(90);
			this.fwd(70);
			this.turnRight(90);
			this.fwd(1000);
			this.turnLeft(90);
			this.fwd(70);
			this.endFill();
		}
		
		public function cloudRenderingMiddle():void
		{
			this.setColor(0x544735);
			this.beginFill(0xe6c290,1);
			this.curveBottom(60,5,0.5);
			this.fwd(200);
			this.curveTop(60,5,0.5);
			this.setColor(0xe6c290);
			this.turnLeft(92);
			this.fwd(10);
			this.turnLeft(87);
			this.fwd(1400);
			this.turnLeft(87);
			this.fwd(50);
			this.endFill();
		}
		
		public function cloudCover(cloudLength,stepLength,runBack):void
		{
			this.beginFill(0xe6c290,1);
			this.setColor(0x544735);
			
			this.fwd(cloudLength);
			this.curveBottom(stepLength,10,16.35);
			this.fwd(runBack);
			this.setColor(0xE6C290);
			this.fwd(cloudLength);
			
		}
		
		public function mainMountain():void
		{
			this.sameColor(0x212a63);
			this.fwd(200);
			this.curveBottom(9,80,0.5);
			this.turnRight(47);
			this.fwd(100);
			this.turnRight(47);
			this.curveBottom(10,60,0.5);
			this.endFill();
		}
		
		public function mainMountainTop():void
		{
			this.sameColor(0xFFFFFF);
			this.setColor(0x212a63);
			this.curveBottom(9,30,0.5);
			this.turnRight(47);
			this.fwd(96);
			this.turnRight(55);
			
			this.curvedPointRight(14,8,1,10,16,0.5,165,117);
			this.curvedPointRight(8,7,1,7,7,0.5,145,127);
			this.curvedPointLeft(9,12,0.8,8,8,0.8,153,143);
			this.curvedPointLeft(9,12,0.5,7,8,0.5,155,141);
			this.curveTop(12,14,1);
			this.endFill();
		}
		
		public function rectLoop(lineColor,rectColor,rectX,rectY,reps,startSpace,colorStep,R,G,B):void
		{
			var i:int;
			var currentSpace:Number = startSpace;
			
			for (i = 0; i <= reps; i++)
			{
				this.penDown();
				this.setColor(lineColor);
				this.drawRect(rectX,rectY,rectColor,rectColor,0);
				this.penUp();
				this.turnRight(90);
				this.fwd(rectY);
				this.fwd(currentSpace);
				this.turnLeft(90);
				//rectY = rectY * 0.9;
				//currentSpace = currentSpace * 1.1;
				
				if (ColorControl.returnRed(rectColor) + colorStep < R) {
					rectColor = ColorControl.addRed(rectColor, colorStep);
				}
				
				if (ColorControl.returnGreen(rectColor) + colorStep < G) {
					rectColor = ColorControl.addGreen(rectColor, colorStep);
				}
				
				if (ColorControl.returnBlue(rectColor) + colorStep < B) {
					rectColor = ColorControl.addBlue(rectColor, colorStep);
				}
			}
		}//rectLoop()
		
		//function that draws a scalable, rotatable sail boat
		public function ship(startAngle,fillColorB,size,fillColorM,lineColorM,lineWeight):void
		{
			this.shipBody(startAngle,fillColorB,size);
			this.penUp();
			this.turnLeft(180);
			this.fwd(size*0.8);
			this.turnLeft(90);
			this.penDown();
			this.drawRect(size,size*0.1,fillColorM,lineColorM,lineWeight);
			this.penUp();
			this.fwd(size*0.1);
			this.turnRight(90);
			this.fwd(size*0.13);
			this.penDown();
			this.shipSail(size,0xFFFFFF);
		}
		
		//function that draws the ships body
		public function shipBody(startAngle,fillColor,size):void
		{
			this.turnAbs(startAngle);
			
			this.beginFill(fillColor,1);
			
			this.turnRight(30);
			this.fwd(size);
			this.turnLeft(60);
			this.fwd(size);
			this.turnLeft(150);
			this.fwd(size*1.73);
			
			this.endFill();
		}
		
		//function that draws the ships sail
		public function shipSail(size,fillColor):void
		{
			this.beginFill(fillColor,1);
			this.setWidth(1);
			this.setColor(fillColor);
			this.fwd(size*0.9);
			this.turnLeft(135);
			this.fwd(size*1.3);
			this.turnLeft(135);
			this.fwd(size*0.9);
			this.endFill();
		}
		
		public function curvedPointRight(tSideLength,tStep,tStepAngle,bSideLength,bStep,bStepAngle,rightTurn,leftTurn):void
		{
			//d
			this.curveBottom(bSideLength,bStep,bStepAngle);
			this.turnRight(rightTurn);
			//u
			this.curveTop(tSideLength,tStep,tStepAngle);
			this.turnLeft(leftTurn);
		}
		
		public function curvedPointLeft(tSideLength,tStep,tStepAngle,bSideLength,bStep,bStepAngle,rightTurn,leftTurn):void
			{
			//d
			this.curveTop(tSideLength,tStep,tStepAngle);
			this.turnRight(rightTurn);
			//u
			this.curveBottom(bSideLength,bStep,bStepAngle);
			this.turnLeft(leftTurn);
		}
		
		
		
		//function that draws the wave on the way up
		public function curveTop(sideLength,step,stepAngle):void
		{
			var i:int;

			for (i = 0; i < step; i++)
			{
				this.fwd(sideLength);
				this.turnRight(stepAngle);
			}
		}
		
		//function that draws the wave on the way down
		public function curveBottom(sideLength,step,stepAngle):void
		{
			var i:int;
			
			for (i = 0; i <= step; i++)
			{
				this.fwd(sideLength);
				this.turnLeft(stepAngle);
			}
		}
		
		//function that draws a 'circle' from a center point with any radius and number of sides
		public function drawCircle(radius,step,color,opacity,weight):void
		{
			var angle:int;
			var angleConversion:Number;
			var angleRad:Number;
			var angleFinal:Number;
			var sideLength:Number;
			var i:int;
			var end:int = step;
			
			
			angle = ((step-2) * 180 ) / step;
			angleRad = angle * (Math.PI/180);
			angleConversion = Math.sin((180/step) * (Math.PI/180));
			sideLength = 2 * angleConversion * radius;
			
			this.penUp();
			this.fwd(radius);
			this.turnRight(180 - angle/2);
			this.penDown();
			
			this.setColor(color);
			this.setWidth(weight);
			this.beginFill(color,opacity);
			
			for (i = 0; i < end; i++)
			{
				this.fwd(sideLength);
				this.turnRight(179.6-angle);
			}
			
			this.endFill();
		}
		
		//function that draws a rectangle
		public function drawRect(sideX,sideY,fillColor,lineColor,lineWeight):void
			{
			var i:int;
			
			this.beginFill(fillColor,1);
			this.setColor(lineColor);
			this.setWidth(lineWeight);
			
			for (i = 0; i < 2; i++)
			{
				this.fwd(sideX);
				this.turnRight(90);
				this.fwd(sideY);
				this.turnRight(90);
			}
			this.endFill();
		}
		
		//function that draws any equilateral shape
		public function equiShape(shapeNoSides:int,shapeLegLength:int):void
			{
			var i:int;
			var end:int;
			var angle:int;
			
			end = shapeNoSides;
			
			angle = ((shapeNoSides-2) * 180 ) / shapeNoSides; 
			
			for (i = 0; i < end; i++)
			{
				this.fwd(shapeLegLength);
				this.turnLeft(180-angle);
			}
		}
		
		public function absPosition(X,Y,angle):void
		{
			penUp();
			moveAbs(X,Y);
			turnAbs(angle);
			penDown();
		}
		
		public function distanceBetween(moveDirection:Number,moveDistance:Number,endDirection:Number):void
		{
			
			this.penUp();
			this.turnAbs(moveDirection);
			this.fwd(moveDistance);
			this.penDown();
			this.turnAbs(endDirection);
			
		}
		
		public function sameColor(fillColor):void
		{
			this.beginFill(fillColor,1);
			this.setColor(fillColor);
		}
	}
	
}
