import 'dart:convert';
import 'package:convert/convert.dart';

const String iBASE64 = 'Base64';
const String iUTF8   = 'UTF-8'; 
const String iASCII  = 'ASCII'; 
const String iLATIN1 = 'Latin-1';

List<String> encodingdecodingList = [iBASE64, iUTF8, iASCII, iLATIN1];

String base64Encode(String input) {
  final base64Encoder = base64.encoder;
  return base64Encoder.convert(input.codeUnits);
}

String utf8Encode(String input) {
  final utf8Encoder = utf8.encoder; 
  return hex.encode(utf8Encoder.convert(input));
}

String asciiEncode(String input) {
  return hex.encode(ascii.encode(input));
}

String latin1Encode(String input) {
  return hex.encode(latin1.encode(input));
}

String encodeString(String format, String input) {
  String outputResult = '';
  try {  
    if (format.isEmpty) {
      return 'Please Select Format!';
    } 
    if (input.isEmpty) {
      return 'Please Fill The Input!';
    }

    switch (format) {
      case iBASE64 : outputResult = base64Encode(input); 
      case iUTF8   : outputResult = utf8Encode(input); 
      case iASCII  : outputResult = asciiEncode(input); 
      case iLATIN1 : outputResult = latin1Encode(input);
    }

  } catch (e) {
    outputResult = 'Incorrect Format!';
  }
  return outputResult;
}