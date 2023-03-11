
export default class WebsocketHandler { 

	constructor(router) {

		this.sockets = [];

		router.put('/websocket', (request, response) => {
		
			this.sockets.forEach((socket) => {

				console.log('WEBSOCKET: websocket called');
				console.log(`WEBSOCKET: Sending message to ${request.body.channel}`);
				console.log(`WEBSOCKET: Sending body ${JSON.stringify(request.body.content)}`);
				console.log(`WEBSOCKET: Sending to socket with ID ${socket.id}`)
				socket.emit(request.body.channel, request.body.content);	
			});

			response.json({ success: true });
		});
	};

	addSocket(socket) {
		console.log(`WEBSOCKET: A user connected with ID ${socket.id}`);
		this.sockets.push(socket);
	}

	removeSocket(socket) {

		console.log(this.sockets[0].id);
		const index = this.sockets.indexOf(socket);
		console.log(index);

		const removedSocket = this.sockets.splice(index, 1);
		console.log(`WEBSOCKET: Removing socket with ID of ${socket.id}`);
	}
}