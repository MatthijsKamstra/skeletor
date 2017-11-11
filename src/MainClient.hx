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
		new JQuery(document).ready ( function () {
			trace ("MainClient document ready!");
			if(window.location.href.indexOf('localhost') != -1){
				url = 'http://localhost:${App.PORT}';
			} else {
				url = '${App.URL}';
			}

			trace('body.id : ${document.body.id}');

			init(document.body.id);
		});
	}


	private function init(pageid:String) {

	  	socket = js.browser.SocketIo.connect(url);

		switch (pageid) {
			case 'page-home': trace ('page-home');
			case 'page-toggle':
				trace ('page-toggle');
				initPageToggle();
			default : trace ("case '"+pageid+"': trace ('"+pageid+"');");
		}


		// showSnackbar('hello');
		initVue();
		initSocket();
	}


	function initPageToggle(){
		trace('initPageToggle');

		socket.on('toggle', function (data) {
			trace('client - toggle :: ${haxe.Json.stringify(data)}');
			cast(document.getElementById('toggle-button'), js.html.InputElement ).checked = data.checked;
		});

		new JQuery('#toggle-button').click(function(e){
			// e.preventDefault();
			trace('client - toggle');
			var isChecked = cast(document.getElementById('toggle-button'), js.html.InputElement ).checked;
			socket.emit('toggle', { checked: isChecked });
		});

	}

	var loading : Vue;
	var app : Vue;
	var example1 : Vue;
	var example2 : Vue;

	function initVue(){
		loading = new Vue({
			el: '#loading',
			data: {
				showloading: true
			}
		});
		app = new Vue({
			el: '#app',
			data: {
				message: 'Hello Vue.js!'
			}
		});
		if(document.getElementById('example-1') != null){
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
		if(document.getElementById('example-2') != null){
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
    		app.data.message = data.message;
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