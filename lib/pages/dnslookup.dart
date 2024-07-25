import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class DNSData{
  String address = '';
  String ttl = '';
  DNSData(this.address, this.ttl);
}

Future<DNSData> getDNSData(String domain) async {
  Uri uri = Uri(
    scheme: 'https',
    host: 'networkcalc.com',
    path: '/api/dns/lookup/$domain'
  );
  Response response = await get(uri);
  if (response.statusCode == 200) {
    Map data = jsonDecode(response.body);
    List<dynamic> dataList = data['records']['A'];

    dynamic uaddress = dataList[0]['address'];
    dynamic uttl = dataList[0]['ttl'];

    String address = dataList[0]['address'] != null ? uaddress : 'N/A';
    String ttl = dataList[0]['ttl'] != null ? uttl.toString() : 'N/A';
    return DNSData(address, ttl);
  } else {
    return DNSData('N/A','N/A');
  }
}

class DnsLookup extends StatefulWidget {
  const DnsLookup({super.key});

  @override
  State<DnsLookup> createState() => _DnsLookupState();
}

class _DnsLookupState extends State<DnsLookup> {
  
  final hostController = TextEditingController();
  String address = 'N/A';
  String ttl = 'N/A';
  
  @override
  void dispose() {
    hostController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 23, 59, 1),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Column( 
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 30),
                    const Center(child: Text(':: DNS LOOKUP ::', style: TextStyle(color: Colors.white, fontSize: 20),)),
                    const SizedBox(height: 50),
                    TextField(
                      controller: hostController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelStyle: TextStyle(color: Colors.orange),
                        hintStyle: TextStyle(color: Colors.white, fontSize: 13),
                        hintText: 'example.com',
                        labelText: 'Host:',
                      ),
                    ),
                    const SizedBox(height: 30),
                    Card(
                      elevation: 10,
                      color: const Color.fromRGBO(25, 35, 69, 1),
                      child: ListTile( 
                        leading: const Icon(Icons.dns, color: Colors.white,),
                        title: const Text('Address', style: TextStyle(color: Colors.white, fontSize: 15)),
                        subtitle: Text(address, style: const TextStyle(letterSpacing: 4, color: Colors.white, fontSize: 12),),
                      )
                    ),        
                    Card(
                      elevation: 10,
                      color: const Color.fromRGBO(25, 35, 69, 1),
                      child: ListTile( 
                        leading: const Icon(Icons.timelapse, color: Colors.white,),
                        title: const Text('TTL', style: TextStyle(color: Colors.white, fontSize: 15)),
                        subtitle: Text(ttl, style: const TextStyle(letterSpacing: 4, color: Colors.white, fontSize: 12),),
                      )
                    ),       
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 50,
                      child: FilledButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, 'loading');
                          DNSData data = await getDNSData(hostController.text);
                          setState(() {
                            address = data.address;
                            ttl = data.ttl;              
                            FocusScope.of(context).requestFocus(FocusNode());
                            Navigator.pop(context);                 
                          });
                        }, 
                        child: const Text('Search'),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 50,
                      child: FilledButton(
                        onPressed: (){
                          Navigator.pop(context);
                        }, 
                        child: const Icon(Icons.home),
                      ),
                    ),
                  ],
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}