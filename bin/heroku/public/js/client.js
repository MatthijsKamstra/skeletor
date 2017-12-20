// Generated by Haxe 3.4.4
(function ($global) { "use strict";
function $extend(from, fields) {
	function Inherit() {} Inherit.prototype = from; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var MainClient = function() {
	if(window.location.href.indexOf("localhost") != -1) {
		this.url = "http://localhost:" + "5000";
	} else {
		this.url = "https://skeletor.herokuapp.com/";
	}
	this.socket = io.connect(this.url);
	console.log("body.id : " + window.document.body.id);
	this.init(window.document.body.id);
};
MainClient.__name__ = true;
MainClient.main = function() {
	var main = new MainClient();
};
MainClient.prototype = {
	init: function(pageid) {
		switch(pageid) {
		case "page-about":
			this.initPageAbout();
			break;
		case "page-admin-users":
			this.initPageAdminUsers();
			break;
		case "page-home":
			console.log("page-home");
			break;
		case "page-list":
			this.initPageList();
			break;
		case "page-toggle":
			this.initPageToggle();
			break;
		default:
			console.log("case '" + pageid + "': trace ('" + pageid + "');");
		}
	}
	,initPageAdminUsers: function() {
		var vm = new Vue({ el : "#app", data : { message : "Hello to " + "[Skeletor]" + "!", ok : true, items : []}});
		this.socket.on("admin:users:set",function(data) {
			vm.$data.ok = !data.ok;
			vm.$data.items = data.data;
		});
		this.socket.emit("admin:user:get");
	}
	,initPageToggle: function() {
		var _gthis = this;
		console.log("initPageToggle");
		this.socket.on("toggle:init",function(data) {
			console.log("client - toggle:init -> " + JSON.stringify(data));
			(js_Boot.__cast(window.document.getElementById("toggle-button") , HTMLInputElement)).checked = data.checked;
		});
		this.socket.on("toggle:ischecked",function(data1) {
			console.log("client - toggle:ischecked -> " + JSON.stringify(data1));
			(js_Boot.__cast(window.document.getElementById("toggle-button") , HTMLInputElement)).checked = data1.checked;
		});
		$("#toggle-button").click(function(e) {
			var isChecked = (js_Boot.__cast(window.document.getElementById("toggle-button") , HTMLInputElement)).checked;
			_gthis.socket.emit("toggle:send",{ checked : isChecked});
			console.log("client - toggle:send -> checked : " + (isChecked == null ? "null" : "" + isChecked));
		});
	}
	,initPageAbout: function() {
		var _gthis = this;
		new Vue({ el : "#app", data : { message : "Hello to " + "[Skeletor]" + "!", items : [{ message : "Something clever as point one"},{ message : "But more important is point two"}]}});
		this.showLoading(true);
		setTimeout(function() {
			_gthis.showLoading(false);
		},3000);
	}
	,initPageList: function() {
		var _gthis = this;
		this.showLoading(true);
		var vm = new Vue({ el : "#app", data : { message : "Hello to " + "[Skeletor]" + "!", testArr : [{ "id" : "foo"}], items : [], itemz : [{ message : "z Something clever as point one"},{ message : "z But more important is point two"}]}, created : function() {
			var vm1 = this;
			Vue.http.get("http://localhost:5000/api/id").then(function(response) {
				var temp = [{ message : "zzz Something clever as point one"},{ message : "zzz But more important is point two"}];
				vm1.itemz = temp;
				vm1.items = response.body;
				_gthis.showLoading(false);
			});
		}});
	}
	,showLoading: function(isLoading,isDark) {
		if(isDark == null) {
			isDark = false;
		}
		var x = window.document.getElementById("loading");
		if(x == null) {
			var div = window.document.createElement("div");
			div.id = "loading";
			div.innerHTML = "<i class=\"fa fa-refresh fa-spin fa-3x fa-fw\"></i><span class=\"sr-only\">Loading...</span>";
			window.document.body.appendChild(div);
			x = div;
		}
		if(isLoading) {
			x.className = "show";
		} else {
			x.className = "hide";
		}
	}
	,__class__: MainClient
};
Math.__name__ = true;
var Std = function() { };
Std.__name__ = true;
Std.string = function(s) {
	return js_Boot.__string_rec(s,"");
};
var js__$Boot_HaxeError = function(val) {
	Error.call(this);
	this.val = val;
	this.message = String(val);
	if(Error.captureStackTrace) {
		Error.captureStackTrace(this,js__$Boot_HaxeError);
	}
};
js__$Boot_HaxeError.__name__ = true;
js__$Boot_HaxeError.wrap = function(val) {
	if((val instanceof Error)) {
		return val;
	} else {
		return new js__$Boot_HaxeError(val);
	}
};
js__$Boot_HaxeError.__super__ = Error;
js__$Boot_HaxeError.prototype = $extend(Error.prototype,{
	__class__: js__$Boot_HaxeError
});
var js_Boot = function() { };
js_Boot.__name__ = true;
js_Boot.getClass = function(o) {
	if((o instanceof Array) && o.__enum__ == null) {
		return Array;
	} else {
		var cl = o.__class__;
		if(cl != null) {
			return cl;
		}
		var name = js_Boot.__nativeClassName(o);
		if(name != null) {
			return js_Boot.__resolveNativeClass(name);
		}
		return null;
	}
};
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
js_Boot.__interfLoop = function(cc,cl) {
	if(cc == null) {
		return false;
	}
	if(cc == cl) {
		return true;
	}
	var intf = cc.__interfaces__;
	if(intf != null) {
		var _g1 = 0;
		var _g = intf.length;
		while(_g1 < _g) {
			var i = _g1++;
			var i1 = intf[i];
			if(i1 == cl || js_Boot.__interfLoop(i1,cl)) {
				return true;
			}
		}
	}
	return js_Boot.__interfLoop(cc.__super__,cl);
};
js_Boot.__instanceof = function(o,cl) {
	if(cl == null) {
		return false;
	}
	switch(cl) {
	case Array:
		if((o instanceof Array)) {
			return o.__enum__ == null;
		} else {
			return false;
		}
		break;
	case Bool:
		return typeof(o) == "boolean";
	case Dynamic:
		return true;
	case Float:
		return typeof(o) == "number";
	case Int:
		if(typeof(o) == "number") {
			return (o|0) === o;
		} else {
			return false;
		}
		break;
	case String:
		return typeof(o) == "string";
	default:
		if(o != null) {
			if(typeof(cl) == "function") {
				if(o instanceof cl) {
					return true;
				}
				if(js_Boot.__interfLoop(js_Boot.getClass(o),cl)) {
					return true;
				}
			} else if(typeof(cl) == "object" && js_Boot.__isNativeObj(cl)) {
				if(o instanceof cl) {
					return true;
				}
			}
		} else {
			return false;
		}
		if(cl == Class ? o.__name__ != null : false) {
			return true;
		}
		if(cl == Enum ? o.__ename__ != null : false) {
			return true;
		}
		return o.__enum__ == cl;
	}
};
js_Boot.__cast = function(o,t) {
	if(js_Boot.__instanceof(o,t)) {
		return o;
	} else {
		throw new js__$Boot_HaxeError("Cannot cast " + Std.string(o) + " to " + Std.string(t));
	}
};
js_Boot.__nativeClassName = function(o) {
	var name = js_Boot.__toStr.call(o).slice(8,-1);
	if(name == "Object" || name == "Function" || name == "Math" || name == "JSON") {
		return null;
	}
	return name;
};
js_Boot.__isNativeObj = function(o) {
	return js_Boot.__nativeClassName(o) != null;
};
js_Boot.__resolveNativeClass = function(name) {
	return $global[name];
};
String.prototype.__class__ = String;
String.__name__ = true;
Array.__name__ = true;
var Int = { __name__ : ["Int"]};
var Dynamic = { __name__ : ["Dynamic"]};
var Float = Number;
Float.__name__ = ["Float"];
var Bool = Boolean;
Bool.__ename__ = ["Bool"];
var Class = { __name__ : ["Class"]};
var Enum = { };
js_Boot.__toStr = ({ }).toString;
MainClient.main();
})(typeof window != "undefined" ? window : typeof global != "undefined" ? global : typeof self != "undefined" ? self : this);

//# sourceMappingURL=client.js.map