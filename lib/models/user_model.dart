class UserModel {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      id: jsonData['id'],
      name: jsonData['name'] ?? '',
      username: jsonData['username'] ?? '',
      email: jsonData['email'] ?? '',
      address: Address.fromJson(jsonData['address']),
      phone: jsonData['phone'] ?? '',
      website: jsonData['website'] ?? '',
      company: Company.fromJson(jsonData['company'])
    );
  }
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo
  });

  factory Address.fromJson(Map<String, dynamic> jsonData) {
    return Address(
        street: jsonData['street'] ?? '0',
        suite: jsonData['suite'] ?? '',
        city: jsonData['city'] ?? '0',
        zipcode: jsonData['zipcode'] ?? '0',
        geo: Geo.fromJson(jsonData['geo'])
    );
  }
}

class Geo {
  String lat;
  String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> jsonData) {
    return Geo(
      lat: jsonData['lat'] ?? '',
      lng: jsonData['lng'] ?? '',
    );
  }
}

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs
  });

  factory Company.fromJson(Map<String, dynamic> jsonData) {
    return Company(
      name: jsonData['name'] ?? '',
      catchPhrase: jsonData['catchPhrase'] ?? '',
        bs: jsonData['bs'] ?? ''
    );
  }
}