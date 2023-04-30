const express = require("express");

const port = 8080;

const app = express();

app.get("/", (req, res) => {
  const now = new Date();

  res.json({
    date: now.toLocaleDateString(),
    time: now.toLocaleTimeString()
  });
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
})