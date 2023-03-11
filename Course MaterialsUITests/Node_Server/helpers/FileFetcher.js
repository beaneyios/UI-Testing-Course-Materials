import fs from 'fs';

export default class FileFetcher {

  fetchFile(req, response) {

    const url = req.protocol + '://' + req.get('host') + req.originalUrl;
    console.log(`GET: URL is ${url}`);

    const urlWithoutHttp = this.replaceAll(url, "http://localhost:3000", "-");
    const urlWithoutSlashes = this.replaceAll(urlWithoutHttp, "/", "-");
    const filePath = `responses/file${urlWithoutSlashes}.json`;
    console.log(`GET: Filepath is ${filePath}`);

    fs.readFile(filePath, 'utf8', (err, data) => {
      if (err) {
        console.log(err);
        return;
      }

      response.set('Authorization', 'Bearer test-token');
      response.json(JSON.parse(data));
    });
  }

  replaceAll(string, search, replace) {
    return string.split(search).join(replace);
  }
}