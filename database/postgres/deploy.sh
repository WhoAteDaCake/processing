REPO_TAG=whoatedacakeidid/processing-postgres:latest
NAME=processing-postgres

docker build -t $NAME .
ID=$(docker images -q $NAME)
docker tag $ID $REPO_TAG
docker push $REPO_TAG
