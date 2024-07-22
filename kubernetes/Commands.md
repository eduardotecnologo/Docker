# # Comandos
$ kind create cluster
$ kubectl cluster-info --context kind-kind
$ docker ps
$ kubectl get nodes
❯ kubectl get nodes
NAME                 STATUS   ROLES           AGE   VERSION
kind-control-plane   Ready    control-plane   24h   v1.30.0
$ kind get clusters
$ kind delete clusters kind
$ kind create cluster --config=k8s/kind.yaml --name=fullcycle
$ kind delete cluster --name fullcycle

## DOCKER
## Enviar imagem para o Docker Hub
# Passo 1: Fazer login no Docker Hub
❯ docker login

# Passo 2: Construir a imagem Docker
❯ docker buildx build -t hello-go .

# Passo 3: Taggear a imagem
❯ docker tag hello-go eduardodeveloper/hello-go:latest

# Passo 4: Enviar a imagem para o Docker Hub
❯ docker push eduardodeveloper/hello-go:latest
************************************************
❯ docker buildx build -t eduardotecnologo/hello.go .
❯ docker run --rm -p 80:80 eduardodeveloper/hello-go

## Criando o primeiro POD
❯ kubectl apply -f k8s/pod.yaml
pod/goserver created
❯ kubectl get po
NAME       READY   STATUS             RESTARTS   AGE
goserver   0/1     ImagePullBackOff   0          40s

╰─ kubectl port-forward pod/goserver 8000:80