#########################################
# GO - Continuous Devlivery Docker File #
#########################################

FROM ubuntu

MAINTAINER Martin Goyot (Erwyn) <martin@piwany.com>

# Updating apt-get & getting needed dependencies
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y openjdk-7-jre
RUN apt-get install -y unzip

# Get & install the Go server
RUN wget http://download.go.cd/gocd-deb/go-server-14.2.0-377.deb
RUN dpkg -i go-server-14.2.0-377.deb

# Get the Go agent & install it
RUN wget http://download.go.cd/gocd-deb/go-agent-14.2.0-377.deb
RUN dpkg -i go-agent-14.2.0-377.deb

# Start the Go server
CMD /etc/init.d/go-server restart && /etc/init.d/go-agent restart && tail -f /var/log/go-server/go-server.log