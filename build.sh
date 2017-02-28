docker build -t kgo-example-web:build . -f Dockerfile.build

docker create --name kgo-exampe-web_extract kgo-example-web:build
docker cp kgo-exampe-web_extract:/go/src/user/app/app kgo-example-web
docker rm kgo-exampe-web_extract

echo building kgo-example-web:latest ...

docker build --no-cache -t localhost:5000/kgo-example-web:latest .

docker push localhost:5000/kgo-example-web:latest
