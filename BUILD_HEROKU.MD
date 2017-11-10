# BUILD heroku

<https://devcenter.heroku.com/articles/getting-started-with-nodejs#introduction>


<https://stark-headland-86755.herokuapp.com/>


<https://devcenter.heroku.com/articles/node-websockets>

```
heroku login
# get version of node, npm and git
node -v
npm -v
git --version
```

push

```
git add *
git commit -m "Commit message"
git push heroku master
heroku ps:scale web=1
heroku open
```

run locally

```
echo `Open http://localhost:5000 with your web browser!`
echo `Ctrl+C to exit`
heroku local web
```

logs

```bash
heroku logs --tail
```

## using socket.io

<https://devcenter.heroku.com/articles/node-websockets#option-2-socket-io>

```
heroku features:enable http-session-affinity
```
