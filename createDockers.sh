cp go.Dockerfile Dockerfile
docker build -t s2_go:v1 .
mkdir s2_docker
docker save s2_go:v1 -o s2_docker/go.tar
cp mongoDB.Dockerfile Dockerfile
docker build -t s2_mongodb:v1 .
docker save s2_mongodb:v1 -o s2_docker/mongodb.tar
ls -l s2_docker
cache store $SEMAPHORE_PROJECT_NAME-$SEMAPHORE_GIT_SHA s2_docker
