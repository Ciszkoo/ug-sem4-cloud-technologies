const express = require('express');
const mongoose = require('mongoose');
const app = express();

mongoose.connect('mongodb://db:27017/test', {
  useNewUrlParser: true,
  useUnifiedTopology: true
});

const collection = mongoose.connection.collection('mycollection');

mongoose.connection.on('connected', function () {
  console.log('Mongoose connected to db');
});

app.get('/', async (req, res) => {
  try {
    const docs = await collection.find({}).toArray();
    console.log(docs);
    res.json(docs);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
});

app.listen((3000), () => {
  console.log("Listening on 3000");
});
