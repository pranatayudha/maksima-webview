import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../application/app/app.locator.dart';
import '../../../application/app/constants/custom_color.dart';
import '../../../application/services/media_service.dart';
import '../../shared/custom_button.dart';

class TakePhotoDialog extends StatefulWidget {
  final DialogRequest? request;
  final Function(DialogResponse)? completer;

  const TakePhotoDialog({
    this.request,
    this.completer,
    Key? key,
  }) : super(key: key);

  @override
  TakePhotoDialogState createState() => TakePhotoDialogState();
}

class TakePhotoDialogState extends State<TakePhotoDialog> {
  final MaksimaMediaService _mediaService = locator<MaksimaMediaService>();
  String? _imageErrorText;
  File? _imageFile;

  bool _isImageValid() {
    if (_imageFile == null) {
      _imageErrorText = 'Anda Belum Memilih Foto';

      // ignore: no-empty-block
      setState(() {});

      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _imageErrorText = null;
        });
      });
    }
    // ignore: newline-before-return
    return _imageFile != null;
  }

  void _changePhoto() {
    if (_isImageValid()) {
      widget.completer!(
        DialogResponse(
          confirmed: true,
          data: _imageFile,
        ),
      );
    }
  }

  Future _pickImage(ImageSource source) async {
    final pickedFile = await _mediaService.getImage(
      fromGallery: source == ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() => _imageFile = File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildImageSourceSelector(),
          if (_imageFile != null)
            Material(
              elevation: 10.0,
              clipBehavior: Clip.antiAlias,
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: SizedBox(
                  width: double.infinity,
                  child: Image.file(_imageFile!, fit: BoxFit.cover),
                ),
              ),
            ),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildImageSourceSelector() {
    return Stack(
      children: [
        Container(
          height: 120.h,
          color: CustomColor.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => _pickImage(ImageSource.gallery),
                    child: Icon(
                      Icons.image_outlined,
                      size: 48.sp,
                      color: _imageErrorText == null
                          ? Colors.white
                          : Colors.yellow,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    height: 45.h,
                    width: 1.0.w,
                    color: Colors.white30,
                  ),
                  GestureDetector(
                    onTap: () => _pickImage(ImageSource.camera),
                    child: Icon(
                      Icons.camera,
                      size: 45.sp,
                      color: _imageErrorText == null
                          ? Colors.white
                          : Colors.yellow,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                _imageErrorText ?? 'Pilih Sumber Foto',
                style: TextStyle(
                  color: _imageErrorText == null ? Colors.white : Colors.yellow,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0.0,
          child: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => widget.completer!(DialogResponse()),
          ),
        ),
      ],
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: CustomButton(
        label: 'PILIH FOTO INI',
        color: _imageFile != null ? CustomColor.primaryColor : Colors.grey,
        radius: 8.r,
        onPressed: _changePhoto,
        isBusy: false,
      ),
    );
  }
}
