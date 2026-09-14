//nuevo archivo creado para inciso 1 del examen parcial 1
//al presionar el boton de perfil en la pantalla de inicio, se redirige a esta pantalla
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  //visto en clase
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi perfil'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Regresa a la pantalla anterior visto en clase
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            //imagen circular
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blueGrey,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Examen parcial 1',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            const Divider(
              thickness: 1.5,
              color: Colors.grey,
            ),

            const SizedBox(height: 24),

            Card(
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading: const Icon(Icons.fitness_center, color: Colors.blue),
                title: const Text('Entrenamientos completado por ejemplo: 1000'),
                subtitle: const Text('Ultimo segundo'),
              ),
            ),
            Card(
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.directions_run, color: Colors.green),
                title: const Text('Último registro: Volar'),
                subtitle: const Text('3 años - .7 km'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}