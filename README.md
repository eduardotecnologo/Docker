Start(Testando o Docker)
➜  Docker git:(master) ✗ docker container run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
b04784fba78d: Pull complete
Saber a versão do Bash na máquina
➜  Docker git:(master) ✗ bash --version
GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin16)
Copyright (C) 2007 Free Software Foundation, Inc.
Baixando uma imagem Debian
➜  Docker git:(master) ✗ docker container run debian bash --version
Unable to find image 'debian:latest' locally
latest: Pulling from library/debian
Verificar container sendo executado
➜  Docker git:(master) ✗ docker container ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
➜  Docker git:(master) ✗
Verificar container sendo executado ou parados
➜  Docker git:(master) ✗ docker container ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                      PORTS               NAMES
53bb67ea94a2        debian              "bash --version"    2 minutes ago       Exited (0) 2 minutes ago                        gifted_mestorf
0970a680a91d        hello-world         "/hello"            11 minutes ago      Exited (0) 11 minutes ago                       nifty_bhabha
50d6666d2205        3538b8c69182        "node"              5 weeks ago         Exited (0) 5 weeks ago                          boring_newton
a2399c94190b        ubuntu:16.04        "/bin/bash"         5 weeks ago         Exited (0) 5 weeks ago                          react-native
➜  Docker git:(master) ✗
Entrando no terminal do container
➜  Docker git:(master) ✗ docker run -it debian bash
root@765779d8b2d7:/#
Dando nomes ao Container e iniciando em modo interativo
➜  Docker git:(master) ✗ docker container run --name DuDebi -it debian bash
root@d0581870dc96:/#
Startando um container Específico
➜  Docker git:(master) ✗ docker container start -ai DuDebi
root@d0581870dc96:/#
Instalando um Servidor NGINX
➜  Docker git:(master) ✗ docker container run -p 8080:80 nginx
Unable to find image 'nginx:latest' locally
latest: Pulling from library/nginx
94ed0c431eb5: Pull complete
9406c100a1c3: Pull complete
aa74daafd50c: Pull complete
Digest: sha256:788fa27763db6d69ad3444e8ba72f947df9e7e163bad7c1f5614f8fd27a311c3
Status: Downloaded newer image for nginx:latest
172.17.0.1 - - [01/Sep/2017:01:56:31 +0000] "GET / HTTP/1.1" 200 612 "-" "curl/7.54.0" "-"
Fazendo um teste de acesso em outro terminal ou no navegador
➜  ~ git:(master) ✗ curl http://localhost:8080
<!DOCTYPE html>
Baixando Nginx e Mapeando Volumes
➜  volume git:(master) ✗ docker container run -p 8080:80 -v $(pwd)/not-found:/usr/share/nginx/html nginx
2017/09/01 02:07:11 [error] 6#6: *4 directory index of "/usr/share/nginx/html/" is forbidden, client: 172.17.0.1, 
server: localhost, request: "GET / HTTP/1.1", host: "localhost:8080"
Baixando Nginx, Mapeando Volumes e apontando para index do app
➜  volume git:(master) ✗ docker container run -p 8080:80 -v $(pwd)/html:/usr/share/nginx/html nginx
172.17.0.1 - - [01/Sep/2017:02:15:16 +0000] "GET / HTTP/1.1" 200 294 "-" "Mozilla/5.0 (Macintosh; 
Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36" "-"

























