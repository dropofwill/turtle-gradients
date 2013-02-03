package code
{
	import flash.display.*;
	import flash.geom.*;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;

	//required for the Point class used track position of turtle

	// The Turtle class extends Shape to implement a pShape.graphics pen that accepts intuitive
	// commands like fwd (forward) and turnLeft.
	public class Turtle extends Sprite
	{
		private const DEGRAD = Math.PI / 180;//constant to convert degree to radians
		private var pTimer:Timer; //controls drawing
		private var pShape:Shape;// display object for graphics
		private var pTurtle:Shape;// on screen turtle
		private var pPos:Point;// keeps track of position of turtle, our pShape.graphics pen
		private var pAngle:Number;// orientation of turtle in degrees
		private var pPen:Boolean;// true for drawing, false to move without trace
		private var pWidth:Number;// width in pixels of pen stroke
		private var pColor:Number;// color in hex of pen stroke
		private var pList:Array;// list of lines to be drawn
		private var colors:Array;//colors to change to
		private var widths:Array;//
		private var delayOn:Boolean = true; // if false, it all happens instantaneously

		// constructor for Turtle requires x and y parameters for initial position
		//accepts optional parameters for color and line width
		// The constructor initializes properties and moves pen to coordinates anX, aY
		public function Turtle(aX:Number, aY:Number, aDelay:Number=500, aColor:Number= 0x0000FF, aWidth:Number=1)
		{
			pShape = new Shape( );
			pTurtle = new Shape();
			addEventListener(Event.ADDED, addMyChildren);
			pShape.graphics.lineStyle(aWidth, aColor);
			pPos = new Point(aX,aY);
			pPen = true;
			pAngle = 0;
			pWidth = aWidth;
			pColor = aColor;
			colors = new Array();
			widths = new Array();
			pShape.graphics.moveTo(pPos.x, pPos.y);
			 
			if (aDelay <= 0) delayOn = false;
			pTimer = new Timer(aDelay);
			pTimer.addEventListener(TimerEvent.TIMER, doTimer);
			pTimer.start( );
			
			pList = new Array( );
			pTurtle.x = aX;
			pTurtle.y = aY;
			drawTurtle( );
		}

		private function drawTurtle( )
		{
			with (pTurtle.graphics)
			{
				clear();
				beginFill(pColor);
				lineTo(-2, 6);				
				lineTo(10, 0);
				lineTo(-2, -6);				
				lineTo(0, 0);
				endFill();
			}
		}
		//add shape and movieclip to display list
		private function addMyChildren(e:Event):void
		{
			if (e.target == e.currentTarget)
			{
				addChild(pShape);
				addChild(pTurtle);
			}
		}

		// The following 6 functions use get and set to allow us to read or set turtleX, turtleY;
		// and turtleAngle as if they were public properties without exposing the
		// more complex representation within the class

		public function get turtleAngle( ):Number
		{
			return pAngle;
		}

		public function get turtleX( ):Number
		{
			return pPos.x;
		}

		public function get turtleY( ):Number
		{
			return pPos.y;
		}


		public function set turtleAngle(Angle:Number ):void
		{
			pAngle = Angle;
		}

		public function set turtleX(anX:Number ):void
		{
			pPos.x = anX;
		}

		public function set turtleY(aY:Number):void
		{
			pPos.y = aY;
		}

		//-------------------------------------------------------------------------------

		// These commands allow us to choose whether the turtle draws a line or
		// moves to its next position without leaving a trace
		public function penUp( ):void
		{
			pPen = false;
		}

		public function penDown( ):void
		{
			pPen = true;
		}
		// These commands begin and end fill
		// parameters are hex color and alpha (0.0 to 1.0)
		public function beginFill( col:Number, alph:Number):void
		{
			pList.push({op:"beginFill", color:col, alpha:alph});
		}

		public function endFill( ):void
		{
			pList.push({op:"endFill"});
		}

		public function hideTurtle( ):void
		{
			pList.push({op:"hideTurtle"});
		}

		//-------------------------------------------------------------------------------

		// These commands allow us to set stroke width and color for the graphics pen
		public function setColor(aColor: Number):void
		{
			colors.push(aColor);
			pList.push({op:"setColor"});
		}

		public function setWidth(aWidth: Number):void
		{
			widths.push(aWidth);
			pList.push({op:"setWidth"});
		}
		
		
		
		// This function will cause a Turtle to trace a message
		public function speak(message:String):void
		{
			pList.push({op:"speak", mess:message});
		}

		//------------------------------------------------------------------------

		// The following commands move the turtle drawing a line if pPen is true.

		// The polar function helps us compute the next position of the turtle when
		// it moves along its current heading

		public function fwd(aDistance:Number):void
		{
			pPos = pPos.add(Point.polar(aDistance,pAngle * DEGRAD));
			if (pPen)
			{
				pList.push({op:"lineTo", x:pPos.x, y:pPos.y});
			}
			else
			{
				pList.push({op:"moveTo", x:pPos.x, y:pPos.y});
			}
		}
		
		private function doTimer(e:TimerEvent ):void
		{
			var theList = pList;
			var command:Object;
			if (pList.length > 0)
			{
				if(delayOn) 
				{
					command = pList.shift();
					doCommand(command);
				}
				else do 
				{
					command = pList.shift();
					doCommand(command);
				}
				while (pList.length > 0)
			}
		}
		
		private function doCommand(command:Object):void
		{
			switch (command.op)
			{
				case "rotate" :
					pTurtle.rotation = command.ang;
					break;
				case "lineTo" :
					pTurtle.x = command.x;
					pTurtle.y = command.y;
					pShape.graphics.lineTo(command.x, command.y);
					break;
				case "moveTo" :
					pTurtle.x = command.x;
					pTurtle.y = command.y;
					pShape.graphics.moveTo(command.x, command.y);
					break;
				case "beginFill" :
					pShape.graphics.beginFill(command.color, command.alpha);
					break;
				case "endFill" :
					pShape.graphics.endFill();
					break;
				case "hideTurtle" :
					removeChild(pTurtle);
					break;
				case "setColor" :
					pColor = colors.shift();
					pShape.graphics.lineStyle(pWidth, pColor);
					break;	
				case "setWidth" :
					pWidth = widths.shift();
					pShape.graphics.lineStyle(pWidth, pColor);
					break;	
				case "speak":
						trace(command.mess);
						break;
			}
		}
		
		public function moveAbs(aX:Number, aY:Number):void
		{
			pPos.x = aX;
			
			pPos.y = aY;
			
			if (pPen)
			{
				pList.push({op:"lineTo", x:aX, y:aY});
			}
			else
			{
				pList.push({op:"moveTo", x:aX, y:aY});
			}
		}

		//------------------------------------------------------------------------

		// The following commands change the heading of the turtle.
		// They cause the turtle to turn in place but do not cause it to move.
		public function turnAbs(anAngle:Number):void
		{
			pAngle = anAngle;
			pList.push({op:"rotate", ang:pAngle});
		}

		public function turnRight(anAngle:Number):void
		{
			pAngle +=  anAngle;
			if (pAngle >= 360)
			{
				pAngle %=  360;
			}
			pList.push({op:"rotate", ang:pAngle});
		}

		public function turnLeft(anAngle:Number):void
		{
			pAngle -=  anAngle;
			if (pAngle < 0)
			{
				pAngle +=  360;
			}
			pList.push({op:"rotate", ang:pAngle});
		}
	}
}