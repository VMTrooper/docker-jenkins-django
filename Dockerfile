FROM jenkins:1.625.3
# if we want to install via apt
USER root
# COPY chromedriver /usr/bin
# RUN deb http://packages.linuxmint.com debian import
RUN apt-get update -qq && apt-get install -qqy python3 python3-pip chromedriver
RUN pip3 install -q pymongo coverage jinja2 django==1.8.4
RUN pip3 install --upgrade selenium
# drop back to the regular jenkins user - good practice
USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
USER root
RUN pip3 install django-jenkins
RUN pip3 install pylint
