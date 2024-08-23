# Use a imagem oficial do Node.js
FROM node:18

# Crie e defina o diretório de trabalho
WORKDIR /usr/src/app

# Copie os arquivos do projeto para o contêiner
COPY package*.json ./
RUN npm install
COPY . .

# Exponha a porta que o servidor vai escutar
EXPOSE 3000

# Defina o comando para rodar o servidor
CMD [ "node", "index.js" ]
