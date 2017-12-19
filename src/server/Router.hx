package server;

import js.npm.Express;
import server.controller.*;

class Router {

	public static function init(app : Express):Void
	{
		// home / public
		app.get('/', Controller.index);
		app.get('/about', Controller.about);
		app.get('/list', Controller.list);
		app.get('/port', Controller.port);

		// admin
		app.get('/secure', Controller.secure);
		app.get('/ping', Controller.ping);
		app.get('/update', Controller.update);
		app.get('/version', Controller.version);

		app.get('/toggle', Controller.toggle);

		app.get('/secure', Controller.secure);
		app.get('/secure1', Controller.secure1);

		// access
		app.get('/logout', server.controller.Login.logout);
		app.get('/login', server.controller.Login.login);
		app.post('/login', server.controller.Login.loginPost);

		app.get('/admin', server.controller.Admin.start);
		app.get('/admin/users', server.controller.Admin.users);
		app.get('/admin/init', server.controller.Admin.init);

		// api
		app.get('/api', server.controller.Api.api);
		app.get('/api/id', server.controller.Api.apiId);
		app.post('/api', server.controller.Api.apiPost);

		// test app
		app.get('/test', server.controller.Test.test);
		app.get('/test/id', server.controller.Test.testId);
		app.get('/test/:id', server.controller.Test.testById);
		app.get('/test/foo/:id', server.controller.Test.testFooById);

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