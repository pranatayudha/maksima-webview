import 'dart:developer' as developer;
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class MaksimaMediaService {
  Future<File?> getImage({required bool fromGallery}) async {
    File? image;

    final picker = ImagePicker();

    final XFile? pickedFile = await picker.pickImage(
      source: fromGallery ? ImageSource.gallery : ImageSource.camera,
      maxHeight: 960,
      maxWidth: 1280,
    );

    if (pickedFile != null) {
      final croppedFile = await _cropImage(pickedFile.path);
      final path = croppedFile!.path;
      image = File(path);
    } else {
      developer.log('No image selected.');
    }

    return image;
  }

  Future<CroppedFile?> _cropImage(String filePath) async {
    return ImageCropper().cropImage(
      sourcePath: filePath,
      aspectRatioPresets: [
        CropAspectRatioPreset.ratio4x3,
      ],
    );
  }

  Future<File?> getFile({
    List<String> allowedExtensions = const ['pdf'],
  }) async {
    File? file;

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
    );

    if (result != null) {
      file = File(result.files.single.path!);
    }

    return file;
  }

  Future<File?> getMultiFile({
    List<String> allowedExtensions = const ['pdf', 'jpg', 'jpeg', 'png'],
  }) async {
    File? file;

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
    );

    if (result != null) {
      file = File(result.files.single.path!);
    }

    return file;
  }

  Future<PlatformFile?> getMultiFileType({
    List<String> allowedExtensions = const ['pdf', 'jpg', 'jpeg', 'png'],
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
    );

    return _convertPlatformFileExtensionToLowerCase(result?.files.single);
  }

  PlatformFile? _convertPlatformFileExtensionToLowerCase(
      PlatformFile? pickedFile) {
    if (pickedFile != null) {
      final PlatformFile file;

      final split = pickedFile.name.split('.');
      final extension = split.removeLast().toLowerCase();
      final name = split.join('.');

      file = PlatformFile(
        name: '$name.$extension',
        size: pickedFile.size,
        bytes: pickedFile.bytes,
        identifier: pickedFile.identifier,
        readStream: pickedFile.readStream,
      );

      return file;
    }

    return null;
  }
}
