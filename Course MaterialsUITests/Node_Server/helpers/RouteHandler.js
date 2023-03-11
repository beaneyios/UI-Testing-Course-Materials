import FileFetcher from './FileFetcher.js';
import FileUploader from './FileUploader.js';
import FileCleanupHandler from './FileCleanupHandler.js'

export default class RouteHandler {

	configureRoutes(router) {
		this.configureUploadRoute(router);
		this.configureAppRoutes(router);	
	}

	configureUploadRoute(router) {
		const uploader = new FileUploader();

		router.post('/upload', (request, response) => {  
		    uploader.writeFile(request.get('url-key'), request.body);
		    response.json({ success: true });
		});
	}

	configureAppRoutes(router) {

		const fileFetcher = new FileFetcher();

		router.get('*', (request, response) => {
			fileFetcher.fetchFile(request, response);
		});

		router.post('*', (request, response) => {
			fileFetcher.fetchFile(request, response);
		});

		router.delete('/delete-all', (request, response) => {

			const cleanupHandler = new FileCleanupHandler();
			cleanupHandler.deleteAll();
			response.json({ success: true });
		})
	}
}