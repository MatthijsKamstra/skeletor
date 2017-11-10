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

	public static function login(req:Request,res:Response) {
		res.sendfile(Node.__dirname + '/public/login.html');
	}
	public static function loginPost(req:Request,res:Response) {
		res.sendfile(Node.__dirname + '/public/secure.html');
	}
	public static function logout(req:Request,res:Response) {
		// res.sendfile(Node.__dirname + '/public/login.html');
		res.redirect('/');
	}

	public static function test(req:Request,res:Response) {
		res.sendfile(Node.__dirname + '/public/test.html');
	}
	public static function ping(req:Request,res:Response) {
		var io = MainHeroku.io;
		res.send('test:ping');
		io.sockets.emit('test:ping', App.PROJECT_NAME);

		// res.sendfile(Node.__dirname + '/public/test.html');
	}
	public static function version(req:Request,res:Response) {
		res.send('version: ${App.BUILD}');
		// io.sockets.emit('version', App.BUILD);
	}
	public static function secure(req:Request,res:Response) {
		res.send('secure: ${App.BUILD}');
		// io.sockets.emit('version', App.BUILD);
	}
	public static function update(req:Request,res:Response) {
		res.send('update: ${App.BUILD}');
		// io.sockets.emit('version', App.BUILD);
	}



	// public static function latest(req:Request,res:Response) {
	// 	var _url = Node.__dirname +  '/_config/config.json';
	// 	res.send(Fs.readFileSync(_url, "utf8"));
	// }

	// public static function settings(req:Request,res:Response) {
	// 	var _url = Node.__dirname +  '/_config/settings.json';
	// 	var date = Date.now();
	// 	var settings = haxe.Json.stringify(
	// 		{
	// 			items:[
	// 				{
	// 					id:(date.getTime()+0),
	// 					createdate:date,
	// 					title:'Ki ios',
	// 					gitlabid:1,
	// 					milestone:'1.2.0',
	// 					tenkid:1350516,
	// 					tenkidSub:1350533
	// 				},
	// 				{
	// 					id:(date.getTime()+1),
	// 					createdate:date,
	// 					title:'Ki Android',
	// 					gitlabid:2,
	// 					milestone:'1.2.0',
	// 					tenkid:1350516,
	// 					tenkidSub:1350534
	// 				},
	// 				{
	// 					id:(date.getTime()+2),
	// 					createdate:date,
	// 					title:'Ki backend',
	// 					gitlabid:68,
	// 					milestone:'1.6.0',
	// 					tenkid:1350516,
	// 					tenkidSub:1350536
	// 				}

	// 			]
	// 		}
	// 	);
	// 	if(sys.FileSystem.exists(_url)){
	// 		settings = Fs.readFileSync(_url, "utf8");
	// 	} else {
	// 		sys.io.File.saveContent( Node.__dirname +  '/_config/settings.json', settings );
	// 	}
	// 	res.send(settings);
	// }

	// public static function settingsAdd(req:Request,res:Response) {
	// 	var _date = Date.now();
	// 	var _title = req.query.title;
	// 	var _gitlabid = Std.int(req.query.gitlabid);
	// 	var _gitlabmilestone = req.query.gitlabmilestone;
	// 	var _tenkid = Std.int(req.query.tenkid);
	// 	var _tenkphaseid = Std.int(req.query.tenkphaseid);

	// 	// trace(_title, _gitlabid, _gitlabmilestone, _tenkid, _tenkphaseid);

	// 	var _url = Node.__dirname +  '/_config/settings.json';
	// 	var settings : SettingsDataObj = haxe.Json.parse(Fs.readFileSync(_url, "utf8"));

	// 	// trace(settings);

	// 	var obj : SettingsData = {
	// 		id : _date.getTime(),
	// 		createdate : _date,
	// 		title : _title,
	// 		gitlabid : _gitlabid,
	// 		milestone : _gitlabmilestone,
	// 		tenkid : _tenkid,
	// 		tenkidSub : _tenkphaseid
	// 	};
	// 	settings.items.push(obj);

	// 	// trace(settings);

	// 	sys.io.File.saveContent( _url, haxe.Json.stringify(settings));

	// 	res.redirect('/');
	// }

	// // form get
	// public static function settingsRemove(req:Request,res:Response) {
	// 	var _id = req.query.id;
	// 	trace('--------------> ${_id}');
	// 	// trace('--------------> ${req.query}');
	// 	var _url = Node.__dirname +  '/_config/settings.json';
	// 	var obj : SettingsDataObj = haxe.Json.parse(Fs.readFileSync(_url, "utf8"));
	// 	var settings : SettingsDataObj = {items:[]};
	// 	for (i in obj.items){
	// 		// trace(i);
	// 		var _data = i;
	// 		var id = _data.id;
	// 		if(id == Std.parseInt(_id)) {
	// 			// trace('found ${_id} in ${i}');
	// 		} else {
	// 			settings.items.push (i);
	// 		}
	// 	}

	// 	// trace(settings);
	// 	sys.io.File.saveContent( _url, haxe.Json.stringify(settings));

	// 	// var _url = Node.__dirname +  '/_config/settings.json';
	// 	// res.send(Fs.readFileSync(_url, "utf8"));
	// 	// var obj = {"id":'${_id}'};
	// 	// res.send(haxe.Json.stringify(obj));
	// 	// res.sendfile(Node.__dirname + '/public/index.html');

	// 	res.redirect('/');
	// }

	// public static function update(req:Request,res:Response) {
	// 	var mainGenerate = new MainGenerate();
	// 	// mainGenerate.pingSignal.add(
	// 	// 	function(i){
	// 	// 		// trace('signal dispatched!: ${i}');
	// 	// 		res.send(i);
	// 	// });
	// 	var obj = {"update":"done"};
	// 	res.send(haxe.Json.stringify(obj));
	// }

	// /**
	// 	var _url0 = Node.__dirname +  '/_data/${tenkFolder}/projects.json';
	// 	var _url1 = Node.__dirname +  '/_data/${tenkFolder}/${id}_budget.json';
	// 	var _url2 = Node.__dirname +  '/_data/${tenkFolder}/${id}_time_entries.json';
	// 	var _data0 : TenKeyProjectsObj;
	// 	var _data1 : TenKeyBudgetObj;
	// 	var _data2 : TenKeyHoursObj;

	// 	_data0 = haxe.Json.parse(Fs.readFileSync(_url0, "utf8"));
	// 	_data1 = haxe.Json.parse(Fs.readFileSync(_url1, "utf8"));
	// 	_data2 = haxe.Json.parse(Fs.readFileSync(_url2, "utf8"));
	//  */


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

	// public static function combineProjectsId(req,res){
	// 	var _url = Node.__dirname +  '/combine.json';
	// 	res.send(Fs.readFileSync(_url, "utf8"));
	// };
}