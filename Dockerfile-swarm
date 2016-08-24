FROM jenkins:2.7.2
MAINTAINER adrien.missemer@gmail.com

USER root
RUN apt-get update && apt-get install -y rsync && rm -rf /var/lib/apt/lists/*
USER jenkins

WORKDIR $JENKINS_HOME
ENV BASE_PLUGINS \
	build-user-vars \
	git \
	groovy \
	swarm
RUN install-plugins.sh $BASE_PLUGINS

COPY ref-config /usr/share/jenkins/ref
COPY entrypoint.sh  /usr/local/bin/
COPY upgrade /usr/local/bin/
ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/entrypoint.sh"]
