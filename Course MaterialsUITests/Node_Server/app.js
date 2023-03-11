#!/usr/bin/node

import RouteHandler from './helpers/RouteHandler.js';
import WebsocketHandler from './helpers/WebsocketHandler.js';

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

const socketHandler = new WebsocketHandler(router);

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

const routeHandler = new RouteHandler();

routeHandler.configureRoutes(router);

app.use("/", router);
app.disable('etag');

io.on('connection', (socket) => {
  
  socketHandler.addSocket(socket);

  socket.on('disconnect', () => {
    socketHandler.removeSocket(socket);
  });
});

io.on("disconnect", () => {
  console.log("WEBSOCKET: a user disconnected");
});

server.listen(3000, () => {
  console.log('listening on *:3000');
});