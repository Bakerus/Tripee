import 'dart:io';

import 'package:path_provider/path_provider.dart';

class LocalFileServices {
  final String filePath = 'tripee.txt';

  Future<void> writeToFile(String info) async {
    final directory = await getApplicationDocumentsDirectory();

    try {
      final file = File('${directory.path}/$filePath');
      if (!file.existsSync()) {
        //create the file if no exist
        await file.create();
      }
      // Write to the file
      await file.writeAsString(info);
    } catch (error) {
      rethrow;
    }
  }

  Future<String?> readFromFile() async {
    final directory = await getApplicationDocumentsDirectory();

    final file = File('${directory.path}/$filePath');
    if (file.existsSync()) {
      try {
        final infoRead = await file.readAsString();
        return infoRead;
      } catch (e) {
        rethrow;
      }
    } else {
      return null;
    }
  }
  
}

// *****************************************************************************
// LocalFileServices
// 
// This class handles file operations for locally storing and retrieving data 
// in the application. The infos are stored as a simple 
// text in a file, which is created and managed inside the device's local 
// storage.
// 
// Key features:
// - Provides methods to write and read a infos string to/from a file named 
//   `tripee.txt` located in the app's documents directory.
// - Handles common file I/O operations, including creating, writing to, 
//   and reading from the file.
// - Utilizes the `path_provider` package to determine the location of the 
//   application’s documents directory.
// 
// Methods:
// - `writeToFile(String info)` - Writes the provided infos into a file 
//   within the app's document directory.
// - `readFromFile()` - Reads and returns the infos from the file. If the file 
//   doesn't exist, it returns null. Both methods handle potential I/O 
//   exceptions gracefully by rethrowing errors for higher-level handling.
// 
// Dependencies:
// - `dart:io` for file handling.
// - `path_provider` for retrieving the correct directory path to store files.
//
// *****************************************************************************