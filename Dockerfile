FROM node:6-stretch

RUN apt-get update &&\
    apt-get install -y locales ruby-full python-pip &&\
    apt-get clean

RUN pip install awscli --upgrade --user
ENV PATH=~/.local/bin:$PATH

RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/locale.conf
RUN locale-gen en_US.UTF-8

ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8

RUN npm install -g ionic@2.1.18 cordova code-push-cli
RUN gem install fastlane -NV

ENTRYPOINT ["/bin/bash"]