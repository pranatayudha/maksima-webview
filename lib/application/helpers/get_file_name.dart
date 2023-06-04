import 'dart:io';

String getFilename(File file) {
  return file.path.split('/').last.toString();
}
