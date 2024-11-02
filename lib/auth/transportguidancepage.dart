import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TransportGuidancePage extends StatelessWidget {
  const TransportGuidancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Next Transport Point"),
      ),
      body: Stack(
        children: [
          // Map showing current location and Lagos-specific transport points
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(6.5244, 3.3792), // Central Lagos
              zoom: 12.0,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            markers: _buildLagosMarkers(),
            polylines: {
              Polyline(
                polylineId: const PolylineId("main_route"),
                color: Colors.blue,
                width: 5,
                points: _getExtendedRouteCoordinates(), // Extended route points
              ),
            },
          ),

          // Transport option card at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.directions_walk, size: 30, color: Colors.blue),
                      SizedBox(width: 10),
                      Text(
                        "Walk to your next point: Yaba Bus Stop",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Distance: 2km | Estimated Time: 25 minutes",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to detailed directions
                    },
                    child: const Text("Get Directions"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to build markers for main locations, transport points, and popular places in Lagos
  Set<Marker> _buildLagosMarkers() {
    return {
      // Transport Points
      const Marker(
        markerId: MarkerId('CMS Bus Stop'),
        position: LatLng(6.4513, 3.3915), // CMS Bus Stop coordinates
        infoWindow: InfoWindow(title: 'CMS Bus Stop'),
      ),
      const Marker(
        markerId: MarkerId('Ikeja Bus Stop'),
        position: LatLng(6.6018, 3.3515), // Ikeja coordinates
        infoWindow: InfoWindow(title: 'Ikeja Bus Stop'),
      ),
      const Marker(
        markerId: MarkerId('Oshodi Bus Stop'),
        position: LatLng(6.5539, 3.3431), // Oshodi coordinates
        infoWindow: InfoWindow(title: 'Oshodi Bus Stop'),
      ),

      // Popular Places and Landmarks
      const Marker(
        markerId: MarkerId('Yaba Bus Stop'),
        position: LatLng(6.5095, 3.3772), // Yaba coordinates
        infoWindow: InfoWindow(title: 'Yaba Bus Stop'),
      ),
      const Marker(
        markerId: MarkerId('Lekki Toll Gate'),
        position: LatLng(6.4473, 3.5163), // Lekki Toll Gate coordinates
        infoWindow: InfoWindow(title: 'Lekki Toll Gate'),
      ),
      const Marker(
        markerId: MarkerId('Victoria Island'),
        position: LatLng(6.4281, 3.4219), // Victoria Island coordinates
        infoWindow: InfoWindow(title: 'Victoria Island'),
      ),
      const Marker(
        markerId: MarkerId('Surulere Stadium'),
        position: LatLng(6.4976, 3.3679), // Surulere coordinates
        infoWindow: InfoWindow(title: 'Surulere Stadium'),
      ),
      const Marker(
        markerId: MarkerId('Third Mainland Bridge'),
        position: LatLng(6.5242, 3.4141), // Third Mainland Bridge coordinates
        infoWindow: InfoWindow(title: 'Third Mainland Bridge'),
      ),
    };
  }

  // Method to get extended route coordinates between Lagos points
  List<LatLng> _getExtendedRouteCoordinates() {
    return const [
      LatLng(6.4513, 3.3915), // CMS Bus Stop
      LatLng(6.5095, 3.3772), // Yaba
      LatLng(6.5244, 3.3792), // Central Lagos
      LatLng(6.5539, 3.3431), // Oshodi
      LatLng(6.6018, 3.3515), // Ikeja
      LatLng(6.4976, 3.3679), // Surulere Stadium
      LatLng(6.5242, 3.4141), // Third Mainland Bridge
      LatLng(6.4473, 3.5163), // Lekki Toll Gate
      LatLng(6.4281, 3.4219), // Victoria Island
    ];
  }
}
