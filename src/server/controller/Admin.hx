package server.controller;

import js.node.Fs;
import js.Node;
import js.npm.express.Request;
import js.npm.express.Response;

class SomeObject {
	public function new() {
		internal = "internal";
	}

	// Easy way to generate a v4 UUID:
    public var id : String = HaxeLow.uuid();
	public var name : String;
	public var array : Array<Int>;

	var internal : String;
}


class Admin {
	public function new () {
		// your code
	}

	public static function init(){
		var db : HaxeLow;
		var o : SomeObject;
		var filename = Node.__dirname + '/private/db/test.json';
		db = new HaxeLow(filename);

		o = new SomeObject();
		o.name = "Name";
		o.array = [1,2,3];

		db.idCol(SomeObject).idInsert(o);
		db.save();
	}


	public static function users(req:Request,res:Response) {
		// res.send('api: ${App.BUILD}');





		var _url = Node.__dirname +  '/private/api_id.json';
		// res.send(Fs.readFileSync(_url, "utf8"));

		res.send(Controller.useTemplate(Node.__dirname + '/public/_admin.html', Node.__dirname + '/public/_nav.html'));
	}

}