# Skeletor

![](skeletor.jpg)

I do a lot of experiments with Haxe and Node.js and something like this is usually how I start things.

It seems a good idea to make a skeleton project for this.


## Stuff

- Haxe
- Bootstrap : <https://getbootstrap.com/docs/4.0/>
- Express.js
- Socket.io
- Simple autothencation
	- Sessions
- Router
- Vue.js
- Fontawesome : <http://fontawesome.io/icons/>

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

# I sometimes us my personal set haxe-externs
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




