// Generated by Haxe 3.4.4
if (process.version < "v4.0.0") console.warn("Module " + (typeof(module) == "undefined" ? "" : module.filename) + " requires node.js version 4.0.0 or higher");
(function () { "use strict";
var MainHeroku = function() {
	console.log("[Skeletor]" + " build: " + model_constants_App.BUILD);
	console.log("[Skeletor]" + " start Heroku server");
	var port = process.env["PORT"];
	if(port == null) {
		port = "5000";
	}
	console.log("port: " + port);
	this.app = new js_npm_Express();
	this.server = js_node_Http.createServer(this.app);
	MainHeroku.io = new js_npm_socketio_Server(this.server);
	this.app["use"](new js_npm_express_Favicon(__dirname + "/favicon.ico"));
	this.app["use"](new js_npm_express_Morgan("dev"));
	this.app["use"](js_npm_express_BodyParser.json());
	this.app["use"](js_npm_express_BodyParser.urlencoded({ extended : true}));
	this.app["use"](new js_npm_express_Static(js_node_Path.join(__dirname,"public")));
	this.app["use"](new js_npm_express_CookieParser());
	this.app["use"](new js_npm_express_Session({ secret : "example", resave : true, saveUninitialized : true}));
	server_Router.init(this.app);
	MainHeroku.io.on("connection",function(socket) {
		socket.emit("message",{ message : "Welcome from the Heroku server - " + "[Skeletor]"});
		socket.on("send",function(data) {
			MainHeroku.io.sockets.emit("id",data.id);
			console.log("send data -> " + Std.string(data.id));
		});
		socket.on("disconnect",function(data1) {
			console.log("user disconnected");
		});
	});
	this.app["use"](function(req,res,next) {
		res.status(404).send("404");
	});
	this.server.listen(port);
	console.log("Listening on port: " + port + " (http://localhost:" + port + ")");
};
MainHeroku.__name__ = true;
MainHeroku.main = function() {
	var app = new MainHeroku();
};
Math.__name__ = true;
var Std = function() { };
Std.__name__ = true;
Std.string = function(s) {
	return js_Boot.__string_rec(s,"");
};
var haxe_io_Bytes = function() { };
haxe_io_Bytes.__name__ = true;
var js_Boot = function() { };
js_Boot.__name__ = true;
js_Boot.__string_rec = function(o,s) {
	if(o == null) {
		return "null";
	}
	if(s.length >= 5) {
		return "<...>";
	}
	var t = typeof(o);
	if(t == "function" && (o.__name__ || o.__ename__)) {
		t = "object";
	}
	switch(t) {
	case "function":
		return "<function>";
	case "object":
		if(o instanceof Array) {
			if(o.__enum__) {
				if(o.length == 2) {
					return o[0];
				}
				var str = o[0] + "(";
				s += "\t";
				var _g1 = 2;
				var _g = o.length;
				while(_g1 < _g) {
					var i = _g1++;
					if(i != 2) {
						str += "," + js_Boot.__string_rec(o[i],s);
					} else {
						str += js_Boot.__string_rec(o[i],s);
					}
				}
				return str + ")";
			}
			var l = o.length;
			var i1;
			var str1 = "[";
			s += "\t";
			var _g11 = 0;
			var _g2 = l;
			while(_g11 < _g2) {
				var i2 = _g11++;
				str1 += (i2 > 0 ? "," : "") + js_Boot.__string_rec(o[i2],s);
			}
			str1 += "]";
			return str1;
		}
		var tostr;
		try {
			tostr = o.toString;
		} catch( e ) {
			return "???";
		}
		if(tostr != null && tostr != Object.toString && typeof(tostr) == "function") {
			var s2 = o.toString();
			if(s2 != "[object Object]") {
				return s2;
			}
		}
		var k = null;
		var str2 = "{\n";
		s += "\t";
		var hasp = o.hasOwnProperty != null;
		for( var k in o ) {
		if(hasp && !o.hasOwnProperty(k)) {
			continue;
		}
		if(k == "prototype" || k == "__class__" || k == "__super__" || k == "__interfaces__" || k == "__properties__") {
			continue;
		}
		if(str2.length != 2) {
			str2 += ", \n";
		}
		str2 += s + k + " : " + js_Boot.__string_rec(o[k],s);
		}
		s = s.substring(1);
		str2 += "\n" + s + "}";
		return str2;
	case "string":
		return o;
	default:
		return String(o);
	}
};
var js_node_Http = require("http");
var js_node_Path = require("path");
var js_node_buffer_Buffer = require("buffer").Buffer;
var js_npm_Express = require("express");
var js_npm_express_BodyParser = require("body-parser");
var js_npm_express_CookieParser = require("cookie-parser");
var js_npm_express_Favicon = require("serve-favicon");
var js_npm_express_Morgan = require("morgan");
var js_npm_express_Session = require("express-session");
var js_npm_express_Static = require("express").static;
var js_npm_socketio_Server = require("socket.io");
var model_constants_App = function() { };
model_constants_App.__name__ = true;
var server_Controller = function() { };
server_Controller.__name__ = true;
server_Controller.index = function(req,res) {
	res.sendfile(__dirname + "/public/_index.html");
};
server_Controller.logout = function(req,res) {
	res.redirect("/");
};
server_Controller.login = function(req,res) {
	res.sendfile(__dirname + "/public/login.html");
};
server_Controller.loginPost = function(req,res) {
	res.sendfile(__dirname + "/public/secure.html");
};
server_Controller.api = function(req,res) {
	res.send("api: " + model_constants_App.BUILD);
};
server_Controller.apiPost = function(req,res) {
	console.log("api");
	console.log(req);
	console.log(res);
};
server_Controller.ping = function(req,res) {
	res.send("test:ping");
	var io = MainHeroku.io;
	io.sockets.emit("test:ping","[Skeletor]");
};
server_Controller.version = function(req,res) {
	res.send("version: " + model_constants_App.BUILD);
	var io = MainHeroku.io;
	io.sockets.emit("version",model_constants_App.BUILD);
};
server_Controller.secure = function(req,res) {
	res.sendfile(__dirname + "/public/secure.html");
	var io = MainHeroku.io;
	io.sockets.emit("version",model_constants_App.BUILD);
};
server_Controller.update = function(req,res) {
	res.send("update: " + model_constants_App.BUILD);
	var io = MainHeroku.io;
	io.sockets.emit("update",model_constants_App.BUILD);
};
var server_Router = function() { };
server_Router.__name__ = true;
server_Router.init = function(app) {
	app.get("/",server_Controller.index);
	app.get("/secure",server_Controller.secure);
	app.get("/ping",server_Controller.ping);
	app.get("/update",server_Controller.update);
	app.get("/version",server_Controller.version);
	app.get("/logout",server_Controller.logout);
	app.get("/login",server_Controller.login);
	app.post("/login",server_Controller.loginPost);
	app.get("/api",server_Controller.api);
	app.post("/api",server_Controller.apiPost);
};
String.__name__ = true;
Array.__name__ = true;
model_constants_App.BUILD = "2017-11-10 21:29:47";
MainHeroku.main();
})();

//# sourceMappingURL=index.js.map