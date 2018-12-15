# This should just be used for local deployment
NAME=whoatedacakeidid/processing-postgres
ID=$(docker ps -aqf "name=pg-docker")
#docker stop $ID

VOLUME="$HOME/docker/volumes/postgres"

# To allow export scripts to run again
sudo rm -rf $VOLUME
mkdir -p $VOLUME
docker run --rm --name pg-docker \
	-e POSTGRES_USER=postgres \
	-e POSTGRES_PASSWORD=docker \
	-e POSTGRES_DB=content \
	-p 5432:5432 \
	-v $VOLUME:/var/lib/postgresql/data $NAME

echo $(docker ps -aqf "name=pg-docker")
