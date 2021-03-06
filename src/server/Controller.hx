package server;

import js.Node;
import js.node.Fs;
import js.npm.express.*;
import js.Node.console;
import model.constants.App;

// import msignal.Signal;
class Controller {
	public static function index(req:Request, res:Response) {
		res.send(Controller.useTemplate(Node.__dirname + '/public/_index.html')); // if the index is just a placeholder
		// res.send(Controller.useTemplate(Node.__dirname + '/public/_index.html', Node.__dirname + '/public/_nav.html'));
	}

	public static function about(req:Request, res:Response) {
		res.send(Controller.useTemplate(Node.__dirname + '/public/_about.html', Node.__dirname + '/public/_nav.html'));
	}

	public static function list(req:Request, res:Response) {
		res.send(Controller.useTemplate(Node.__dirname + '/public/_list.html', Node.__dirname + '/public/_nav.html'));
	}

	public static function port(req:Request, res:Response) {
		var port = Sys.getEnv("PORT");
		if (port == null)
			port = App.PORT;
		res.send('{ "port" : "${port}" }');
	}

	public static function ping(req:Request, res:Response) {
		res.send('test:ping');
		var io = MainHeroku.io;
		io.sockets.emit('test:ping', App.PROJECT_NAME);
	}

	public static function toggle(req:Request, res:Response) {
		// res.send('toggle');
		var io = MainHeroku.io;
		io.sockets.emit('toggle:init', App.PROJECT_NAME);
		// res.sendfile(Node.__dirname + '/public/toggle.html');
		res.send(Controller.useTemplate(Node.__dirname + '/public/_toggle.html', Node.__dirname + '/public/_nav.html'));
	}

	public static function version(req:Request, res:Response) {
		res.send('version: ${App.getBuildDate()}');
		var io = MainHeroku.io;
		io.sockets.emit('version', App.getBuildDate());
	}

	public static function secure(req:Request, res:Response) {
		// res.send('secure: ${App.getBuildDate()}');
		res.send(Controller.useTemplate(Node.__dirname + '/public/_secure.html', Node.__dirname + '/public/_nav.html'));

		// res.sendfile(Node.__dirname + '/public/_secure.html');
		var io = MainHeroku.io;
		io.sockets.emit('version', App.getBuildDate());
	}

	public static function secure1(req:Request, res:Response) {
		// res.send('secure: ${App.getBuildDate()}');
		res.sendfile(Node.__dirname + '/public/secure.html');
		var io = MainHeroku.io;
		io.sockets.emit('version', App.getBuildDate());
	}

	public static function update(req:Request, res:Response) {
		res.send('update: ${App.getBuildDate()}');
		var io = MainHeroku.io;
		io.sockets.emit('update', App.getBuildDate());
	}

	public static function useTemplate(htmlPath:String, ?navPath:String) {
		var _html = (Fs.readFileSync(htmlPath, 'utf8'));
		var _nav = '';
		if (navPath != null)
			_nav = (Fs.readFileSync(navPath, 'utf8'));
		var template = new haxe.Template(_html);
		var html = template.execute({"nav": _nav});
		return html;
	}
}
