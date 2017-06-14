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

Use:
# test deploy
sudo docker network create --driver overlay proxy
curl -o proxy-stack.yml https://raw.githubusercontent.com/vfarcic/docker-flow-proxy/master/docker-compose-stack.yml
git clone https://github.com/kvelarde/kgo-example-web.git

# create my utility container
docker service create --name util --network proxy --mode global alpine sleep 1000000

# create registry container
docker service create --name registry -p 5000:5000 --reserve-memory 100m registry:2.5.0

# launch compose file
sudo docker stack deploy -c kgo-demo-stack.yml kgo
