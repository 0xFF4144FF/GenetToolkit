import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(20, 23, 59, 1),
        leading: Builder(
          builder: (context){ 
            return IconButton(
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                color: Colors.white,
                Icons.menu
              )
            );
          },
        ),
      ),
      drawer: Drawer(
        shape: const LinearBorder(),
        backgroundColor: const Color.fromRGBO(21, 25, 77, 1),
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: const Icon(Icons.dns, color: Colors.white),
                title: const Text('DNS LOOKUP', style: TextStyle(color: Colors.white, fontSize: 15, letterSpacing: 2)),
                onTap: (){
                  Navigator.pushNamed(context, 'dnslookup');
                },          
              ),
              ListTile(
                leading: const Icon(Icons.web_stories, color: Colors.white),
                title: const Text('WHOIS LOOKUP', style: TextStyle(color: Colors.white, fontSize: 15, letterSpacing: 2)),
                onTap: (){
                  Navigator.pushNamed(context, 'whois');
                },          
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(20, 23, 59, 1),
      body: const SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage('assets/genet.png'), 
                height: 250
              ),
              SizedBox(
                height: 20
              ),
              Text('GENET TOOLKIT', style: TextStyle(color: Colors.white, fontSize: 30),),
              SizedBox(
                height: 15
              ),
              Text('V0.0.1', style: TextStyle(color: Colors.white, fontSize: 10),)
            ],
          ),
        ),
      ),
    );
  }
}