package server.controller;

import js.Node;
import js.node.Fs;
import js.npm.express.*;

import js.Node.console;

import model.constants.App;

// import msignal.Signal;


class Test {
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
		// res.sendfile(Node.__dirname + '/public/test.html');
		var json = {
			"id": "yes"
		};
		res.send(json);
	}
	public static function testById(req:Request,res:Response) {
		var _id = req.params.id;
		// var _url = Node.__dirname +  '/_data/${Folder.GITLAB}/gitlab_project_issues_${_id}.json';
		// res.send(haxe.Json.parse(Fs.readFileSync(_url, "utf8")));
		// res.sendfile(Node.__dirname + '/public/test.html');


		var json = {
			"id" : _id,
			"text" : "Something clever"
		};

		res.send(json);
	}
	public static function testFooById(req:Request,res:Response) {
		// res.send('testFooById: ${req.params.id}');
		// res.sendfile(Node.__dirname + '/public/test.html');

		var _id = req.params.id;
		var json = [ 			{
			"id" : _id,
			"text" : "Something clever",
			"foo" : true
		}];

		res.send(json);

	}
}