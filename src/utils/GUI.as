package utils
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.*;

	public class GUI
	{
		static public function createButton(x:Number, y:Number, w:Number, h:Number, text:String, clickHandler:Function):DisplayObject {
			var btn:Sprite = new Sprite();
			btn.x = x;
			btn.y = y;
			btn.graphics.beginFill(0xffffff);
			btn.graphics.drawRect(0, 0, w, h);
			btn.graphics.endFill();
			btn.buttonMode = true;
			
			var tf:TextField = new TextField();
			tf.defaultTextFormat = new TextFormat("_sans", 16, 0, true, false, false, null, null, TextFormatAlign.CENTER);
			tf.width = btn.width;
			tf.autoSize = TextFieldAutoSize.CENTER;
			tf.selectable = false;
			tf.text = text;
			tf.mouseEnabled = false;
			
			btn.addChild(tf);
			btn.addEventListener(MouseEvent.CLICK, clickHandler);
			
			return btn;
		}
	}
}