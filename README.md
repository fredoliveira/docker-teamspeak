
This container runs TeamSpeak3.

## Starting the container
    docker run -d --restart=always --name teamspeak -p 9987:9987/udp -p 10011:10011 -p 30033:30033 -v /data/teamspeak:/data skardoska/teamspeak

All your Teamspeak server files are in /data/teamspeak


## Migrating your Teamspeak server to Docker?
Just put all your Teamspeak server files in the folder /data/teamspeak on your host machine and start the container.
