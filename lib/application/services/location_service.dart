import 'dart:async';
import 'dart:developer' as developer;

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../flavors.dart';
import '../app/app.locator.dart';
import '../enums/dialog_type.dart';
import '../models/user_location.dart';

class MaksimaLocationService {
  UserLocation? _currentLocation;

  final StreamController<UserLocation> _locationStreamController =
      StreamController<UserLocation>.broadcast();

  Stream<UserLocation> get locationStream => _locationStreamController.stream;

  MaksimaLocationService() {
    GoogleMapsPlaces(apiKey: F.sharedMap['googleAPIKey'] as String);

    Geolocator.requestPermission().then((permission) {
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        Geolocator.getPositionStream().listen((position) async {
          if (!_locationStreamController.isClosed) {
            try {
              _locationStreamController.add(UserLocation(
                latitude: position.latitude,
                longitude: position.longitude,
                isMocked: position.isMocked,
              ));
            } catch (e) {
              developer.log(e.toString());
            }
          }
        });
      } else if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever ||
          permission == LocationPermission.unableToDetermine) {
        _showErrorDialog('Akses tidak diizinkan untuk mendapatkan lokasi');
      }
    });
  }

  Future<UserLocation?> getLocation() async {
    try {
      final userLocation = await Geolocator.getCurrentPosition();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
        isMocked: userLocation.isMocked,
      );
    } on Exception catch (e) {
      developer.log('Could not get location: ${e.toString()}');
    }

    return _currentLocation;
  }

  final _dialogService = locator<DialogService>();
  Future _showErrorDialog(String desc) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Error',
      description: desc,
      mainButtonTitle: 'COBA LAGI',
    );
  }

  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    GeocodingResponse place =
        await GoogleMapsGeocoding(apiKey: F.sharedMap['googleAPIKey'] as String)
            .searchByLocation(
      Location(lat: latitude, lng: longitude),
      language: 'ID',
    );

    return place.results.isNotEmpty
        ? place.results.first.formattedAddress.toString()
        : '-';
  }

  Future<GeocodingResponse> getAddressByName(String key) async {
    GeocodingResponse place =
        await GoogleMapsGeocoding(apiKey: F.sharedMap['googleAPIKey'] as String)
            .searchByAddress(key, language: 'ID', region: 'ID');

    return place;
  }

  void dispose() => _locationStreamController.close();
}
