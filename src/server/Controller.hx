package server;

import js.Node;
import js.node.Fs;
import js.npm.express.*;

import js.Node.console;

import model.constants.App;

// import msignal.Signal;

class Controller {

	public static function index(req:Request,res:Response) {
		res.sendfile(Node.__dirname + '/public/_index.html');
	}

	public static function logout(req:Request,res:Response) {
		// res.sendfile(Node.__dirname + '/public/login.html');
		untyped req.session.destroy();
		res.redirect('/');
	}
	public static function login(req:Request,res:Response) {
		res.sendfile(Node.__dirname + '/public/login.html');
	}
	public static function loginPost(req:Request,res:Response, next) {
		// res.sendfile(Node.__dirname + '/public/secure.html');
		// trace(req);
		// trace(res);
		// trace(next);

		// you might like to do a database look-up or something more scalable here
		if (untyped req.body.username != null &&
			untyped req.body.username == 'user' &&
			untyped req.body.password != null &&
			untyped req.body.password == 'pass'
			){
			untyped req.session.authenticated = true;
			res.redirect('/secure');
		} else {
			// req.flash('error', 'Username and password are incorrect');
			res.redirect('/login');
		}
	}







	public static function api(req:Request,res:Response) {
		res.send('api: ${App.BUILD}');
	}
	public static function apiPost(req:Request,res:Response) {
		console.log('api');
		console.log(req);
		console.log(res);
		// console.log(res.body);
		// console.log(req.body);
	}

	/**
	 *  test/testId/testById/testFooById
	 *
	 *  @param req -
	 *  @param res -
	 */
	public static function test(req:Request,res:Response) {
		// res.sendfile(Node.__dirname + '/public/test.html');
		var _url = Node.__dirname +  '/private/test.json';
		res.send(Fs.readFileSync(_url, "utf8"));
	}
	public static function testId(req:Request,res:Response) {
		res.sendfile(Node.__dirname + '/public/test.html');
	}
	public static function testById(req:Request,res:Response) {
		res.send('testById: ${req.params.id}');
		var _id = req.params.id;
		// var _url = Node.__dirname +  '/_data/${Folder.GITLAB}/gitlab_project_issues_${_id}.json';
		// res.send(haxe.Json.parse(Fs.readFileSync(_url, "utf8")));
		// res.sendfile(Node.__dirname + '/public/test.html');
	}
	public static function testFooById(req:Request,res:Response) {
		res.send('testFooById: ${req.params.id}');
		// res.sendfile(Node.__dirname + '/public/test.html');
	}

	public static function ping(req:Request,res:Response) {
		res.send('test:ping');
		var io = MainHeroku.io;
		io.sockets.emit('test:ping', App.PROJECT_NAME);
	}
	public static function version(req:Request,res:Response) {
		res.send('version: ${App.BUILD}');
		var io = MainHeroku.io;
		io.sockets.emit('version', App.BUILD);
	}
	public static function secure(req:Request,res:Response) {
		// res.send('secure: ${App.BUILD}');
		res.sendfile(Node.__dirname + '/public/secure.html');
		var io = MainHeroku.io;
		io.sockets.emit('version', App.BUILD);
	}
	public static function secure1(req:Request,res:Response) {
		// res.send('secure: ${App.BUILD}');
		res.sendfile(Node.__dirname + '/public/secure.html');
		var io = MainHeroku.io;
		io.sockets.emit('version', App.BUILD);
	}
	public static function update(req:Request,res:Response) {
		res.send('update: ${App.BUILD}');
		var io = MainHeroku.io;
		io.sockets.emit('update', App.BUILD);
	}

}