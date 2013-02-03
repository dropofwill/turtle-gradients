package code {
	
	public class ColorControl {

		public function ColorControl() {
			// constructor code
		}
		
		//--Functions I added that return the individual RGB values of the current color
		
		public static function returnRed(aColor:Number):int
		{
			var strOutput:String = aColor.toString(16);
			var output;
			
			strOutput += " R:"+ (aColor >> 16) ;

			//trace(int(strOutput.slice(9,12)));
			output = int(strOutput.slice(9,12));
			
			return output;
		}
		
		public static function returnGreen(aColor:Number):int
		{
			var strOutput:String = aColor.toString(16);
			var output;
			
			strOutput += " G:"+ (aColor >> 8 & 0xFF);
					
			//trace(int(strOutput.slice(9,12)));
			output = int(strOutput.slice(9,12));
			
			return output;
		}
		
		public static function returnBlue(aColor:Number):int
		{
			var strOutput:String = aColor.toString(16);
			var output;
			
			strOutput += " B:"+ (aColor & 0xFF);
			
			//trace(int(strOutput.slice(9,12)));
			output = int(strOutput.slice(9,12));
			
			return output;
		}
		
		
		//------------------------------------------------------------------------
		// static functions for color control
		// must be called using the class name, like this:
		//		ColorControl.traceColor(someColor);
		// to call these functions from your turtle, use this syntax
		// var newColor:Number =  ColorControl.addBlue(someColor, 50);
		//------------------------------------------------------------------------

		public static function addRed(aColor:Number, aRedVal:int):Number
		{
			// aColor in 0x000000 format, aRedVal in integer format (eg, 255)
			var col:Object = hexToRGB(aColor);
			var red:Number = col.red + aRedVal;
			return RGBtoHex(wrapColor(red), col.green, col.blue);
		}
		public static function addGreen(aColor:Number, aGreenVal:int):Number
		{
			// aColor in 0x000000 format, aRedVal in integer format (eg, 255)
			var col:Object = hexToRGB(aColor);
			var green:Number = col.green + aGreenVal;
			return RGBtoHex(col.red, wrapColor(green), col.blue);
		}

		public static function addBlue(aColor:Number, aBlueVal:int):Number
		{
			// aBlueVal in integer format (eg, 255)
			var col:Object = hexToRGB(aColor);
			var blue:Number = col.blue + aBlueVal;
			return RGBtoHex(col.red,col.green,wrapColor(blue));
		}

		public static function addColors(aColor:Number, aRedVal:int, aGreenVal:int, aBlueVal:int):Number
		{
			// aRedVal in integer format (eg, 255)
			var col:Object = hexToRGB(aColor);
			var red:Number = col.red + aRedVal;
			var green:Number = col.red + aGreenVal;
			var blue:Number = col.blue + aBlueVal;
			return RGBtoHex(wrapColor(red),wrapColor(green),wrapColor(blue));
		}

		public static function multiplyColors(aColor:Number, aRedMult:Number, aGreenMult:Number, aBlueMult:Number):Number
		{
			// aRedMult can be any integer, aRedVal in integer format (eg, 255)
			var col:Object = hexToRGB(aColor);
			var red:Number = col.red * aRedMult;
			var green:Number = col.green * aGreenMult;
			var blue:Number = col.blue * aBlueMult;
			return RGBtoHex(clipColor(red), clipColor(green), clipColor(blue));
		}
		
		public static function traceColor(aColor:Number):void
		{
			var output:String = aColor.toString(16);
			// pad with some leading 0's if needed
			while (output.length < 6)
			{
				output = "0" + output;
			}
			output = "0x" + output;
			 
			
			output += " R:"+ (aColor >> 16  & 0xFF) ;
			output += " G:"+ (aColor >> 8  & 0xFF);
			output += " B:"+ (aColor  & 0xFF);
			
			trace(output);
		}
		
		/*//////////////////////////////////////////////
		The following are utility functions that 
		help with the above calculations
		//////////////////////////////////////////////*/
		
		public static function RGBtoHex(r:int, g:int, b:int):int
		{
			return r << 16 | g << 8 | b;
		}
		
		public static function hexToRGB(val:Number):Object
		{
			var col:Object = {};

			col.red = (val >> 16) & 0xFF;
			col.green = (val >> 8) & 0xFF;
			col.blue = val & 0xFF;
			return col;
		}
		public static function clipColor(colorValue:int):int
		{
			if(colorValue < 0) colorValue = 0;
			if (colorValue > 255) colorValue = 255;
			return colorValue;
		}
		public static function wrapColor(colorValue:int):int
		{
			if(colorValue < 0)
			{ 
				colorValue = colorValue % 255 + 255; 
			}
			
			if (colorValue % 255 == 0)
			{
				colorValue = 255;
			} 
			else if (colorValue > 255) 
			{
				colorValue = colorValue % 255 - 1;
			}
			return colorValue;
		}
	}
}
