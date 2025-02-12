# Minecraft Server Docker

This project sets up a Minecraft server using Docker. It uses the [PaperMC](https://papermc.io/) project to provide a high-performance Minecraft server.

## Prerequisites

- Docker installed on your machine

## Usage

1. Clone this repository:
    ```sh
    git clone https://github.com/yourusername/minecraft-server.git
    cd minecraft-server
    ```

2. Build the Docker image:
    ```sh
    docker build -t minecraft-server:0.0.1 .
    ```

3. Run the server using the provided script:
    ```sh
    ./run_server.sh
    ```

4. Alternatively, you can run the server manually:
    ```sh
    docker run -d \
      -v $(pwd)/minecraft/merge:/minecraft/merge \
      -v $(pwd)/minecraft/world:/minecraft/world \
      -v $(pwd)/minecraft/logs:/minecraft/logs \
      -p 25565:25565 \
      --name minecraft-server \
      minecraft-server:0.0.1
    ```

## Configuration

You can configure the server by editing the `server.properties` file. This file is copied into the Docker container when it is built.

## Volumes

The following volumes are used to persist data:
- `/minecraft/merge`
- `/minecraft/world`
- `/minecraft/logs`

## Maintainer 👨‍💻

**Lucas Laredo**

GitHub: [@devlucaslaredo](https://github.com/devlucaslaredo)  
Email: devlucaslaredo@gmail.com