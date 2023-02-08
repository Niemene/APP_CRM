import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  User(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.pec,
      required this.codfis,
      required this.phone,
      required this.mobilePhone,
      required this.address,
      required this.postalCode,
      required this.city,
      required this.state});
  int id;
  String firstname;
  String lastname;
  String email;
  String? pec;
  String codfis;
  String phone;
  String mobilePhone;
  String address;
  String postalCode;
  String city;
  String state;

  List<Contract> contracts = [];
  List<Invoice> invoiceEntry = [];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      pec: json['pec'],
      codfis: json['codfis'],
      phone: json['phone'],
      mobilePhone: json['mobilephone'],
      address: json['address'],
      postalCode: json['postalcode'],
      city: json['city'],
      state: json['state'],
    );
  }

  Future<void> fetchData() async {
    await fetchContracts();
    for (var contract in contracts) {
      await contract.fetchServices();
    }
    for (var contract in contracts) {
      for (var service in contract.services) {
        await service.fetchDevices();
      }
    }
  }

  Future<void> fetchContracts() async {
    // Make API call to retrieve contracts
    final response = await http.post(
        Uri.parse(dotenv.env['API_FETCHCONTRACT'].toString()),
        headers: {
          HttpHeaders.authorizationHeader: dotenv.env['API_KEY'].toString(),
        },
        body:{

          "customerId": id.toString(),
        });
    var data = jsonDecode(response.body);
    var contractsJson = data as List;
    contracts = contractsJson.map((contract) => Contract.fromJson(contract)).toList();
  }

  Future<void> fetchInvoices() async {
    // Make API call to retrieve services
    var response = await http.post(
      Uri.parse("http://10.0.2.2:18088/adminarea/invoiceEntry/getall"),
    );
    var data = jsonDecode(response.body);

    var invoicesJson = data['invoiceEntries'] as List;
    invoiceEntry =
        invoicesJson.map((invoice) => Invoice.fromJson(invoice)).toList();
  }
}

class Contract {
  Contract(
      {required this.id,
      required this.name,
      required this.state,
      required this.address});
  int id;
  String name;
  String state;
  String address;

  List<Service> services = [];

  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
      id: json['id'],
      name: json['description'],
      state: json['state'],
      address: json['address'],
    );
  }

  Future<void> fetchServices() async {
    // Make API call to retrieve services
    var response = await http.post(
        Uri.parse(dotenv.env['API_FETCHSERVICE'].toString()),
        headers: {
          HttpHeaders.authorizationHeader: dotenv.env['API_KEY'].toString(),
        },
        body: {
          "contractId": id.toString(),
        });
    var data = jsonDecode(response.body);
    var servicesJson = data as List;
    services = servicesJson.map((service) => Service.fromJson(service)).toList();
  }
}

class Service {
  Service(
      {required this.cod,
      required this.nDayBilling,
      required this.price,
      required this.description,
      required this.category,
     
      required this.activeFrom,
      required this.state,
      required this.vat,
      required this.contractId});

  String cod;
  int nDayBilling;
  dynamic price;
  String description;
  String category;
  String activeFrom;
  String state;
  int vat;
  int contractId;
  

  List<Device> devices = [];

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      cod: json['code'],
      nDayBilling: json['billingPeriod'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      activeFrom: json['creationdate'],
      state: json['state'],
      vat: json['vat'],
      contractId: json['contractId'],
    );
  }

  Future<void> fetchDevices() async {
    // Make API call to retrieve devices
    var response = await http.post(
        Uri.parse(
           dotenv.env['API_FETCHDEVICE'].toString()),
        headers: {
          HttpHeaders.authorizationHeader: dotenv.env['API_KEY'].toString(),
        },
        body: {
          "contractId": contractId.toString(),
        });
      
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    print(jsonData['devicesCustomer']);
    for (var device in jsonData['devicesCustomer']) {
      devices.add(Device.fromJson(device));
    }
  }
}

class Device {
  Device(
      {required this.id,
      required this.name,
      required this.contractId,
      required this.asset,
      required this.techasset,
      required this.type,
      required this.vendor,
      required this.state});
  int id;
  String name;
  String asset;
  String techasset;
  int contractId;
  String type;
  String state;
  String vendor;

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'],
      name: json['description'],
      contractId: json['contractId'],
      asset: json['companyasset'],
      techasset: json['techasset'],
      type: json['type'],
      vendor: json['vendor'],
      state: json['state'],

      
    );
  }
}
class ObjData {
  String firmwareVersion;

  ObjData({required this.firmwareVersion});

  factory ObjData.fromJson(Map<String, dynamic> json) {
    return ObjData(
      firmwareVersion: json['firmware_version'],
    
    );
  }
}
class Invoice {
  Invoice({required this.id, required this.description, required this.price});
  int id;
  String description;
  int price;

  List<Invoice> invoiceEntry = [];

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json['id'],
      description: json['description'],
      price: json['price'],
    );
  }
}
