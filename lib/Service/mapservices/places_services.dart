import 'dart:convert' as convert;
import 'package:Hunarmand_signIn_Ui/Models/mapmodels/placesearch_model.dart';
import 'package:Hunarmand_signIn_Ui/Models/mapmodels/place_model.dart';

import 'package:http/http.dart' as http;

class PlacesService {
  final key = 'AIzaSyCKBDeO6UNwsWfs3J7hx8qjy0zqUCAFAhU';

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&key=$key&components=country:pk';
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  Future<Place> getPlace(String placeId) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['result'] as Map<String, dynamic>;
    return Place.fromJson(jsonResult);
  }
}
