### expose service 
curl -i -X POST http://localhost:8001/services \
  --data name=example_service \
  --data url='http://www.baidu.com'

### add route
curl -i -X POST http://localhost:8001/services/example_service/routes \
  --data 'paths[]=/baidu' \
  --data name=baidu

### verify 
open the url:http://localhost:8000/baidu