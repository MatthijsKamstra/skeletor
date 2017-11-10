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
		res.redirect('/');
	}
	public static function login(req:Request,res:Response) {
		res.sendfile(Node.__dirname + '/public/login.html');
	}
	public static function loginPost(req:Request,res:Response) {
		res.sendfile(Node.__dirname + '/public/secure.html');
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

	public static function test(req:Request,res:Response) {
		res.sendfile(Node.__dirname + '/public/test.html');
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
	public static function update(req:Request,res:Response) {
		res.send('update: ${App.BUILD}');
		var io = MainHeroku.io;
		io.sockets.emit('update', App.BUILD);
	}



	// // gitlab
	// public static function githubProjects(req,res){
	// 	var _url = Node.__dirname +  '/_data/${Folder.GITLAB}/gitlab_projects.json';
	// 	res.send(haxe.Json.parse(Fs.readFileSync(_url, "utf8")));
	// };
	// public static function githubProjectsId(req,res){
	// 	var _url = Node.__dirname +  '/_data/gitlab.json';
	// 	res.send(Fs.readFileSync(_url, "utf8"));
	// };
	// public static function githubIssuesById(req,res){
	// 	// res.send('githubIssuesById: ${req.params.id}');

	// 	var _id = req.params.id;
	// 	var _url = Node.__dirname +  '/_data/${Folder.GITLAB}/gitlab_project_issues_${_id}.json';
	// 	res.send(haxe.Json.parse(Fs.readFileSync(_url, "utf8")));

	// };

	// // tenk
	// public static function tenkProjects(req,res){
	// 	var _url = Node.__dirname +  '/_data/${Folder.TENK}/projects.json';
	// 	res.send(Fs.readFileSync(_url, "utf8"));
	// };
	// public static function tenkProjectsId(req,res){
	// 	var _url = Node.__dirname +  '/_data/tenk.json';
	// 	res.send(Fs.readFileSync(_url, "utf8"));
	// };
	// public static function tenkById(req,res){
	// 	res.send('tenkById: ${req.params.id}');
	// };
	// public static function tenkPhasesById(req,res){
	// 	var _id = req.params.id;
	// 	var _url = Node.__dirname +  '/_data/${Folder.TENK}/${_id}_phases.json';
	// 	res.send(Fs.readFileSync(_url, "utf8"));
	// };
	// public static function tenkBudgetById(req,res){
	// 	var _id = req.params.id;
	// 	var _url = Node.__dirname +  '/_data/${Folder.TENK}/${_id}_budget.json';
	// 	res.send(Fs.readFileSync(_url, "utf8"));
	// };
	// public static function tenkTimeById(req,res){
	// 	var _id = req.params.id;
	// 	var _url = Node.__dirname +  '/_data/${Folder.TENK}/${_id}_time_entries.json';
	// 	res.send(Fs.readFileSync(_url, "utf8"));
	// };


}