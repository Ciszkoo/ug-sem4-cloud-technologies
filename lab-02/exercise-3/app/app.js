const express = require("express");
const mongoose = require("mongoose");

const HelloSchema = new mongoose.Schema({
  message: {
    type: String,
    required: true,
  },
});

const Hello = mongoose.model("Hello", HelloSchema);

const db_uri = "mongodb://mongo:27017/exercise";

const app = express();

app.use(express.json());

app.post("/", (req, res) => {
  const body = req.body;
  const input = new Hello({
    message: body.message,
  });

  input
    .save(input)
    .then((saved) => res.status(201).send(saved))
    .catch((err) => res.status(400).send(err));
});

app.get("/", (req, res) => {
  Hello.find()
    .then((records) => res.status(200).send(records))
    .catch((err) => res.status(400).send(err));
});

mongoose.connect(db_uri).then(() => {
  app.listen(8080, () => {
    console.log("Server listening on port 8080.");
  });
});
