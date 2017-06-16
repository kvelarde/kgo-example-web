docker service create --name kgo-example-web \
	-e LISTEN_PORT=7777 \
	-e LISTEN_MSG="kgo-example-web example service running" \
	--network go-demo \
    --network proxy \
    --label com.df.notify=true \
    --label com.df.distribute=true \
    --label com.df.servicePath=/hi \
    --label com.df.port=7777 \
    localhost:5000/kgo-example-web      

docker service create --name jenkins -p 50000:50000 -p 8082:8080  --reserve-memory 100m jenkins
