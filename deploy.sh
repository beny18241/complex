#beny18241
docker build -t beny18241/complex-client -f ./client/Dockerfile ./client
docker build -t beny18241/complex-server -f ./server/Dockerfile ./server
docker build -t beny18241/complex-worker -f ./worker/Dockerfile ./worker

docker push beny18241/complex-client
docker push beny18241/complex-server
docker push beny18241/complex-worker

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=beny18241/complex-server