package server.controller;

import js.Node;
import js.node.Fs;
import js.npm.express.*;

import js.Node.console;

import model.constants.App;

// import msignal.Signal;

class Api {

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

	public static function apiId(req:Request,res:Response) {
		var _url = Node.__dirname +  '/private/api_id.json';
		res.send(Fs.readFileSync(_url, "utf8"));
	}

}