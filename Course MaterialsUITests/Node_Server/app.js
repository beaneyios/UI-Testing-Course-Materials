#!/usr/bin/node

import RouteHandler from './helpers/RouteHandler.js';

import bodyParser from 'body-parser';
import express from 'express';
import http from 'http';
import { Server } from 'socket.io';

const app = express();
const router = express.Router();
const server = http.createServer(app);
const io = new Server(server, {
  allowEIO3: true
});

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

const routeHandler = new RouteHandler();

routeHandler.configureRoutes(router);

app.use("/", router);
app.disable('etag');

server.listen(3000, () => {
  console.log('listening on *:3000');
});