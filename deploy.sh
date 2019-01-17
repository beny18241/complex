#beny18241
docker build -t beny18241/complex-client:latest -t beny18241/complex-client:$SHA -f ./client/Dockerfile ./client
docker build -t beny18241/complex-server:latest -t beny18241/complex-server:$SHA -f ./server/Dockerfile ./server
docker build -t beny18241/complex-worker:latest -t beny18241/complex-worker:$SHA -f ./worker/Dockerfile ./worker

docker push beny18241/complex-client:latest
docker push beny18241/complex-server:latest
docker push beny18241/complex-worker:latest

docker push beny18241/complex-client:$SHA
docker push beny18241/complex-server:$SHA
docker push beny18241/complex-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=beny18241/complex-server:$SHA
kubectl set image deployments/client-deployment client=beny18241/complex-client:$SHA
kubectl set image deployments/worker-deployment worker=beny18241/complex-worker:$SHA