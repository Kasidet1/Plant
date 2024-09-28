import 'package:flutter/material.dart';
import 'plant_details_screen.dart';  // import หน้ารายละเอียดพรรณไม้

class CategoriesScreen extends StatelessWidget {
  final List<String> categories = ['Flowering Plants', 'Foliage Plants', 'Cactus', 'Trees'];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: categories.length,
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlantDetailsScreen(
                  plantName: categories[index],  // ใช้หมวดหมู่หรือส่งชื่อพรรณไม้ที่แท้จริงในกรณีนี้
                ),
              ),
            );
          },
          child: Card(
            elevation: 4,
            child: Center(
              child: Text(
                categories[index],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}
