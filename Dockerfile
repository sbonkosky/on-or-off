FROM sbonkosky/picam:nodejs

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3.5 \
    python3-pip \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

CMD [ "node", "server.js" ]