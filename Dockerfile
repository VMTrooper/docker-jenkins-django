FROM jenkins
# if we want to install via apt
USER root
RUN apt-get update && apt-get install -y ruby make more-thing-here
USER jenkins # drop back to the regular jenkins user - good practice
COPY plugins.txt /usr/share/jenkins/ref/
COPY custom.groovy /usr/share/jenkins/ref/init.groovy.d/custom.groovy
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
