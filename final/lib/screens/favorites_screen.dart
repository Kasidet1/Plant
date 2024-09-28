import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<String> favoritePlants = ['Rose', 'Orchid', 'Sunflower'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favoritePlants.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(favoritePlants[index]),
          trailing: Icon(Icons.favorite, color: Colors.red),
          onTap: () {
            // เมื่อกดจะนำไปสู่หน้ารายละเอียดพรรณไม้ที่ชื่นชอบ
          },
        );
      },
    );
  }
}
