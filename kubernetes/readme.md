## Dica start Kind
Olá Pessoal.

# Uma dica importante quando trabalhamos com o kind é que quando desligamos nosso computador o container irá parar a execução, ao religar aquele container que foi criado estará em modo “standby”, para “startar” este container novamente vamos executar o comando: 
$ docker start <nome do container || id do container>. Com isso o container voltará a execução do local em que estava.

Como vimos anteriormente, para identificar o nome ou id do container, vamos executar o comando: 

$ docker ps -a.

Outros gerenciadores possuem um comando para realizar o “start” do container, mas no caso do kind os passos acima são necessário;