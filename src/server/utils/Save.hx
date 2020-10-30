package server.utils;

import js.Node;

class Save {
	public static var writeCounter = 0;

	public function new() {
		// your code
	}

	public static function file(filename:String, str:String) {
		trace('${writeCounter}. --> write  "/_data/$filename"');

		var dir = Node.__dirname + '/_data/${haxe.io.Path.directory(filename)}';
		if (!sys.FileSystem.exists(dir))
			sys.FileSystem.createDirectory(dir);

		sys.io.File.saveContent(Node.__dirname + '/_data/${filename}', str);
		writeCounter++;
	}
}
