import 'package:flutter/material.dart';

class PlantDetailsScreen extends StatelessWidget {
  final String plantName;

  PlantDetailsScreen({required this.plantName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$plantName Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              plantName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Here is some detailed information about the $plantName.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            // Example image, modify as necessary
            Image.asset('assets/$plantName.jpg'),
          ],
        ),
      ),
    );
  }
}
