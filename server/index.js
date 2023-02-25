
console.log('hello world');

const express = require ('express');

const PORT = 3000;

const app = express();

app.get("/", (req, res)=>{
    res.send("hello Dear ");

});


app.listen(PORT, "0.0.0.0", ()=>{
    console.log(`Connected port ${PORT} `);
});