#!/bin/bash

echo "Criando as imagens .............."

docker build -t saulocoelho/appdio-backend:1.0  backend/.
docker build -t saulocoelho/appdio-database:1.0 database/.

echo "Realizando o push das imagens"

docker push saulocoelho/appdio-backend:1.0 
docker push saulocoelho/appdio-database:1.0

echo "Criando serviços no cluster Kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments......."

kubectl apply -f ./deployment.yml
