import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:public_transport_navigator/auth/transportguidancepage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        automaticallyImplyLeading: false, // No back arrow
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Logout functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Header
            const Text(
              "Hello, User!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "What would you like to do today?",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // Map Preview (User's Current Location)
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(6.5244, 3.3792), // Example location (Lagos)
                    zoom: 14.0,
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Features in a Grid
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildFeatureCard(
                  icon: Icons.directions,
                  title: "Get Directions",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) => const TransportGuidancePage()));
                    // Navigate to Directions screen
                  },
                ),
                _buildFeatureCard(
                  icon: Icons.settings,
                  title: "Settings",
                  onTap: () {
                    // Navigate to Settings screen
                  },
                ),
                _buildFeatureCard(
                  icon: Icons.help,
                  title: "Help",
                  onTap: () {
                    // Navigate to Help screen
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build the feature cards
  Widget _buildFeatureCard(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blue),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
