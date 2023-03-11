import fs from 'fs';

export default class FileUploader { 

  writeFile(url, body) {

    const urlWithoutHttp = replaceAll(url, "http://localhost.com:3000", "-");
    const urlWithoutSlashes = replaceAll(urlWithoutHttp, "/", "-");

    const filePath = `responses/file${urlWithoutSlashes}.json`;

    console.log(`POST: URL written ${filePath}`);

    if (!fs.existsSync('responses')) {
      fs.mkdirSync('responses');
    }

    fs.writeFile(filePath, JSON.stringify(body), function (err) {
      if (err) { 
        console.log('POST: There was an error');
        console.log(err);
      } else {
        console.log(`POST: Written to ${filePath}`)
      }
    });
  }

  replaceAll(string, search, replace) {
    return string.split(search).join(replace);
  }
}