sudo docker run -d  --name konga \
--network=host \
-e "DB_ADAPTER=postgres" \
-e "DB_HOST=127.0.0.1" \
-e "DB_PORT=5432" \
-e "DB_USER=konga" \
-e "DB_PASSWORD=konga" \
-e "DB_DATABASE=konga" \
-e "KONGA_HOOK_TIMEOUT=120000" \
-e "NODE_ENV=production" \
pantsel/konga