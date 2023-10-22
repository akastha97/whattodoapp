import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:whattodo_final/models/category_model.dart';
import 'package:whattodo_final/models/todo_model.dart';
import 'package:whattodo_final/screens/dashboard.dart';
import 'package:whattodo_final/screens/splashscreen.dart';

late Box catbox;
late Box tobox;

Future<void> main() async {
  timeDilation = 2.0;

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(CategoryModelAdapter());

  Hive.registerAdapter(TodoItemAdapter());
  // this box is for categories in the dashboard screen
  catbox = await Hive.openBox("categoryBox");

  // this box is for todos in Todo screen
  tobox = await Hive.openBox("todoBox");

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  // This is for the body of the main screen
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Playpen Sans"),
      routes: {
        '/dashboard': (context) => const DashboardScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
