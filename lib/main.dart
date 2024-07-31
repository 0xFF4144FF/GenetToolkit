import 'package:flutter/material.dart';
import 'package:genet/pages/home.dart';
import 'package:genet/pages/loading.dart';
import 'package:genet/pages/networking.dart';
import 'package:genet/pages/encoding.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Michroma', 
      ),
      initialRoute: '/',
      routes: {
        '/'          : (context) => const Home(), 
        'loading'    : (context) => const Loading(),
        'networking' : (context) => const Networking(),
        'encoding'   : (context) => const Encoding(),
      },
    );
  }
}
