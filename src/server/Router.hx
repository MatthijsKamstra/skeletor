package server;

import js.npm.Express;

class Router {

	public static function init(app : Express):Void
	{
		app.get('/', Controller.index);
		app.get('/secure', Controller.secure);
		app.get('/ping', Controller.ping);
		app.get('/update', Controller.update);
		app.get('/version', Controller.version);

		app.get('/logout', Controller.logout);
		app.get('/login', Controller.login);
		app.post('/login', Controller.loginPost);

		app.get('/api', Controller.api);
		app.post('/api', Controller.apiPost);


		// // test app
		// app.get('/test', Controller.test);
		// app.get('/test/id', Controller.testId);
		// app.get('/test/:id', Controller.testById);
		// app.get('/test/foo/:id', Controller.testFooById);

		// app.get('/secure', function (req, res, next) {
		// 	res.sendfile(Node.__dirname + '/public/secure.html');
		// });
		// app.get('/login', function (req, res, next) {
		// 	res.sendfile(Node.__dirname + '/public/login.html');
		// });
		// app.post('/login', function (req, res, next) {

		// 	trace(req);
		// 	trace(res);
		// 	trace(next);

		// 	// you might like to do a database look-up or something more scalable here
		// 	if (req.body.username != null && req.body.username == 'user' && req.body.password != null && req.body.password == 'pass') {
		// 		req.session.authenticated = true;
		// 		res.redirect('/secure');
		// 	} else {
		// 		// req.flash('error', 'Username and password are incorrect');
		// 		res.redirect('/login');
		// 	}

		// });

		// app.get('/api', function (req:js.npm.express.Request, res:Response) {
		// 	res.send('api: ${App.BUILD}');
		// });
		// app.post('/api', function (req, res:Response) {
		// 	console.log('api');
		// 	// console.log(req);
		// 	// console.log(res);
		// 	// console.log(res.body);
		// 	console.log(req.body);
		// });

	}
}