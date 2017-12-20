package;

import js.jquery.JQuery;
import js.Browser.*;
import js.html.*;

import vue.Vue;

import model.constants.App;

class MainClient {

	var url : String;
	var socket : Dynamic;
	var _inputField : InputElement;

	public function new() {
		// [mck] bot sure this is clever... but we will find out
		if(window.location.href.indexOf('localhost') != -1){
			url = 'http://localhost:${App.PORT}';
		} else {
			url = '${App.URL}';
		}
		socket = js.browser.SocketIo.connect(url);

		trace('body.id : ${document.body.id}');
		init(document.body.id);



		// new JQuery(document).ready ( function () {
		// 	trace ("MainClient document ready!");
		// if(window.location.href.indexOf('localhost') != -1){
		// 	url = 'http://localhost:${App.PORT}';
		// } else {
		// 	url = '${App.URL}';
		// }

		// socket = js.browser.SocketIo.connect(url);
		// trace('body.id : ${document.body.id}');

		// init(document.body.id);
		// });
	}


	private function init(pageid:String) {
		switch (pageid) {
			case 'page-home': trace ('page-home');
			case 'page-toggle':
				initPageToggle();
			case 'page-about':
				initPageAbout();
			case 'page-list':
				initPageList();
			case 'page-admin-users':
				// trace ('page-admin-users');
				initPageAdminUsers();
			default : trace ("case '"+pageid+"': trace ('"+pageid+"');");
		}
		// showSnackbar('hello');
		// initVue();
		// initSocket();
	}

	function initPageAdminUsers(){
		var vm = new Vue({
			el: '#app',
			data: {
				message: 'Hello to ${App.PROJECT_NAME}!',
				ok : true,
				items : []
			}
		});
		socket.on('admin:users:set', function (data) {
			// trace('client - admin:users:set :: ${haxe.Json.stringify(data)}');
			// trace(data.ok);
			// trace(data.data);
			vm.data.ok = !data.ok;
			vm.data.items = data.data;
		});
		socket.emit('admin:user:get');
	}

	function initPageToggle(){
		trace('initPageToggle');

		// socket.emit('toggle:init', 'test from client');

		socket.on('toggle:init', function (data) {
			trace('client - toggle:init -> ${haxe.Json.stringify(data)}');
			cast(document.getElementById('toggle-button'), js.html.InputElement ).checked = data.checked;
		});
		socket.on('toggle:ischecked', function (data) {
			trace('client - toggle:ischecked -> ${haxe.Json.stringify(data)}');
			cast(document.getElementById('toggle-button'), js.html.InputElement ).checked = data.checked;
		});

		new JQuery('#toggle-button').click(function(e){
			// e.preventDefault();
			var isChecked = cast(document.getElementById('toggle-button'), js.html.InputElement ).checked;
			socket.emit('toggle:send', { checked: isChecked });
			trace('client - toggle:send -> checked : ${isChecked}');
		});

	}

	function initPageAbout (){
		new Vue({
			el: '#app',
			data: {
				message: 'Hello to ${App.PROJECT_NAME}!',
				items: [
					{ message: 'Something clever as point one' },
					{ message: 'But more important is point two' }
				]
			}
		});
		showLoading(true);
		// After 3 seconds, remove the show class from DIV
		untyped setTimeout(function(){
			showLoading(false);
		}, 3000);
	}

	function initPageList (){
		showLoading(true);
		var vm = new Vue({
			el: '#app',
			data: {
				message: 'Hello to ${App.PROJECT_NAME}!',
				testArr: [
					{"id":"foo"}
				],
				items: [],
				itemz: [
					{ message: 'z Something clever as point one' },
					{ message: 'z But more important is point two' }
				]
			},
			created: function (){
				var vm = js.Lib.nativeThis;
				vue.VueResource.get('http://localhost:5000/api/id').then(function(response:vue.VueResource.Response){
					// trace(response.body);
					// var json = (haxe.Json.parse(haxe.Json.stringify(response.body)));

					// trace(json.length);
					// trace(json);

					var temp = [
						{ message: 'zzz Something clever as point one' },
						{ message: 'zzz But more important is point two' }
					];
					vm.itemz = temp;
					vm.items = response.body;
					// vm.items = json;
					showLoading(false);
				});
			}
		});
		// socket.on('list', function (data) {
		// 	trace('${haxe.Json.stringify(data)}');
		// 	// var json : Array<Dynamic>  = data;
		// 	// var arr = [];
		// 	// for (link in json){
		// 	// trace(link);
		// 	// arr.push(link);
		// 	// }
		// 	// example2.data.items = arr;
		// 	// loading.data.showloading = false;
		// 	showLoading(false);
		// });
		// socket.emit('list:get');
	}


