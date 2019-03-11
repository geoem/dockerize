## Dockerize

This repository is a collection of self-contained *dockerizers* for some necessary applications of everyday use. Each folder contains its own Dockerfile and a possible docker-compose.yml file when run services in an isolated environment are required. A README file on how to build and run docker images, is also provided. In an effort to create as small-sized as possible docker images only the necessary instructions have been written in each Dockerfile ensuring smooth operation of each application inside the containers.

### Contents

* **[Octave](https://github.com/geoem/dockerize/tree/master/octave)** - Lightweight image of Octave 4.4.1
* **[OpenSEES](https://github.com/geoem/dockerize/tree/master/opensees)** - Lightweight image of latest OpenSEES
* **[PHP](https://github.com/geoem/dockerize/tree/master/php)** - Lightweight image of PHP version 7.1

### Author

Manolis Georgioudakis <<geoem@mail.ntua.gr>>