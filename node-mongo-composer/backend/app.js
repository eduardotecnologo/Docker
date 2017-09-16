const express = require('express')
const restful = require('node-restful')
const server = express()
const mongoose = restful.mongoose

//Database
mongoose.Promise = global.Promise //Associano a API de promisse do node com a do Mongoose
mongoose.connect('mongodb://db/mydb') //Conexão com MongoDB

//Teste
server.get('/', (req, res, next) => res.send('Backend'))
    //Start Server
server.listen(3000)