FROM ubuntu

RUN apt-get update
RUN apt-get install -y gnupg

# Add the package verification key
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4

RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list
RUN apt-get update
RUN apt-get install -y mongodb-10gen

# Create the default data directory
RUN mkdir -p /data/db
EXPOSE 27017
CMD ["--port 27017", "--smallfiles"]
ENTRYPOINT usr/bin/mongod

