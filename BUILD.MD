# Build Example Node.js Heroku

Default methode to build this project

```
cd '/path/to/this/folder'
haxe build.hxml
echo done
```

# Type of build

- `build.hxml` 			: default start for (debug) build
- `build_all.hxml` 		: start release and debug build
- `build_debug.hxml` 	: start for (debug) build
- `build_release.hxml` 	: start for (release) build


# Build Example Node.js Heroku and start node.js

```
cd '/path/to/this/folder/bin/www'
open -a Google\ Chrome http://localhost:2000/
nekotools server

```

# Build Example Node.js Heroku using NPM watch

```
cd '/path/to/this/folder'
npm run watch

```

# Install all (haxe)dependencies with haxelib
```
haxelib install build.hxml
```

# Install all (node)dependencies with NPM (node.js)
```
npm install
```

