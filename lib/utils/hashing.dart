import 'package:crypto/crypto.dart';
import 'dart:convert';

const String iSHA_1       = 'SHA-1';
const String iSHA_224     = 'SHA-224'; 
const String iSHA_256     = 'SHA-256'; 
const String iSHA_384     = 'SHA-384';
const String iSHA_512     = 'SHA-512';
const String iSHA_512_224 = 'SHA-512-224';
const String iSHA_512_256 = 'SHA-512-256';
const String iMD5         = 'MD5';

List<String> hashesList = [iSHA_1, iSHA_224, iSHA_256, iSHA_384, 
                           iSHA_512, iSHA_512_224, iSHA_512_256, 
                           iMD5];


String sha_1Hashing(String input) {
  var bytes = utf8.encode(input); 
  var digest = sha1.convert(bytes);
  return digest.toString();
} 

String sha_224Hashing(String input) {
  var bytes = utf8.encode(input); 
  var digest = sha224.convert(bytes);
  return digest.toString();
} 

String sha_256Hashing(String input) {
  var bytes = utf8.encode(input); 
  var digest = sha256.convert(bytes);
  return digest.toString();
} 

String sha_384Hashing(String input) {
  var bytes = utf8.encode(input); 
  var digest = sha384.convert(bytes);
  return digest.toString();
} 

String sha_512Hashing(String input) {
  var bytes = utf8.encode(input); 
  var digest = sha512.convert(bytes);
  return digest.toString();
} 

String sha_512_224Hashing(String input) {
  var bytes = utf8.encode(input); 
  var digest = sha512224.convert(bytes);
  return digest.toString();
}

String sha_512_256Hashing(String input) {
  var bytes = utf8.encode(input); 
  var digest = sha512256.convert(bytes);
  return digest.toString();
}

String md5Hashing(String input) {
  var bytes = utf8.encode(input); 
  var digest = md5.convert(bytes);
  return digest.toString();
}

String hashString(String format, String input) {
  String outputResult = '';
  try {  
    if (format.isEmpty) {
      return 'Please Select Format!';
    } 
    if (input.isEmpty) {
      return 'Please Fill The Input!';
    }

    switch (format) {
      case iSHA_1       : outputResult = sha_1Hashing(input); 
      case iSHA_224     : outputResult = sha_224Hashing(input); 
      case iSHA_256     : outputResult = sha_256Hashing(input); 
      case iSHA_384     : outputResult = sha_384Hashing(input); 
      case iSHA_512     : outputResult = sha_512Hashing(input); 
      case iSHA_512_224 : outputResult = sha_512_224Hashing(input); 
      case iSHA_512_256 : outputResult = sha_512_256Hashing(input); 
      case iMD5         : outputResult = md5Hashing(input); 
    }

  } catch (e) {
    outputResult = 'Incorrect Format!';
  }
  return outputResult;
}