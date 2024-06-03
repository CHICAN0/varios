docker run --name evolution-api --detach \
-p 8080:8080 \
-e AUTHENTICATION_API_KEY=a8ce0029d080e6797f16f2173a229e90 \
-v evolution_store:/evolution/store \
-v evolution_instances:/evolution/instances \
atendai/evolution-api \
node ./dist/src/main.js
