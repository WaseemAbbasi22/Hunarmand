import 'package:Hunarmand_signIn_Ui/Service/mapservices/mapapp_bloc.dart';
import 'package:Hunarmand_signIn_Ui/Models/mapmodels/place_model.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:Hunarmand_signIn_Ui/controllers/postjob_provider.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

class DummyMap extends StatefulWidget {
  const DummyMap({Key key}) : super(key: key);

  @override
  _DummyMapState createState() => _DummyMapState();
}

class _DummyMapState extends State<DummyMap> {
  Completer<GoogleMapController> _mapController = Completer();
  StreamSubscription<Place> locationSubscription;
  // var mapProvider;
  final _locationController = TextEditingController();
  @override
  void dispose() {
    final mapProvider = Provider.of<MapApplicationBloc>(context, listen: false);
    mapProvider.dispose();
    locationSubscription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final mapProvider = Provider.of<MapApplicationBloc>(context, listen: false);
    final jobProvider = Provider.of<PostedJobProvider>(context, listen: false);
    // if (locationSubscription.cancel()){

    // }) ;
    locationSubscription = mapProvider.selectedLocation.stream.listen((place) {
      if (place != null) {
        _locationController.text = place.name;
        jobProvider.changeloction = place.name;
        _goToPlace(place);
      } else
        _locationController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    final mapProvider = Provider.of<MapApplicationBloc>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: deepOrangeColor,
          title: Text('Chose Location'),
        ),
        body: (mapProvider.currentLocation == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: TextField(
                      controller: _locationController,
                      decoration: InputDecoration(
                        hintText: 'Search by City',
                        suffixIcon: Icon(Icons.search),
                      ),
                      onChanged: (val) {
                        mapProvider.searchPlaces(val);
                      },
                      // onTap: () {
                      //   Navigator.pop(context);
                      // },
                      // hintText: 'search Location',
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        width: MediaQuery.of(context).size.width,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          myLocationEnabled: true,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(mapProvider.currentLocation.latitude,
                                mapProvider.currentLocation.longitude),
                            zoom: 14,
                          ),
                          onMapCreated: (GoogleMapController controller) {
                            _mapController.complete(controller);
                          },
                          markers: Set<Marker>.of(mapProvider.markers),
                        ),
                      ),
                      if (mapProvider.searchResults != null &&
                          mapProvider.searchResults.length != 0)
                        Container(
                            height: 300.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.6),
                                backgroundBlendMode: BlendMode.darken)),
                      if (mapProvider.searchResults != null)
                        Container(
                          height: 300.0,
                          child: ListView.builder(
                              itemCount: mapProvider.searchResults.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    mapProvider
                                        .searchResults[index].description,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    mapProvider.setSelectedLocation(mapProvider
                                        .searchResults[index].placeId);
                                  },
                                );
                              }),
                        ),
                    ],
                  ),
                  ButtonWidget(
                    btnText: 'Next',
                    onClick: () {
                      Navigator.pop(context);
                      // setState(() {
                      //   locationSubscription.cancel();
                      // });
                    },
                  )
                ],
              ));
  }

  Future<void> _goToPlace(Place place) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(
                place.geometry.location.lat, place.geometry.location.lng),
            zoom: 14.0),
      ),
    );
  }
}
