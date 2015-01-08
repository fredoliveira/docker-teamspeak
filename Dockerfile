FROM docker.io/ubuntu:vivid
MAINTAINER Edgard Castro <castro@edgard.org>

# Keep image updated
ENV REFRESHED_AT 2015-07-28-05-16Z

# Add repositories and update base
RUN echo "deb http://archive.ubuntu.com/ubuntu/ vivid main restricted universe multiverse" > /etc/apt/sources.list \
  && echo "deb http://archive.ubuntu.com/ubuntu/ vivid-updates main restricted universe multiverse" >> /etc/apt/sources.list \
  && echo "deb http://archive.ubuntu.com/ubuntu/ vivid-backports main restricted universe multiverse" >> /etc/apt/sources.list \
  && echo "deb http://security.ubuntu.com/ubuntu vivid-security main restricted universe multiverse" >> /etc/apt/sources.list \
  && apt-get update -q \
  && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -qy

# Install software
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends ca-certificates curl \
  && curl -Ls http://dl.4players.de/ts/releases/3.0.11.3/teamspeak3-server_linux-amd64-3.0.11.3.tar.gz | tar zxf - -C /tmp \
  && mv /tmp/teamspeak3-server_linux-amd64 /opt/teamspeak \
  && apt-get clean \
  && rm -rf /var/lib/apt /tmp/* /var/tmp/*

# Add custom files
COPY files/root /

# Start command
CMD ["/start"]
