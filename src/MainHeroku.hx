package;

import js.Node.*;
import js.Node;
import js.Node.console;

import js.node.Fs;
import js.node.Path;
import js.node.Require;

import js.npm.SocketIo;
import js.npm.Request;

import js.npm.Express;
import js.npm.express.*;
import js.npm.express.Request;
import js.npm.express.Response;

import model.constants.App;
import server.Router;

import haxe.Timer;
using StringTools;

/**
 * @author Matthijs Kamstra aka [mck]
 * MIT
 */
class MainHeroku {

	var app : js.npm.Express;
	var server : js.node.http.Server;
	public static var io : js.npm.socketio.Server;


	public function new () {
		console.log('${App.PROJECT_NAME} build: ${App.BUILD}');

		trace('${App.PROJECT_NAME} start Heroku server');

		var port = Sys.getEnv("PORT");
		if(port == null) port = App.PORT;
		trace('port: $port');

		app    = new js.npm.Express();
		server = js.node.Http.createServer( cast app );
		io     = new js.npm.socketio.Server(server);

		// setup
		// app.set('port', port);

		// use
		app.use(new Favicon(Node.__dirname + '/favicon.ico'));			// because I like favicons
		app.use(new Morgan('dev'));										// set morgan to log info about our requests for development use.
		app.use(BodyParser.json());										// support json encoded bodies
		app.use(BodyParser.urlencoded({ extended: true }));				// initialize body-parser to parse incoming parameters requests to req.body
		app.use(new Static(Path.join(Node.__dirname, 'public')));
		app.use(new CookieParser());									// initialize cookie-parser to allow us access the cookies stored in the browser.
																		// initialize express-session to allow us track the logged-in user across sessions.
		app.use(new Session({
			secret: 'example',
			resave: true,
    		saveUninitialized: true
		}));
		// app.use(untyped checkAuth ); 								// need to fix this in the externs

		// Routes
		Router.init(app); 												// need to fix this in the externs

		// socket stuff
		io.on('connection', function (socket) {

			socket.emit('message', { message: 'Welcome from the Heroku server - ${App.PROJECT_NAME}' });
			socket.on('send', function (data:Dynamic) {
				io.sockets.emit('id', data.id);
				trace('send data -> ' + data.id);
			});
			socket.on('disconnect', function (data:Dynamic) {
        		console.log('user disconnected');
    		});
			// socket.on('ping', function(data:Dynamic) {
			// 	trace('got a ping');
    		// 	io.sockets.emit('pong');
  			// });
		});

		// use this last...
		app.use(function(req, res, next) {
			res.status(404).send('404');
			// res.status(404).send(output);
		});

		// server.listen(app.get('port'));
		// trace('Listening on port: ${app.get('port')} (http://localhost:${app.get('port')})');
		server.listen(port);
		trace('Listening on port: ${port} (http://localhost:${port})');
	}

	function checkAuth (req:Dynamic, res, next) {
		console.log('checkAuth ' + req.url);
		// don't serve /secure to those not logged in
		// you should add to this list, for each and every secure url
		if (req.url == '/secure' && (req.session == null || req.session.authenticated != true)) {
			res.redirect('/login');
			// res.status(404).send('404');
			return;
		}
		next();
	}

	static public function main () {
		var app = new MainHeroku ();
	}
}


