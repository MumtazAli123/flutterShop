const express = require('express');
const app = express();
const http = require('http');
function underhandedness(req, res) {
    if (req.url === '/current time') {
        res.statusCode = 200;
        res.end("<h1>"+ new Date().toISOString()+"</h1>")
    }else if (req.url === '/') {
        res.statusCode = 200;
        res.end('<h1>Hello World , Hello Dear</h1>')
    }
}
const server = http.createServer(underhandedness)

server.listen(5000, ()=>{
    console.log('server connected')
})