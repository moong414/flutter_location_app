import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_location_app/data/repository/review_repository.dart';
import 'package:flutter_location_app/firebase_options.dart';
import 'package:flutter_location_app/ui/home_page/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final repo = ReviewRepository();
  await repo.insert(
    id: 'ddd',
    content: 'dddddfee',
    mapX: 'erer',
    mapY: 'dferer',
    createdAt: DateTime.now().toIso8601String(),
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
