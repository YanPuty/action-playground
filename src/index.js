const express = require('express');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.get('/api-key', (req, res) => {
  res.json({ key: process.env.API_KEY || '' });
});

app.get('/api-secret', (req, res) => {
  res.json({ key: process.env.API_SECRET || '' });
});

app.listen(port, () => {
  if (!process.env.API_SECRET) throw Error('API_SECRET does not existed');

  console.log(`Example app listening on port ${port}`);
});
