import 'package:flutter/material.dart';
// import 'package:simple_todo/features/todo/data/models/local/local_model.dart';
import 'package:simple_todo/features/todo/presentation/screens/home.dart';
// import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Hive.initFlutter();

  // Hive.registerAdapter(TodoLocalModelAdapter());
  // await Hive.openBox<TodoLocalModel>('todos');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