	var loading : Vue;
	var app : Vue;
	var example1 : Vue;
	var example2 : Vue;

	function initVue(){
		loading = new Vue({
			el: '#loadingssss',
			data: {
				showloading: true
			}
		});
		app = new Vue({
			el: '#appss',
			data: {
				message: 'Hello Vue.js!'
			}
		});
		if(document.getElementById('example-1sss') != null){
			example1 = new Vue({
				el: '#example-1',
				data: {
					items: [
						{ message: 'Foo' },
						{ message: 'Bar' }
					]
				}
			});
		}
		if(document.getElementById('example-2ssss') != null){
			example2 = new Vue({
				el: '#example-2',
				data: {
					items: [
						{ message: '1Foo' },
						{ message: '2Bar' }
					]
				}
			});
		}



		Vue.component('todo-item', {
			props: ['todo'],
			template: '<li>{{ todo.text }}</li>'
		});
		Vue.component('reaction-item', {
			props: ['react'],
			template: '<span class="badge badge-primary bigger-badge">{{ react.name }} {{ react.count }}</span>'
		});
		var app7 = new Vue({
			el: '#app-7',
			data: {
				groceryList: [
					{ id: 0, text: 'Vegetables' },
					{ id: 1, text: 'Cheese' },
					{ id: 2, text: 'Whatever else humans are supposed to eat' }
				],
				reactions: [
					{ "name": "+1", "users": [ "U2XFA5KM4", "U02BA6Q72" ], "count": 2 },
					{ "name": "-1", "users": [ "U2XFA5KM4" ], "count": 1 }
				]
			},
			computed: {
				totalMarks: function() {
					var total = 100;
					return total;
				}
			}
		});
	}

	function initSocket(){
		socket.on('message', function (data) {
			trace('${haxe.Json.stringify(data)}');
    		// app.data.message = data.message;
			// showSnackbar('connected to server');
		});
		socket.on('channels', function (data) {
			// trace('${haxe.Json.stringify(data)}');
			// var json : api.slack.channel.list.AST.ChannelListObj = data;
			// var arr = [];
			// for (channel in json.channels){
			// 	trace(channel);
			// 	arr.push({message:'id: ${channel.id} / name: ${channel.name} / members: ${channel.members.length}'});
			// }
			// example1.data.items = arr;
			// loading.data.showloading = false;
		});
		socket.on('list.update', function (data) {
			trace('list.update :: ${data}');
		});
		socket.on('list', function (data) {
			trace('${haxe.Json.stringify(data)}');
			var json : Array<Dynamic>  = data;
			var arr = [];
			for (link in json){
				trace(link);
				arr.push(link);
			}
			example2.data.items = arr;
			loading.data.showloading = false;
		});
		socket.on('test:ping', function (data) {
			trace('test:ping');
			showSnackbar('test:ping :: ${data}');
		});

	}

	function showSnackbar(msg:String) {
		// Get the snackbar DIV
		var x = document.getElementById("snackbar");

		// if no #snackbar exists, create it
		if(x == null){
			var div = document.createDivElement();
			div.id = 'snackbar';
			document.body.appendChild(div);
			x = div;
		}

		// set msg to snackbar
		x.innerText = msg;

		// Add the "show" class to DIV
		x.className = "show";

		// After 3 seconds, remove the show class from DIV
		untyped setTimeout(function(){
			x.className = x.className.replace("show", "");
		}, 3000);

	}

	/**
	 *  @param isDark -
	 */
	function showLoading(isLoading:Bool,isDark:Bool = false) {
		// Get the snackbar DIV
		var x = document.getElementById("loading");

		// if no #snackbar exists, create it
		if(x == null){
			var div = document.createDivElement();
			div.id = 'loading';
			div.innerHTML = '<i class="fa fa-refresh fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>';
			document.body.appendChild(div);
			x = div;
		}

		if(isLoading){
			// Add the "show" class to DIV
			x.className = "show";
		} else {
			x.className = "hide";
		}
	}

	// private function sendMessage():Void
	// {
	// 	var text = _inputField.value;
	// 	socket.emit('send', { message: text, username: _inputName.value });
	// 	_inputField.value = "";
	// }


    static public function main(){
			var main = new MainClient();
	}
}