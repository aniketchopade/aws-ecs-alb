'use strict';

const express = require('express');

// Constants
const PORT = 8443;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Sample rateshop app\n');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);