
class DNSData{
  String address = '';
  String ttl = '';
  DNSData(this.address, this.ttl);
}

class WHOISData{
  String domainStatus = 'N/A';
  String registrar = 'N/A';
  String registryCreatedDate = 'N/A';
  String rigistryExpirationDate = 'N/A';
  String abuseEmail = 'N/A';
  String abusePhone = 'N/A';
  WHOISData(this.domainStatus, this.registrar,
            this.registryCreatedDate, this.rigistryExpirationDate, 
            this.abuseEmail, this.abusePhone);
}