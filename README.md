#### Starting a container:

```docker run -d --restart=always --name teamspeak -p 9987:9987/udp -p 10011:10011 -p 30033:30033 -v /data/teamspeak:/data fredoliveira/teamspeak```

Make sure a `data/teamspeak` local folder exists. It will be mapped so that you can backup and restore teamspeak configuration files.

#### Keeping the container running:

See the `upstart-example` and `systemd-example` folders for examples of upstart and systemd scripts respectively.
