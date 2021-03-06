//Dependencias
const express = require('express')
const restful = require('node-restful')
const server = express()
const mongoose = restful.mongoose
const bodyParser = require('body-parser')
const cors = require('cors')

//Database
mongoose.Promise = global.Promise //Associano a API de promisse do node com a do Mongoose
mongoose.connect('mongodb://db/mydb') //Conexão com MongoDB

// //Teste
// server.get('/', (req, res, next) => res.send('Backend'))

//Middlewares
server.use(bodyParser.urlencoded({ extended: true }))
server.use(bodyParser.json())
server.use(cors())
    // ODM
const Client = restful.model('Client', {
        name: { type: String, required: true }
    })
    // REST API
Client.methods(['get', 'post', 'put', 'delete'])
Client.updateOptions({ new: true, runValidators: true })

// ROUTES
Client.register(server, '/clients')

// Start Server
server.listen(3000)