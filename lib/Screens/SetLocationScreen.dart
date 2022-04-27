import 'dart:async';
import 'dart:collection';
import 'dart:ffi';

import 'package:bengal_home_service/Constants.dart';
import 'package:bengal_home_service/Screens/HomeScreen.dart';
import 'package:bengal_home_service/Screens/SignUp.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class SetLocationScreen extends StatefulWidget {
  @override
  _SetLocationScreenState createState() => _SetLocationScreenState();
}

class _SetLocationScreenState extends State<SetLocationScreen> {
  // GlobalVariable gv = new GlobalVariable();
  Set<Marker> _markers = HashSet<Marker>();
  double longitude = 0;
  double latitude = 0;
  Position? position1;
  String Address = "";
  String Locality = "";
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      GetAddressFromLatLong(position);

      position1 = position;
      _markers.add(Marker(
          markerId: MarkerId(1.toString()),
          position: LatLng(position1!.latitude, position1!.longitude)));
      longitude = position.longitude;
      latitude = position.latitude;
    });

    print(position.latitude);
    print(position.longitude);

    return await Geolocator.getCurrentPosition();
  }

  double GetLatitude() {
    return latitude;
  }

  double GetLongitude() {
    return longitude;
  }

  @override
  void initState() {
    _determinePosition();
    super.initState();
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // print(placemarks);
    Placemark place = placemarks[0];
    Locality = "${place.locality}";
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

    print(Address.trim());
  }

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: position1 != null
          ? GoogleMap(
              mapType: MapType.normal,
              markers: _markers,
              initialCameraPosition: CameraPosition(
                target: LatLng(position1!.latitude, position1!.longitude),
                zoom: 18.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            )
          : Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            Constants.Address = Address;
            Constants.Locality = Locality;
            print(Constants.Address);
          });
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                     // HomeScreen(Address, Locality)
               HomeScreen(Address, Locality)
              ));
        },
        label: Text('Set Location'),
        icon: Icon(Icons.location_history),
      ),
    );
  }
}
