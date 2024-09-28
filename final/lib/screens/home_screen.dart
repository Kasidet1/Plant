import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'plant_model.dart';
import 'edit_plant_screen.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Plant> _plants = [];

  @override
  void initState() {
    super.initState();
    _loadPlants();
  }

  Future<void> _loadPlants() async {
    final plants = await DBHelper().getPlants();
    setState(() {
      _plants = plants;
    });
  }

  Future<void> _deletePlant(int id) async {
    await DBHelper().deletePlant(id);
    _loadPlants(); // Reload plants after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _plants.isEmpty
          ? Center(child: Text('No plants added yet.'))
          : ListView.builder(
              itemCount: _plants.length,
              itemBuilder: (context, index) {
                final plant = _plants[index];
                return Dismissible(
                  key: Key(plant.id.toString()), // Unique key for each plant
                  background: Container(
                    color: Colors.red, // Color of the background when swiped
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (direction) {
                    _deletePlant(plant.id!); // Call delete method when dismissed
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${plant.name} deleted')),
                    );
                  },
                  child: ListTile(
                    leading: Image.file(File(plant.imagePath), width: 50, height: 50),
                    title: Text(plant.name),
                    subtitle: Text(plant.description),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditPlantScreen(plant: plant),
                        ),
                      ).then((value) {
                        if (value == true) {
                          _loadPlants(); // Reload plants after editing
                        }
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}
