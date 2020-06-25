#!/bin/bash
docker build -t alexgure/multi-client ./client  
docker build -t alexgure/multi-nginx ./nginx
docker build -t alexgure/multi-server ./server
docker build -t alexgure/multi-worker ./worker
docker login -u alexgure
docker push alexgure/multi-client
docker push alexgure/multi-nginx 
docker push alexgure/multi-server
docker push alexgure/multi-worker
