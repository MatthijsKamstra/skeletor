# Skeletor

![](skeletor.jpg)

I do a lot of experiments with Haxe and Node.js and something like this is usually how I start things.

It seems a good idea to make a skeleton project for this.


## Desciption project

this is a bootstrap project for a quick backend in node.js (usually deployed to Heroku)

- [Haxe](http://www.haxe.org) The Cross-platform Toolkit for transpiling to javascript
- [Bootstrap](https://getbootstrap.com/docs/4.0/) for css framework
- [Express.js](https://expressjs.com/) Fast, unopinionated, minimalist web framework for Node.js
- [Socket.io](https://socket.io/) FEATURING THE FASTEST AND MOST RELIABLE REAL-TIME ENGINE
- [Vue.js](https://vuejs.org/) a progressive framework for building user interfaces.
- [Fontawesome](http://fontawesome.io/icons/) for nice icons
- Simple authencation : based upon Sessions
- toggle button with socket action back and forth
- basic api
- example code vue.js
- vue.js http json example
- templating for navbar (haxe templating?) #WIP

## TODO

- json db (Heroku doesn't save files saved in folder like `.json` db , but locally saved data can be uploaded)
- pass/user in json.db
- use [haxelow](https://github.com/ciscoheat/haxelow) / lowdb for db



## Json definition aka AST

Easy way to make AST files for `.json`

<http://matthijskamstra.github.io/hxjsondef/>

## Install

```
haxelib install
```

Some stuff that doesn't load easily by haxelib

```
# haxe-js-kit for externs
haxelib git js-kit https://github.com/clemos/haxe-js-kit.git haxelib

# I sometimes use my personal set haxe-externs
haxelib git hxexterns https://github.com/MatthijsKamstra/hxexterns.git

# cutting edge vue.js externs
haxelib git vue https://github.com/MatthijsKamstra/Vue.hx.git
```


## Files

```
- package.json (I only use this for `watch`)
+ bin
	- package.json (here are your files node.js needs to work)
```



## vscode

To make it work with vscode you need build files without:

- c
- v



## sources

simple session based login (no db)

- https://gist.github.com/smebberson/1581536
- https://www.codementor.io/emjay/how-to-build-a-simple-session-based-authentication-system-with-nodejs-from-scratch-6vn67mcy3
- http://www.codexpedia.com/node-js/a-very-basic-session-auth-in-node-js-with-express-js/


rest api

- https://medium.com/@jeffandersen/building-a-node-js-rest-api-with-express-46b0901f29b6
- http://thejackalofjavascript.com/architecting-a-restful-node-js-app/
- https://www.rapiddg.com/blog/calling-rest-api-nodejs-script


token

- https://medium.freecodecamp.org/securing-node-js-restful-apis-with-json-web-tokens-9f811a92bb52



