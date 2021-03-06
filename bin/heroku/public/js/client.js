// Generated by Haxe 4.1.4
(function ($global) { "use strict";
function $extend(from, fields) {
	var proto = Object.create(from);
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
	console.log("src/MainClient.hx:23:","body.id : " + window.document.body.id);
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
			console.log("src/MainClient.hx:44:","page-home");
			break;
		case "page-list":
			this.initPageList();
			break;
		case "page-toggle":
			this.initPageToggle();
			break;
		default:
			console.log("src/MainClient.hx:55:","case '" + pageid + "': trace ('" + pageid + "');");
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
		console.log("src/MainClient.hx:82:","initPageToggle");
		this.socket.on("toggle:init",function(data) {
			console.log("src/MainClient.hx:87:","client - toggle:init -> " + JSON.stringify(data));
			(js_Boot.__cast(window.document.getElementById("toggle-button") , HTMLInputElement)).checked = data.checked;
		});
		this.socket.on("toggle:ischecked",function(data) {
			console.log("src/MainClient.hx:91:","client - toggle:ischecked -> " + JSON.stringify(data));
			(js_Boot.__cast(window.document.getElementById("toggle-button") , HTMLInputElement)).checked = data.checked;
		});
		console.log("src/MainClient.hx:96:","fix this buttton");
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
			var vm = this;
			Vue.http.get("http://localhost:5000/api/id").then(function(response) {
				var temp = [{ message : "zzz Something clever as point one"},{ message : "zzz But more important is point two"}];
				vm.itemz = temp;
				vm.items = response.body;
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
var haxe_Exception = function(message,previous,native) {
	Error.call(this,message);
	this.message = message;
	this.__previousException = previous;
	this.__nativeException = native != null ? native : this;
};
haxe_Exception.__name__ = true;
haxe_Exception.thrown = function(value) {
	if(((value) instanceof haxe_Exception)) {
		return value.get_native();
	} else if(((value) instanceof Error)) {
		return value;
	} else {
		var e = new haxe_ValueException(value);
		return e;
	}
};
haxe_Exception.__super__ = Error;
haxe_Exception.prototype = $extend(Error.prototype,{
	get_native: function() {
		return this.__nativeException;
	}
	,__class__: haxe_Exception
});
var haxe_ValueException = function(value,previous,native) {
	haxe_Exception.call(this,String(value),previous,native);
	this.value = value;
};
haxe_ValueException.__name__ = true;
haxe_ValueException.__super__ = haxe_Exception;
haxe_ValueException.prototype = $extend(haxe_Exception.prototype,{
	__class__: haxe_ValueException
});
var haxe_iterators_ArrayIterator = function(array) {
	this.current = 0;
	this.array = array;
};
haxe_iterators_ArrayIterator.__name__ = true;
haxe_iterators_ArrayIterator.prototype = {
	hasNext: function() {
		return this.current < this.array.length;
	}
	,next: function() {
		return this.array[this.current++];
	}
	,__class__: haxe_iterators_ArrayIterator
};
var js_Boot = function() { };
js_Boot.__name__ = true;
js_Boot.getClass = function(o) {
	if(o == null) {
		return null;
	} else if(((o) instanceof Array)) {
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
		if(((o) instanceof Array)) {
			var str = "[";
			s += "\t";
			var _g = 0;
			var _g1 = o.length;
			while(_g < _g1) {
				var i = _g++;
				str += (i > 0 ? "," : "") + js_Boot.__string_rec(o[i],s);
			}
			str += "]";
			return str;
		}
		var tostr;
		try {
			tostr = o.toString;
		} catch( _g ) {
			return "???";
		}
		if(tostr != null && tostr != Object.toString && typeof(tostr) == "function") {
			var s2 = o.toString();
			if(s2 != "[object Object]") {
				return s2;
			}
		}
		var str = "{\n";
		s += "\t";
		var hasp = o.hasOwnProperty != null;
		var k = null;
		for( k in o ) {
		if(hasp && !o.hasOwnProperty(k)) {
			continue;
		}
		if(k == "prototype" || k == "__class__" || k == "__super__" || k == "__interfaces__" || k == "__properties__") {
			continue;
		}
		if(str.length != 2) {
			str += ", \n";
		}
		str += s + k + " : " + js_Boot.__string_rec(o[k],s);
		}
		s = s.substring(1);
		str += "\n" + s + "}";
		return str;
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
		var _g = 0;
		var _g1 = intf.length;
		while(_g < _g1) {
			var i = _g++;
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
		return ((o) instanceof Array);
	case Bool:
		return typeof(o) == "boolean";
	case Dynamic:
		return o != null;
	case Float:
		return typeof(o) == "number";
	case Int:
		if(typeof(o) == "number") {
			return ((o | 0) === o);
		} else {
			return false;
		}
		break;
	case String:
		return typeof(o) == "string";
	default:
		if(o != null) {
			if(typeof(cl) == "function") {
				if(js_Boot.__downcastCheck(o,cl)) {
					return true;
				}
			} else if(typeof(cl) == "object" && js_Boot.__isNativeObj(cl)) {
				if(((o) instanceof cl)) {
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
		return false;
	}
};
js_Boot.__downcastCheck = function(o,cl) {
	if(!((o) instanceof cl)) {
		if(cl.__isInterface__) {
			return js_Boot.__interfLoop(js_Boot.getClass(o),cl);
		} else {
			return false;
		}
	} else {
		return true;
	}
};
js_Boot.__cast = function(o,t) {
	if(o == null || js_Boot.__instanceof(o,t)) {
		return o;
	} else {
		throw haxe_Exception.thrown("Cannot cast " + Std.string(o) + " to " + Std.string(t));
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
var Int = { };
var Dynamic = { };
var Float = Number;
var Bool = Boolean;
var Class = { };
var Enum = { };
js_Boot.__toStr = ({ }).toString;
MainClient.main();
})(typeof window != "undefined" ? window : typeof global != "undefined" ? global : typeof self != "undefined" ? self : this);

//# sourceMappingURL=client.js.map