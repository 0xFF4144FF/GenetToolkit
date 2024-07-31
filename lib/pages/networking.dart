import 'package:flutter/material.dart';
import 'package:genet/pages/dnslookup.dart';
import 'package:genet/pages/whois.dart';

class Networking extends StatefulWidget {
  const Networking({super.key}); 

  @override
  State<Networking> createState() => _NetworkingState();
}
class _NetworkingState extends State<Networking>{

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
            Tab(child: Text('[DNS Lookup]', style: TextStyle(color: Colors.white),)),
            Tab(child: Text('[WHOIS Lookup]', style: TextStyle(color: Colors.white),),),
          ]
        ),
        body : const TabBarView(
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            DnsLookup(), 
            Whois(),   
          ],
        ),
      ),
    );
  }
}