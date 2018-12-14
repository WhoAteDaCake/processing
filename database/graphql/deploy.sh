REPO_TAG=whoatedacakeidid/processing-graphql:latest
NAME=processing-graphql

docker build -t $NAME .
ID=$(docker images -q $NAME)
docker tag $ID $REPO_TAG
docker push $REPO_TAG
