import 'package:flutter/material.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../application/app/app.locator.dart';
// import '../../../application/services/location_service.dart';

class AddressSelectionViewModel extends BaseViewModel {
  final _placesService = locator<PlacesService>();
  final _navigationService = locator<NavigationService>();

  final addressController = TextEditingController();
  List<PlacesAutoCompleteResult> _autoCompleteResults = [];

  List<PlacesAutoCompleteResult> get autoCompleteResults =>
      _autoCompleteResults;
  bool get hasAutoCompleteResults => _autoCompleteResults.isNotEmpty;

  void updateAddress(String val) {
    addressController.value.copyWith(
      text: val,
      selection:
          TextSelection(baseOffset: val.length, extentOffset: val.length),
    );
    _getAutoCompleteResults();
  }

  GeocodingResponse? locationAddr;
  Future _getAutoCompleteResults() async {
    final addressValue = addressController.text;

    if (addressValue.isNotEmpty) {
      final placesResults = await _placesService.getAutoComplete(addressValue);
      _autoCompleteResults = placesResults;
      // locationAddr = await locator<MaksimaLocationService>()
      //     .getAddressByName(addressValue);
      // _autoCompleteResults = List.generate(
      //   locationAddr?.results.length ?? 0,
      //   (i) => PlacesAutoCompleteResult(
      //     mainText: locationAddr?.results[i].addressComponents.first.shortName,
      //     secondaryText: locationAddr?.results[i].formattedAddress,
      //     description: locationAddr?.results[i].formattedAddress,
      //   ),
      // );
      notifyListeners();
    } else {
      _autoCompleteResults.clear();
      addressController.text = '';
      notifyListeners();
    }
  }

  // Future navigateBackWithValue(GeocodingResult? chosenPlace) async {
  //   _navigationService.back(result: {
  //     'address': chosenPlace?.formattedAddress ?? '',
  //     'lat': chosenPlace?.geometry.location.lat ?? '',
  //     'lng': chosenPlace?.geometry.location.lng ?? '',
  //   });
  // }

  Future navigateBackWithValue(PlacesAutoCompleteResult chosenPlace) async {
    final placeDetails = await runBusyFuture(
      _placesService.getPlaceDetails(chosenPlace.placeId!),
    );

    _navigationService.back(result: {
      'address': chosenPlace.description,
      'lat': placeDetails.lat,
      'lng': placeDetails.lng,
    });
  }
}
