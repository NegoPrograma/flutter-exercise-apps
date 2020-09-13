import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Completer<GoogleMapController> _apiController = Completer();
  Set<Marker> _markers = {};
  Position pos = Position();
  CameraPosition _cameraPos =
      CameraPosition(target: LatLng(-22.837985, -43.069880), zoom: 16);

  _moveCamera() async {
    GoogleMapController _mapController = await _apiController.future;
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(_cameraPos),
    );
  }

  /**
   * É possível fazer o contrário apenas mudando o tipo de placemark no geolocator.
   * 
   */
  void _convertCoordinatesToAdress() async {
    List<Placemark> places =
        await Geolocator().placemarkFromAddress("Belo Horizonte, 12");
    places.forEach((element) {
      String result =
          "\n area adm ${element.administrativeArea}\n locality ${element.locality}";
      print(result);
    });
  }

  void _getUserLocation() async {
    Position pos = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print("sua latitude:" +
        pos.latitude.toString() +
        "sua longitude" +
        pos.longitude.toString());
    setState(() {
      _cameraPos =
          CameraPosition(target: LatLng(pos.latitude, pos.longitude), zoom: 18);
    });
    _moveCamera();
  }

  void _locationListener() {
    Geolocator geolocator = Geolocator();
    LocationOptions opts =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    geolocator.getPositionStream(opts).listen((Position actualPos) {
      print("sua latitude:" +
          pos.latitude.toString() +
          "sua longitude" +
          pos.longitude.toString());
      setState(() {
        _cameraPos = CameraPosition(
            target: LatLng(pos.latitude, pos.longitude), zoom: 18);
      });
      _moveCamera();
    });
  }

  void _setMarkers() {
    Marker barroVermelho = Marker(
        markerId: MarkerId("Barro Vermelho"),
        position: LatLng(-22.837985, -43.069880),
        infoWindow: InfoWindow(title: "Barro Vermelho"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        onTap: () {
          //método executado quando clicamos no marker.
        });
    _markers.add(barroVermelho);

    setState(() => _markers = _markers);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setMarkers();
    _locationListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("pai ta geolocalizavel")),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: _convertCoordinatesToAdress,
      ),
      body: Container(
        child: GoogleMap(
          mapType: MapType.normal,
          //-22.837985, -43.069880
          initialCameraPosition: _cameraPos,

          onMapCreated: (controller) {
            _apiController.complete(controller);
          },
          myLocationEnabled: true,
          markers: _markers,
        ),
      ),
    );
  }
}
