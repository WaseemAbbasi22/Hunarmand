import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMap extends StatefulWidget {
  GMap({Key key}) : super(key: key);

  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(30.3753, 69.3451);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;
  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

// Update the position on CameraMove
  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow: InfoWindow(
            title: 'This is a Title',
            snippet: 'This is a snippet',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  static final CameraPosition _position1 = CameraPosition(
    bearing: 192.833,
    target: LatLng(45.531563, -122.677433),
    tilt: 59.440,
    zoom: 11.0,
  );

  Future<void> _goToPosition1() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget>[
                    button(_onMapTypeButtonPressed, Icons.map),
                    SizedBox(
                      height: 16.0,
                    ),
                    button(_onAddMarkerButtonPressed, Icons.add_location),
                    SizedBox(
                      height: 16.0,
                    ),
                    button(_goToPosition1, Icons.location_searching),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget button(Function function, IconData icon) {
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.blue,
      child: Icon(
        icon,
        size: 36.0,
      ),
    );
  }
}
// GoogleMapController mapController;

// Container(
// child:Column(
// [
// SearchMapPlaceWidget(
// hasClearButton:true,
// placetype:PlaceType.address,
// placeholder:'Enter the address',
// apikey:'AIzaSyBUILBxCa5yyQZawAAOpD6HII48R3haimM'
// onSelected:(Place place) async{
// Geolocation geolocation=await place.geolocation;
// mapController.animateCamera(
// CameraUpdate.newLatLng(
// geolocation.coordinates
// )
// );
// mapController.animateCamera(
//  CameraUpdate.newLatLngBonds(geolocation.bounds, 0),
// );
//  sizedbox(
// height:
// child(
// GoogleMap(
// onMapCreated:(GoogleMapController googleMapController){
// setState(){

// mapcontroller = googleMapController;
// });
// initialCameraPosition:CameraPosition(
// zoom:15.0,
// target:LatLng(21.14558,79.0089)
// ),
// mapType:MapType.normal,
