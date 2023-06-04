// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../views/pipeline/pipeline_details/widgets/hasil_foto/hasil_foto_view.dart';

class GuidedCameraView extends StatefulWidget {
  const GuidedCameraView({Key? key}) : super(key: key);

  @override
  _GuidedCameraViewState createState() => _GuidedCameraViewState();
}

class _GuidedCameraViewState extends State<GuidedCameraView> {
  late CameraController _controller;

  Future _initializeCamera() async {
    final cameras = await availableCameras();
    _controller = CameraController(cameras.first, ResolutionPreset.high);
    await _controller.initialize();
    _controller.lockCaptureOrientation();
  }

  Future<File?> _takePicture() async {
    final Directory root = await getTemporaryDirectory();
    final String directoryPath = '${root.path}/guided_camera';
    await Directory(directoryPath).create(recursive: true);
    final String filePath = '$directoryPath/${DateTime.now()}.jpg';

    try {
      final XFile picture = await _controller.takePicture();
      picture.saveTo(filePath);
    } catch (e) {
      return null;
    }

    return File(filePath);
  }

  Future _onCameraButtonPressed() async {
    if (!_controller.value.isTakingPicture) {
      final File? result = await _takePicture();

      if (result != null) {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HasilFotoView(result),
          ),
        ).then((useThisPhoto) {
          if (useThisPhoto == true) {
            Navigator.of(context).pop<File>(result);
          }
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: _initializeCamera(),
        builder: (_, snapshot) => (snapshot.connectionState ==
                ConnectionState.done)
            ? Column(
                children: [
                  _buildBackButton(context),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1 / _controller.value.aspectRatio,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: CameraPreview(_controller),
                            ),
                          ),
                          Positioned.fill(
                            child: Opacity(
                              opacity: 0.3,
                              child: Container(
                                color: Colors.black,
                                child: Transform.scale(
                                  scale: 0.9,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipOval(
                                        child: Container(
                                          height: 295,
                                          width: 236,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 83),
                                      Container(
                                        height: 194,
                                        width: 362,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _buildCameraButton(),
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
            icon: const Icon(Icons.clear),
            color: Colors.white,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
    );
  }

  Container _buildCameraButton() {
    return Container(
      width: 70,
      height: 70,
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: ElevatedButton(
        onPressed: _onCameraButtonPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
        ),
        child: const Icon(
          Icons.camera_alt,
          color: Colors.black,
          size: 36,
        ),
      ),
    );
  }
}
