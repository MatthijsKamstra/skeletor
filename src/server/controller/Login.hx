package server.controller;

import js.Node;
import js.node.Fs;
import js.npm.express.*;

import js.Node.console;

import model.constants.App;

// import msignal.Signal;

class Login {
	public function new () {
		// your code
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

}