import 'package:flutter/material.dart';

List<String> encodingdecodingList = ['Base64', 'sdfsdfsdf', 'sdfsdfsdf'];

class Encode extends StatefulWidget {
  const Encode({super.key});

  @override
  State<Encode> createState() => _EncodingState();
}

class _EncodingState extends State<Encode> {
 
  String dropdownValue = encodingdecodingList.first;

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
                    const Center(child: Text(':: Encoding ::', style: TextStyle(color: Colors.white, fontSize: 20),)),
                    const SizedBox(height: 50),

                    // DropdownButton<String>(
                    //   value: dropdownValue,
                    //   onChanged: (String? value){
                    //     setState(() {
                    //       dropdownValue = value!;
                    //     });
                    //   },
                    //   items: encodingdecodingList.map<DropdownMenuItem<String>>((String value) {
                    //     return DropdownMenuItem<String>(
                    //       value: value,
                    //       child: Text(value),
                    //     );
                    //   }).toList(),
                    // ),

                    const SizedBox(height: 50),
                    const TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelStyle: TextStyle(color: Colors.orange),
                        hintStyle: TextStyle(color: Colors.white, fontSize: 13),
                        hintText: 'Input goes here!',
                      ),
                    ),
                    const SizedBox(height: 30),
                    const TextField(
                      maxLines: 5,
                      style: const TextStyle(color: Colors.white),                   
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),                      
                        ),
                        hintStyle: TextStyle(color: Colors.white, fontSize: 13),
                        hintText: 'Output goes here',             
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 50,
                      child: FilledButton(
                        onPressed: () {}, 
                        child: const Text('Encode'),
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