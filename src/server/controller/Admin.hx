package server.controller;

import js.node.Fs;
import js.Node;
import js.npm.express.Request;
import js.npm.express.Response;

class UserObj {
	public function new(name,pass,access) {
		this.name = name;
		this.pass = pass;
		this.access = access;
		this.key = haxe.crypto.Md5.encode(name+pass);
		this.createdAt =  Date.now().toString();
	}

	// Easy way to generate a v4 UUID:
    public var id(default, null) : String = HaxeLow.uuid();
	public var access : UserAcces;
	public var name : String;
	public var pass : String;
	public var key : String;
	public var createdAt : String;
}

@:enum abstract UserAcces(String) {
	var Admin = 'admin';
	var Super = 'super';
	var User = 'user';
}

class Admin {
	public function new () {
		// your code
	}

	public static function init(?req,?res){

		var filename = Node.__dirname + '/private/db/users.json';
		var db : HaxeLow = new HaxeLow(filename);
		var arr = db.idCol(UserObj);

		var userObjArr = [
			new UserObj('matthijs-user','user123', UserAcces.User),
			new UserObj('matthijs-super','super123', UserAcces.Super),
			new UserObj('matthijs-admin','admin123', UserAcces.Admin)
		];

		for (newUserObj in userObjArr){
			var o = newUserObj;
			var isAlreadyUser = false;
			for (userObj in arr){
				// trace( 'userObj: ' + userObj );
				var obj : UserObj = userObj;
				if(o.key == obj.key) isAlreadyUser = true;
			}
			if(!isAlreadyUser) arr.idInsert(o);
		}
		db.save();

		if(res != null) res.send('{}');
	}


	public static function getUsers() {
		trace('getUsers()');
		var filename = Node.__dirname + '/private/db/users.json';
		var db = new HaxeLow(filename);
		var arr = db.idCol(UserObj);
		var io = MainHeroku.io;
		io.sockets.emit('admin:users:set', {ok:true, data:arr});
		// haxe.Timer.delay(function (){
		// }, 3000);
	}
	public static function users(req:Request,res:Response) {
		// res.send('api: ${App.BUILD}');
		// var _url = Node.__dirname +  '/private/api_id.json';
		// res.send(Fs.readFileSync(_url, "utf8"));
		res.send(Controller.useTemplate(Node.__dirname + '/public/_admin.html', Node.__dirname + '/public/_nav.html'));
		// getUsers();


		// admin:users:get
	}

}