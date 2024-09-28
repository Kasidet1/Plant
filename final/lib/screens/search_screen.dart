import 'package:flutter/material.dart';
import 'plant_details_screen.dart';  // import หน้ารายละเอียดพรรณไม้

class SearchScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final List<String> plants = ['Rose', 'Tulip', 'Cactus', 'Orchid', 'Sunflower'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search Plants',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
            ),
            onChanged: (query) {
              // คุณสามารถใช้ฟังก์ชันนี้เพื่อค้นหาพรรณไม้จากฐานข้อมูลหรือ API
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: plants.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(plants[index]),
                onTap: () {
                  // เมื่อกดจะนำไปสู่หน้ารายละเอียดพรรณไม้
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlantDetailsScreen(
                        plantName: plants[index],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
