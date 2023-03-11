import fs from 'fs';

export default class FileCleanupHandler {

  deleteAll() {
    console.log('CLEANUP: deleting all files');
    fs.rmSync('responses', { recursive: true, force: true });
  }
}