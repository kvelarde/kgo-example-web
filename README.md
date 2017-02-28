kgo-example-web simple example web applications.

Configures port and response via enviroment variables:

        LISTEN_PORT
        LISTEN_MSG
Build:
  bash build.sh

Deploy"
  bash deploy_service.sh

Test:
  # if service is running though proxy servicename/version
  curl -L  http://192.168.99.100:9098/serviceone/v2
