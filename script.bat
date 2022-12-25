echo "Script criação das imagens."

docker build -t robertocosta007/projeto-backend:1.0 backend/.
docker build -t robertocosta007/projeto-backend:1.0 database/.

echo "Efetuando o push das imagens."

docker push robertocosta007/projeto-backend:1.0
docker push robertocosta007/projeto-database:1.0

echo "Criando serviços no cluster kubernetes."

kubectl apply -f ./services.yml

echo "Criando os deployments."

kubectl apply -f ./deployment.yml