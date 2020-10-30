package model.constants;

import haxe.macro.Context;

class App {
	public static inline var PROJECT_NAME:String = "[Skeletor]";

	public static inline var URL:String = "https://skeletor.herokuapp.com/";
	public static inline var PORT:String = "5000";

	macro public static function getBuildDate() {
		var date = Date.now().toString();
		return Context.makeExpr(date, Context.currentPos());
	}
}
