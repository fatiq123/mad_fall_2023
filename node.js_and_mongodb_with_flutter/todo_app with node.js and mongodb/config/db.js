const mongoose = require('mongoose');

const connection = mongoose.createConnection('mongodb://localhost:27017/TodoDB')
    .on('open', () => {
        console.log('Mongodb connected');
    })
    .on('error', () => {
        console.log('Mongodb connection failed');
    });

module.exports = connection;