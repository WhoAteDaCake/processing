REPO_TAG=whoatedacakeidid/twitter-scraper:latest
NAME=twitter-scraper

docker build -t twitter-scraper .
ID=$(docker images -q twitter-scraper)
docker tag $ID $REPO_TAG
docker push $REPO_TAG
