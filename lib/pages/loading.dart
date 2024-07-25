import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(20, 23, 59, 1),
      body: SafeArea(
        child: Center(
            child: SpinKitThreeInOut(
            color: Color.fromRGBO(103, 80, 164, 1),
            size: 100,
          ),
        ),
      ),
    );
  }
}