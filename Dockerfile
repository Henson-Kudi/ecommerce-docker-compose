# Use the official Docker image for Docker Compose
FROM docker/compose:latest

# Set the working directory
WORKDIR /app

# Copy the docker-compose.yml file into the container
COPY docker-compose.yml .

# Install Docker CLI
RUN apk add --no-cache docker-cli

# Set the Docker host environment variable if needed
ENV DOCKER_HOST=tcp://docker:2375
# Ensure Docker is running
RUN apk add --no-cache openrc docker && \
    rc-update add docker boot && \
    service docker start
# Start the services defined in the docker-compose.yml file using docker stack deploy
CMD ["sh", "-c", "docker stack deploy -c docker-compose.yml my_stack"]