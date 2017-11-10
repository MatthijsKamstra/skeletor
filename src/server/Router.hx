package server;

import js.npm.Express;

class Router {

	public static function init(app : Express):Void
	{
		// home
		app.get('/', Controller.index);

		// stuff
		app.get('/secure', Controller.secure);
		app.get('/ping', Controller.ping);
		app.get('/update', Controller.update);
		app.get('/version', Controller.version);

		// access
		app.get('/logout', Controller.logout);
		app.get('/login', Controller.login);
		app.post('/login', Controller.loginPost);

		// api
		app.get('/api', Controller.api);
		app.post('/api', Controller.apiPost);

		// test app
		app.get('/test', Controller.test);
		app.get('/test/id', Controller.testId);
		app.get('/test/:id', Controller.testById);
		app.get('/test/foo/:id', Controller.testFooById);

		// app.route('/book')
		// 	.get(function (req, res) {
		// 		res.send('Get a random book');
		// 	})
		// 	.post(function (req, res) {
		// 		res.send('Add a book');
		// 	})
		// 	.put(function (req, res) {
		// 		res.send('Update the book');
		// 	});
	}
}