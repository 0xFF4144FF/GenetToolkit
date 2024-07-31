import 'package:http/http.dart';
import 'dart:convert';
import 'package:genet/utils/types.dart';

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

Future<WHOISData> getWHOISData(String domain) async {
  Uri uri = Uri(
    scheme: 'https',
    host: 'networkcalc.com',
    path: '/api/dns/whois/$domain'
  );
  Response response = await get(uri);
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
     
      dynamic udomainStatus = data['whois']['domain_status'];
      dynamic uregistrar = data['whois']['registrar'];
      dynamic uregistryCreatedDate = data['whois']['registry_created_date'];
      dynamic urigistryExpirationDate = data['whois']['registry_expiration_date'];
      dynamic uabuseEmail = data['whois']['abuse_email'];
      dynamic uabusePhone = data['whois']['abuse_phone']; 

      String domainStatus = data['whois']['domain_status'] != null ? udomainStatus : 'N/A';
      String registrar = data['whois']['registrar'] != null ? uregistrar : 'N/A';
      String registryCreatedDate = data['whois']['registry_created_date'] != null ? uregistryCreatedDate : 'N/A';
      String rigistryExpirationDate = data['whois']['registry_expiration_date'] != null ? urigistryExpirationDate : 'N/A';
      String abuseEmail = data['whois']['abuse_email'] != null ? uabuseEmail : 'N/A';
      String abusePhone = data['whois']['abuse_phone'] != null ? uabusePhone : 'N/A';   
      
      return WHOISData(domainStatus, registrar, registryCreatedDate, 
                       rigistryExpirationDate, abuseEmail, abusePhone);
                      
    } else {
      return WHOISData('N/A','N/A', 'N/A', 'N/A', 'N/A', 'N/A');
    } 
}