### source
https://github.com/brndmg/kong-plugin-hello-world
### what to change
1. add log file position in `kong.conf`
2. add plugin place in `kong.conf`
### test 
1. create a service 
curl -i -X POST --url http://127.0.0.1:8001/services/ --data 'name=tdt-service' --data 'url=http://www.tianditu.gov.cn/'
2. add route to this service
curl -i -X POST --url http://127.0.0.1:8001/services/tdt-service/routes  --data 'paths[]=/tdt'
3. add plugin 
curl -i -X POST --url http://127.0.0.1:8001/services/tdt-service/plugins/ --data 'name=hello-world'
4. test the plugin 
curl -i -X GET  --url http://127.0.0.1:8000/tdt