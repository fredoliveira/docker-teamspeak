docker-teamspeak
----------------
This container runs TeamSpeak3.

Running manually
----------------
    docker run -d --restart=always --name teamspeak -p 9987:9987/udp -p 10011:10011 -p 30033:30033 -v /data/teamspeak:/data edgard/teamspeak

