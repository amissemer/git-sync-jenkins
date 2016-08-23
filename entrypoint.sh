#!/bin/bash -e

# if upgrade mode
if [[ $# -eq 1 ]] && [[ "$1" == "upgrade" ]]; then
	find /usr/share/jenkins/ref/ -type f -exec bash -c "b={}; rm -f  ~/\${b:23}" \;
	rm -Rf ~/plugins/
	echo "Cleaned up JENKINS_HOME to prepare for upgrade"
fi


# if first boot of new instance
if [ ! -f "config.xml" ]; then
#   if initialization of new project
	if [ ! -f "/usr/share/jenkins/ref/config.xml" ]; then
		export JAVA_OPTS="$JAVA_OPTS -Djenkins.install.state=INITIAL_SECURITY_SETUP"
	fi
fi
# if the ssh key was not initialized yet
if [ ! -f "~/.ssh/id_rsa" ]; then
#   but was provided in the project image
	if [ -f "/usr/share/jenkins/ref/.ssh/id_rsa" ]; then
		cp -Rf /usr/share/jenkins/ref/.ssh ~
		chmod 700 ~/.ssh
		chmod 600 ~/.ssh/*
	else
#       not provided, we generate a new one
		ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
	fi
else
# was initialized, let's make sure the permissions are correct
	chmod 700 ~/.ssh
	chmod 600 ~/.ssh/*
fi

exec /usr/local/bin/jenkins.sh "$@"
