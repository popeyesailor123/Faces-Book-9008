# faces-book-node
- Look at a person's face and try to remember their name.
- Hover the cursor over their face.
- Their name will appear.
- Were you right?


To run the bare html...

- open ''file:'' in your browser and navigate to ''faces-book-raw-html/app/public/index.html''

If you want to run it from its Node Express web-server...

- ensure Node v8+ is installed

```
./sh/npm_install.sh
./sh/npm_start.sh 81
```

- Your FacesBook app is now running on ''localhost:81'' (stop it with Control-C)
- You can test it by poking it with curl (which needs the server to be up)
```
./sh/run_curl_tests.sh 81
```

- You can test it by running the js unit tests (which does not need the server to be up)
```
./sh/run_node_js_tests.sh
```

- If you have docker installed you can build and test and run it from a docker container
```
./sh/docker_pipe.sh 81
```

- If you have docker-toolbox installed you can build and test and run it from a docker container
```
./sh/docker_toolbox_pipe.sh 81
```

- Your docker container will now be up on port 81
- To find your public IP address you can use
```
curl ifconfig.me
```

Implemented using
[Node](https://nodejs.org/en/),
[Express](https://expressjs.com/) and
[Docker](https://www.docker.com/)

Hi everyone!

![screenshot-2018](/img/faces-book-2018.jpg)
![screenshot-2017](/img/faces-book-2017.jpg)
