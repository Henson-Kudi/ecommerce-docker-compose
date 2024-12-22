# Use the official Docker image for Docker Compose
FROM docker/compose:latest

# Set the working directory
WORKDIR /app

# Copy the docker-compose.yml file into the container
COPY docker-compose.yml .

# Install Docker CLI
RUN apk add --no-cache docker-cli

# Start the services defined in the docker-compose.yml file
CMD ["docker-compose", "up"]