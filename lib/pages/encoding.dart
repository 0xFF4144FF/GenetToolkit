import 'package:flutter/material.dart';
import 'package:genet/pages/encoding/encoding.dart';
import 'package:genet/pages/encoding/decoding.dart';

class Encoding extends StatefulWidget {
  const Encoding({super.key});

  @override
  State<Encoding> createState() => _EncodingState();
}

class _EncodingState extends State<Encoding> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController( 
      length: 2,
      child: Scaffold(   
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromRGBO(20, 23, 59, 1),
        ),
        backgroundColor:const Color.fromRGBO(20, 23, 59, 1), 
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(child: Text('[Encoding]', style: TextStyle(color: Colors.white),)),
            Tab(child: Text('[Decoding]', style: TextStyle(color: Colors.white),),),
          ]
        ),
        body : const TabBarView(
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            Encode(), 
            Decode(),   
          ],
        ),
      ),
    );
  }
}