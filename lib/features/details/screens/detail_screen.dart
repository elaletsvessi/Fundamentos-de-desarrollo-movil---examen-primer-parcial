import 'package:flutter/material.dart';
import '../../home/models/activity.dart';

class DetailScreen extends StatelessWidget {
  final Activity activity; 

  const DetailScreen({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activity.title),  //usa el nombre de la pantalla anterior
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Detalles de la actividad', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              // Navigator.pop regresa a la pantalla anterior
              onPressed: () => Navigator.pop(context), 
              child: const Text("Volver"),
            ),
          ],
        ),
      ),
    );
  }
}