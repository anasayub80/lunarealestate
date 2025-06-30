import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_places_autocomplete/google_places_autocomplete.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Pages/GoogleMap/search_places.dart';

const kGoogleApiKey = "AIzaSyCqUd6HTIUNSS1kjbCeX6bvIg6VwBxEXKM";

class MapPicker extends StatefulWidget {
  @override
  _MapPickerState createState() => _MapPickerState();
}

class _MapPickerState extends State<MapPicker> {
  GoogleMapController? mapController;
  LatLng _cameraPosition = LatLng(37.4219999, -122.0840575);
  String _address = "";
  late final GooglePlacesAutocomplete _placesAutocomplete;

  @override
  void initState() {
    super.initState();
    _placesAutocomplete = GooglePlacesAutocomplete(
      apiKey: kGoogleApiKey,
      predictionsListner: (predictions) {
        // Handle predictions and update UI
      },
    );
    _placesAutocomplete.initialize();
    _getAddressFromLatLng(_cameraPosition);
  }

  Future<void> _getAddressFromLatLng(LatLng pos) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        pos.latitude,
        pos.longitude,
      );
      Placemark place = placemarks[0];
      setState(() {
        _address =
            "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      });
    } catch (e) {
      print("Error getting address: $e");
    }
  }

  Future<void> _handleSearch() async {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return PlacesAutocompleteScreen();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemes.bgColor,
        title: Text("Select Location"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _handleSearch();
            },
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: _cameraPosition, zoom: 16),
            onMapCreated: (controller) {
              mapController = controller;
            },
            onCameraMove: (position) {
              debugPrint("Camera Move");
              setState(() {
                _cameraPosition = position.target;
              });
            },
            onCameraIdle: () {
              debugPrint("Camera Idle");
              _getAddressFromLatLng(_cameraPosition);
            },
            zoomControlsEnabled: true,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),

          // Floating Pin in center of screen
          Icon(Icons.location_pin, size: 50, color: Colors.red),

          // Address Box at bottom
          Positioned(
            bottom: 30,
            left: 15,
            right: 15,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black26)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("📍 $_address", textAlign: TextAlign.center),
                  SizedBox(height: 5),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppThemes.primaryColor),
                      minimumSize: WidgetStatePropertyAll(
                        Size(double.infinity, 45),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, {
                        "address": _address,
                        "lat": _cameraPosition.latitude,
                        "lng": _cameraPosition.longitude
                      });
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  )
                  // Text(
                  //   "Lat: ${_cameraPosition.latitude}, "
                  //   "Lng: ${_cameraPosition.longitude}",
                  //   style: TextStyle(fontSize: 12),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
