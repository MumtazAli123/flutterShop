const express = require ('express');
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");
const PORT = 3000;

const app = express();
const DB = "mongodb+srv://shop:Mart123@cluster0.vu1cawj.mongodb.net/?retryWrites=true&w=majority";

app.use(express.json);
app.use(authRouter);

// mongoose.connect(DB).then(()=>{
// console.log('Connect Successfull');
// })
// .catch ((e)=>{
//   return (e);

// });


const { MongoClient, ServerApiVersion } = require('mongodb');
const { db } = require('./models/user');
const uri = "mongodb+srv://shop:Mart123@cluster0.vu1cawj.mongodb.net/?retryWrites=true&w=majority";
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true, serverApi: ServerApiVersion.v1 });
client.connect(err => {
  const collection = client.db("test").collection("devices");
  // perform actions on the collection object
  client.close();
});


app.listen(PORT, ()=>{
    console.log(`Connected port ${PORT} `);
});