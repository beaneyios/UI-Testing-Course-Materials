#!/usr/bin/node

import RouteHandler from './helpers/RouteHandler.js';

import bodyParser from 'body-parser';
import express from 'express';
import http from 'http';

const app = express();
const router = express.Router();

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

const routeHandler = new RouteHandler();

routeHandler.configureRoutes(router);

app.use("/", router);
app.disable('etag');

app.listen(3000, () => {
  console.log('listening on *:3000');
});