docker-teamspeak
----------------
This container runs TeamSpeak3.

Running manually
----------------
    docker build -t edgard/teamspeak .
    docker run -d --name teamspeak -p 9987:9987/udp -p 10011:10011 -p 30033:30033 -v /srv/teamspeak:/data edgard/teamspeak

Running with make tasks
-----------------------
* **build**: build image
* **start**: start container in background
* **test**: start temporary test container *teamspeak-test*
* **test-stop**: stop and remove temporary test container
* **run**: start interactive container
* **push**: push image to docker hub

Check *Makefile* for additional information.
