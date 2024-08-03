import 'package:flutter/material.dart';
import 'package:genet/utils/hashing.dart';
import 'package:ionicons/ionicons.dart';

class Hashing extends StatefulWidget {
  const Hashing({super.key});

  @override
  State<Hashing> createState() => _HashingState();
}

class _HashingState extends State<Hashing> {

  String dropdownValue   = hashesList.first;
  final inputController  = TextEditingController();
  final outputController = TextEditingController();

  @override
  void dispose() {
    inputController.dispose();
    outputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(20, 23, 59, 1),
      ),
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
                    const Center(child: Text(':: Hashing ::', style: TextStyle(color: Colors.white, fontSize: 20),)),
                    const SizedBox(height: 50),
                 
                    DropdownButton<String>(
                      value: dropdownValue,
                      onChanged: (String? value){
                        if (value is String){ 
                          setState(() {
                            dropdownValue = value;
                          });
                        }
                      },
                      items: hashesList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(                      
                          value: value,
                          child: Text(value ,style: const TextStyle(color: Colors.white, fontSize: 15)),
                        );
                      }).toList(),
                      
                      iconEnabledColor: Colors.white,
                      dropdownColor: Colors.orange,
                      isExpanded: true,         
                      icon: const Icon(Ionicons.shield_half_sharp),     
                    ),
                    const SizedBox(height: 50),
                    TextField(
                      controller: inputController,
                      style: const TextStyle(color: Colors.orange),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelStyle: TextStyle(color: Colors.orange),
                        hintStyle: TextStyle(color: Colors.orange, fontSize: 13),
                        hintText: 'Input goes here...',
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: outputController,
                      readOnly: true,
                      maxLines: 5,
                      style: const TextStyle(color: Colors.orange),                   
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),                      
                        ),
                        hintStyle: TextStyle(color: Colors.orange, fontSize: 13),
                        hintText: 'Result goes here...',             
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 50,
                      child: FilledButton(
                        onPressed: () {
                          setState(() {
                            outputController.text = hashString(dropdownValue, inputController.text);
                          });
                        }, 
                        child: const Text('Hash'),
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