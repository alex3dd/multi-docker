docker build -t alex3dd/multi-client:latest -t stephengrider/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t alex3dd/multi-server:latest -t stephengrider/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t alex3dd/multi-worker:latest -t stephengrider/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push alex3dd/multi-client:latest
docker push alex3dd/multi-server:latest
docker push alex3dd/multi-worker:latest

docker push alex3dd/multi-client:$SHA
docker push alex3dd/multi-server:$SHA
docker push alex3dd/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=alex3dd/multi-server:$SHA
kubectl set image deployments/client-deployment client=alex3dd/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=alex3dd/multi-worker:$SHA