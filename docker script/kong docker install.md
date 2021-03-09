docker run -d --name kong-database `
    --network=kong-network `
    --restart=on-failure `
    -p 5432:5432 `
    -e "KONG_DATABASE=postgres" `
    -e "POSTGRES_USER=kong" `
    -e "POSTGRES_DB=kong" `
    -e "POSTGRES_PASSWORD=kong" `
    postgres:9.5

docker run --rm `
    --network=kong-network `
    -e "KONG_DATABASE=postgres" `
    -e "KONG_PG_HOST=kong-database" `
    -e "KONG_PG_PASSWORD=kong" `
    -e "KONG_CASSANDRA_CONTACT_POINTS=kong-database" `
    kong:latest kong migrations bootstrap

docker run -d --name kong `
        --network=kong-network `
        --restart=on-failure `
        -e "KONG_DATABASE=postgres" `
        -e "KONG_PG_HOST=kong-database" `
        -e "KONG_CASSANDRA_CONTACT_POINTS=kong-database" `
        -e "KONG_PG_PASSWORD=kong" `
        -e "KONG_PROXY_ACCESS_LOG=/dev/stdout" `
        -e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" `
        -e "KONG_ADMIN_ERROR_LOG=/dev/stderr" `
        -e "KONG_ADMIN_LISTEN=0.0.0.0:8001, 0.0.0.0:8444 ssl" `
        -e "KONG_STREAM_LISTEN=0.0.0.0:5555" `
        -p 8000:8000 `
        -p 8443:8443 `
        -p 8001:8001 `
        -p 8444:8444 `
        -p 5555:5555 `
        kong:latest


konga：
首先需要通过docker exec -it kong-database /bin/bash 进入容器
然后通过psql -u kong 进入数据库（密码如上 是kong）
最后创建数据库、用户、GRANT权限

//这里的ip是通过docker inspect kong-database查出来的
docker run --rm pantsel/konga:latest -c prepare -a postgres -u postgresql://konga:konga@172.18.0.1:5432/konga

docker run -d  --name konga `
    --network=kong-network `
    -p 1337:1337 `
    -e "DB_ADAPTER=postgres" `
    -e "DB_HOST=172.18.0.1" `
    -e "DB_PORT=5432" `
    -e "DB_USER=konga" `
    -e "DB_PASSWORD=konga" `
    -e "DB_DATABASE=konga" `
    -e "KONGA_HOOK_TIMEOUT=120000" `
    -e "NODE_ENV=production" `
    pantsel/konga

接着就可以通过localhost:1337访问konga，第一次登陆时候需要输入kong的admin api url，需要用docker inspect kong查看gateway， url为[GATEWAY]:8001