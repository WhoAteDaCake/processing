REPO_TAG=whoatedacakeidid/twitter-scraper:latest
NAME=twitter-scraper

docker build -t $NAME .
ID=$(docker images -q $NAME)
docker tag $ID $REPO_TAG
docker push $REPO_TAG
