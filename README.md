# conduit_boilerplate
A boilerplate for server-side application made with Conduit.

### Prerequisites
Required dependencies:
- Conduit CLI ^4.4.0
- Dart SDK ^3.2.3
- Git ^2.43.0

The following dependencies are optional, but are still very convenient:
- Docker ^24.0.6
- Docker Compose ^2.22.0
- GNU Make ^3.81

### Configuring
This service can be configured by two files: `.env` file and `config.yaml` file.

##### config.yaml
This file is required to  run the microservice (in local environment, or under Docker).

Run the following command:
```bash
cp config_example.yaml config.yaml
```
to copy the `config_example.yaml` content into the `config.yaml` file, then modify the environment variables. 

The `config.yaml` must contain the following env vars:
- `microserviceName`: the microservice name, like `conduit_boilerplate`.
- `listeningPort`: the listening port of the dockerized service, like `8881`, or `8888`.

##### .env
This file is optional, but required to run the microservice under Docker.

Run the following command:
```bash
cp env_example .env
```
to copy the `env_example` content into the `.env` file, then modify the environment variables. 

The `.env` must contain the following env vars:
- `DOCKER_CONTAINER_NAME`: the container name, like `conduit_boilerplate`. It's useful to run the dockerized service.
- `DOCKER_IMAGE_NAME`: the container name, like `conduit_boilerplate`. It's useful to run the dockerized service.
- `DOCKER_PORT`: the listening port of the dockerized service, like `8081`, or `8088`. It's useful to run the dockerized service.

### Installing
```bash
dart pub get
# or
make install
```

### Running
To run the microservice in a local environment, use the following command:
```bash
dart ./bin/main.dart
# or
make run
```

To generate a Swagger UI, run the following command:
```bash
conduit document client
```
This command will generate an HTML file, called `client.html`, in the root directory of the project. The file contains all the REST APIs exposed by the microservice.

## Running the dockerized service
Build the docker image with the following command:
```bash
docker build -t conduit_boilerplate .
# or
make docker-build
```

Then, run the dockerized service:
```bash
docker-compose up -d
# or
make docker-up
```
## Stopping the dockerized service
Stop the dockerized service:
```bash
docker-compose down
# or
make docker-down
```

## Inspect the dockerized service
See container logs:
```bash
docker-compose logs -f conduit_boilerplate --tail=50
# or
make docker-logs
```

## Unit Testing
To run all the unit tests suite, use the following command:
```bash
dart pub run test
```

## Code Linting
```bash
dart analyze .
# or
make lint
```

### Links
- [Dart Official Doc](https://dart.dev/guides)
- [Conduit Official Doc](https://docs.theconduit.dev/)
- [Docker Official Doc](https://docs.docker.com/)
- [Docker Compose Official Doc](https://docs.docker.com/compose/)
- [Git Official Page](https://git-scm.com/)
- [GNU Makefile Official Page](https://www.gnu.org/software/make/manual/make.html)