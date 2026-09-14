import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../../details/screens/detail_screen.dart';
import 'profile_screen.dart'; // Para la pantalla de perfil inciso 1 del examen parcial 1

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Activity> activities = [
    Activity(title: 'Pasos Diarios', isCompleted: true),
    Activity(title: 'Natación', isCompleted: false),
    Activity(title: 'Rutina de Fuerza', isCompleted: true),
    Activity(title: 'Sesión de Box', isCompleted: true),
    Activity(title: 'Desayuno', isCompleted: true),
    Activity(title: 'Comida', isCompleted: true),
  ];

  void toggleActivity(int index) {
    setState(() {
      activities[index].isCompleted = !activities[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Actividad Física'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [ //seccion investigada y agregada para boton 
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: activities.length,
        itemBuilder: (context, index) {
          return ActivityCard(
            activity: activities[index],
            onToggle: () => toggleActivity(index), 
          );
        },
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final VoidCallback onToggle; 

  const ActivityCard({
    super.key, 
    required this.activity,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: activity.isCompleted ? Colors.green.shade100 : Colors.white,
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(activity: activity),
            ),
          );
        },
        child: ListTile(
          title: Text(
            activity.title,
            style: TextStyle(
              color: activity.isCompleted ? Colors.green.shade900 : Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            activity.isCompleted ? '¡Completado!' : 'Pendiente de completar',
            style: TextStyle(
              color: activity.isCompleted ? Colors.green.shade700 : Colors.grey.shade600,
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              activity.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
              color: activity.isCompleted ? Colors.green : Colors.grey,
            ),
            onPressed: onToggle,
          ),
        ),
      ),
    );
  }
}