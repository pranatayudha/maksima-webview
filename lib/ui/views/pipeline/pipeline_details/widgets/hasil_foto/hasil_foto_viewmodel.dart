import 'dart:io';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../application/app/app.locator.dart';

class HasilFotoViewModel extends BaseViewModel {
  final File? _imageFile;

  HasilFotoViewModel(this._imageFile);

  final NavigationService _navigationService = locator<NavigationService>();

  File? get imageFile => _imageFile;

  void gunakanFoto() => _navigationService.back(result: true);

  void fotoUlang() => _navigationService.back(result: false);
}
