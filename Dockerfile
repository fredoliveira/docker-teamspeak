FROM docker.io/ubuntu:wily
MAINTAINER Koen Janssen <koen253janssen@gmail.com>

# Keep image updated
ENV REFRESHED_AT 2015-10-22-23-15Z

#Create Shared volume for Teamspeak Server Files
VOLUME ["/data/teamspeak"]

# Add repositories and update base
RUN echo "deb http://archive.ubuntu.com/ubuntu/ wily main restricted universe multiverse" > /etc/apt/sources.list \
  && echo "deb http://archive.ubuntu.com/ubuntu/ wily-updates main restricted universe multiverse" >> /etc/apt/sources.list \
  && echo "deb http://archive.ubuntu.com/ubuntu/ wily-backports main restricted universe multiverse" >> /etc/apt/sources.list \
  && echo "deb http://security.ubuntu.com/ubuntu wily-security main restricted universe multiverse" >> /etc/apt/sources.list \
  && apt-get update -q \
  && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -qy

# Install software
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends ca-certificates curl \
  && curl -Ls http://dl.4players.de/ts/releases/3.0.11.4/teamspeak3-server_linux-amd64-3.0.11.4.tar.gz | tar zxf - -C /tmp \
  && mv /tmp/teamspeak3-server_linux-amd64 /opt/teamspeak \
  && apt-get clean \
  && rm -rf /var/lib/apt /tmp/* /var/tmp/*
  

RUN useradd -s /bin/bash -d /data/teamspeak -m teamspeak
 # Change owner folder to make sure container can write to the volume
RUN chown -R teamspeak.teamspeak /data/teamspeak/
# Change permission folder to make sure container can write to the volume
RUN chmod 755 -R /data/teamspeak  

# Add custom files
COPY files/root /

# Start command
CMD ["/start"]
