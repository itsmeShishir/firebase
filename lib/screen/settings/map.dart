import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  Set<Marker> markers = {};
  LatLng myLocation = const LatLng(27.7214694, 85.3603247);
  LatLng myLocation1 = const LatLng(27.7214694, 85.3603247);
  @override
  void initState() {
    markers.add(
      Marker(
        markerId: MarkerId(myLocation1.toString()),
        position: myLocation1,
        infoWindow: const InfoWindow(
          title: 'Hamro Car Parts',
          snippet: 'Servecing Location',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Servecing Location",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Servecing Location",
                  style: TextStyle(
                    color: Color.fromARGB(255, 23, 173, 63),
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 500,
              child: GoogleMap(
                zoomControlsEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: myLocation,
                  zoom: 10,
                ),
                markers: markers,
                mapType: MapType.normal,
                onMapCreated: ((controller) => _mapController = controller),
              ),
            )
          ],
        ),
      ),
    );
  }
}