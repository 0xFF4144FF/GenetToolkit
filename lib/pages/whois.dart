import 'package:flutter/material.dart';
import 'package:genet/utils/types.dart';
import 'package:genet/utils/networking_funcs.dart';

class Whois extends StatefulWidget {
  const Whois({super.key});

  @override
  State<Whois> createState() => _WhoisState();
}

class _WhoisState extends State<Whois> {

  final domainController = TextEditingController();
  String domainStatus = 'N/A';
  String registrar = 'N/A';
  String registryCreatedDate = 'N/A';
  String rigistryExpirationDate = 'N/A';
  String abuseEmail = 'N/A';
  String abusePhone = 'N/A';

  @override
  void dispose() {
    domainController.dispose();
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
                    const Center(child: Text(':: WHOIS LOOKUP ::', style: TextStyle(color: Colors.white, fontSize: 20),)),
                    const SizedBox(height: 50),
                    TextField(
                      controller: domainController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelStyle: TextStyle(color: Colors.orange),
                        hintStyle: TextStyle(color: Colors.white, fontSize: 13),
                        hintText: 'example.com',
                        labelText: 'Domain:',
                      ),
                    ),
                    const SizedBox(height: 30),
                    Card(
                      elevation: 10,
                      color: const Color.fromRGBO(25, 35, 69, 1),
                      child: ListTile( 
                        leading: const Icon(Icons.domain, color: Colors.white,),
                        title: const Text('Domain Status', style: TextStyle(color: Colors.white, fontSize: 15)),
                        subtitle: Text(domainStatus, style: const TextStyle(letterSpacing: 2, color: Colors.white, fontSize: 12),),
                      )
                    ),
                    Card(
                      elevation: 10,
                      color: const Color.fromRGBO(25, 35, 69, 1),
                      child: ListTile( 
                        leading: const Icon(Icons.people, color: Colors.white,),
                        title: const Text('Registrar', style: TextStyle(color: Colors.white, fontSize: 15)),
                        subtitle: Text(registrar, style: const TextStyle(letterSpacing: 2, color: Colors.white, fontSize: 12),),
                      )
                    ),
                    Card(
                      elevation: 10,
                      color: const Color.fromRGBO(25, 35, 69, 1),
                      child: ListTile( 
                        leading: const Icon(Icons.date_range, color: Colors.white,),
                        title: const Text('Registry Created Date', style: TextStyle(color: Colors.white, fontSize: 15)),
                        subtitle: Text(registryCreatedDate, style: const TextStyle(letterSpacing: 2, color: Colors.white, fontSize: 12),),
                      )
                    ),
                    Card(
                      elevation: 10,
                      color: const Color.fromRGBO(25, 35, 69, 1),
                      child: ListTile( 
                        leading: const Icon(Icons.date_range, color: Colors.white,),
                        title: const Text('Registry Expiration Date', style: TextStyle(color: Colors.white, fontSize: 15)),
                        subtitle: Text(rigistryExpirationDate, style: const TextStyle(letterSpacing: 2, color: Colors.white, fontSize: 12),),
                      )
                    ),
                    Card(
                      elevation: 10,
                      color: const Color.fromRGBO(25, 35, 69, 1),
                      child: ListTile( 
                        leading: const Icon(Icons.email, color: Colors.white,),
                        title: const Text('Abuse Email', style: TextStyle(color: Colors.white, fontSize: 15)),
                        subtitle: Text(abuseEmail, style: const TextStyle(letterSpacing: 2, color: Colors.white, fontSize: 12),),
                      )
                    ),
                    Card(
                      elevation: 10,
                      color: const Color.fromRGBO(25, 35, 69, 1),
                      child: ListTile( 
                        leading: const Icon(Icons.phone, color: Colors.white,),
                        title: const Text('Abuse Phone', style: TextStyle(color: Colors.white, fontSize: 15)),
                        subtitle: Text(abusePhone, style: const TextStyle(letterSpacing: 2, color: Colors.white, fontSize: 12),),
                      )
                    ),
                    const SizedBox(height: 30),
                    SizedBox(   
                      height: 50,
                      child: FilledButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, 'loading');
                          WHOISData data = await getWHOISData(domainController.text);
                          setState(() {                         
                            domainStatus = data.domainStatus;
                            registrar = data.registrar;
                            registryCreatedDate = data.registryCreatedDate;
                            rigistryExpirationDate = data.rigistryExpirationDate;
                            abuseEmail = data.abuseEmail;
                            abusePhone = data.abusePhone;       
                            FocusScope.of(context).requestFocus(FocusNode());
                            Navigator.pop(context);                 
                          });
                        },
                        child: const Text('Search'),
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