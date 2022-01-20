FROM nikolaik/python-nodejs:python3.9-nodejs14-slim
RUN apt-get update && apt install unzip && apt install -y netcat && npm install -g --unsafe-perm node-red
WORKDIR /app
RUN mkdir -p .node-red
ADD files .node-red/
RUN npm install --prefix /app/.node-red
RUN unzip /app/.node-red/model.aasx -d /app/.node-red/
EXPOSE 1880
ENTRYPOINT ["node-red", "-u", "/app/.node-red", "-s", "/app/.node-red/settings.js"]
