# openspherebuilder
build opensphere client

# Build docker image
docker build .

# Run the docker image
docker run imageid -v $pwd:/web-content
