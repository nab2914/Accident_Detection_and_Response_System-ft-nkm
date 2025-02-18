import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocationPage extends StatefulWidget {
  const CurrentLocationPage({super.key});

  @override
  _CurrentLocationPageState createState() => _CurrentLocationPageState();
}

class _CurrentLocationPageState extends State<CurrentLocationPage> {
  String _locationMessage = "Fetching location...";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    String locationMessage;

    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        locationMessage = "Location services are disabled.";
      } else {
        // Check for permissions
        LocationPermission permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            locationMessage = "Location permissions are denied.";
          } else {
            locationMessage = "Permission granted. Fetching...";
          }
        } else if (permission == LocationPermission.deniedForever) {
          locationMessage = "Location permissions are permanently denied.";
        } else {
          // Get the current position
          Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );

          locationMessage =
              "Latitude: ${position.latitude}\nLongitude: ${position.longitude}";
        }
      }
    } catch (e) {
      locationMessage = "Error fetching location: $e";
    }

    setState(() {
      _locationMessage = locationMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Current Location"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            _locationMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
