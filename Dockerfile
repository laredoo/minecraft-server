FROM openjdk:22-jdk-slim

WORKDIR /minecraft

RUN apt-get update && \
    apt-get install -y curl jq && \
    rm -rf /var/lib/apt/lists/*

ARG PROJECT=paper
ARG MINECRAFT_VERSION=1.21.4

RUN LATEST_BUILD=$(curl -s https://api.papermc.io/v2/projects/${PROJECT}/versions/${MINECRAFT_VERSION}/builds | \
    jq -r '.builds | map(select(.channel == "default") | .build) | .[-1]') && \
    echo "Latest build: $LATEST_BUILD" && \
    JAR_NAME=${PROJECT}-${MINECRAFT_VERSION}-${LATEST_BUILD}.jar && \
    PAPERMC_URL="https://api.papermc.io/v2/projects/${PROJECT}/versions/${MINECRAFT_VERSION}/builds/${LATEST_BUILD}/downloads/${PROJECT}-${MINECRAFT_VERSION}-${LATEST_BUILD}.jar" && \
    curl -o server.jar $PAPERMC_URL

COPY server.properties /minecraft/server.properties

RUN echo "eula=true" > eula.txt

VOLUME /minecraft/world

EXPOSE 25565

CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "--nogui"]