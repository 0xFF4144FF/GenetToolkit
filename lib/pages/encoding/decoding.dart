import 'package:flutter/material.dart';
import 'package:genet/utils/encoding.dart';

class Decode extends StatefulWidget {
  const Decode({super.key});

  @override
  State<Decode> createState() => _EncodingState();
}

class _EncodingState extends State<Decode> {
 
  String dropdownValue = encodingdecodingList.first;
  final inputController = TextEditingController(); 
  final outputController = TextEditingController(); 

  @override
  void dispose() {
    outputController.dispose();
    inputController.dispose();
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
                    const Center(child: Text(':: Decoding ::', style: TextStyle(color: Colors.white, fontSize: 20),)),
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
                      items: encodingdecodingList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(                      
                          value: value,
                          child: Text(value ,style: const TextStyle(color: Colors.white, fontSize: 15)),
                        );
                      }).toList(),
                      iconEnabledColor: Colors.white,
                      dropdownColor: Colors.orange,
                      isExpanded: true,         
                      icon: const Icon(Icons.enhanced_encryption),     
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
                            outputController.text = decodeString(dropdownValue, inputController.text);
                          });
                        }, 
                        child: const Text('Decode'),
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