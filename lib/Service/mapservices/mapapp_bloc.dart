import 'dart:async';
import 'package:Hunarmand_signIn_Ui/Models/mapmodels/placesearch_model.dart';
import 'package:Hunarmand_signIn_Ui/Service/mapservices/geolocator_service.dart';
import 'package:Hunarmand_signIn_Ui/Service/mapservices/places_services.dart';
import 'package:Hunarmand_signIn_Ui/Models/mapmodels/place_model.dart';
import 'package:Hunarmand_signIn_Ui/Service/mapservices/marker_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';

class MapApplicationBloc with ChangeNotifier {
  GeolocatorService geolocatorService = GeolocatorService();
  final placesService = PlacesService();
  final markerService = MarkerService();
  List<PlaceSearch> searchResults;
  List<Marker> markers = List<Marker>();
  StreamController<Place> selectedLocation =
      StreamController<Place>.broadcast();
  // StreamController<LatLngBounds> bounds = StreamController<LatLngBounds>();
  Position currentLocation;

  MapApplicationBloc() {
    setCurrentLocation();
  }
  setCurrentLocation() async {
    currentLocation = await geolocatorService.getCurrentLocation();
    // selectedLocationStatic = Place(name: null,
    //   geometry: Geometry(location: Location(
    //       lat: currentLocation.latitude, lng: currentLocation.longitude),),);
    notifyListeners();
  }

  searchPlaces(String searchTerm) async {
    searchResults = await placesService.getAutocomplete(searchTerm);
    notifyListeners();
  }

  setSelectedLocation(String placeId) async {
    var sLocation = await placesService.getPlace(placeId);
    selectedLocation.add(sLocation);
    // selectedLocationStatic = sLocation;
    searchResults = null;
    notifyListeners();
  }

  @override
  void dispose() {
    selectedLocation.close();
    super.dispose();
  }
}
