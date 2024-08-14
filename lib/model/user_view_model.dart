// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserViewModel {
  int? id;
  String? name;
  String? username;
  String? email;
  UserAddressModel? address;
  String? phone;
  String? website;
  UserCompanyModel? company;
  UserViewModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  UserViewModel copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    UserAddressModel? address,
    String? phone,
    String? website,
    UserCompanyModel? company,
  }) {
    return UserViewModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      company: company ?? this.company,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address?.toMap(),
      'phone': phone,
      'website': website,
      'company': company?.toMap(),
    };
  }

  factory UserViewModel.fromMap(Map<String, dynamic> map) {
    return UserViewModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      address: map['address'] != null
          ? UserAddressModel.fromMap(map['address'] as Map<String, dynamic>)
          : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      website: map['website'] != null ? map['website'] as String : null,
      company: map['company'] != null
          ? UserCompanyModel.fromMap(map['company'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserViewModel.fromJson(String source) =>
      UserViewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserViewModel(id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company)';
  }

  @override
  bool operator ==(covariant UserViewModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.username == username &&
        other.email == email &&
        other.address == address &&
        other.phone == phone &&
        other.website == website &&
        other.company == company;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        username.hashCode ^
        email.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        website.hashCode ^
        company.hashCode;
  }
}

class UserAddressModel {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  GeoModel? geo;
  UserAddressModel({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  UserAddressModel copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    GeoModel? geo,
  }) {
    return UserAddressModel(
      street: street ?? this.street,
      suite: suite ?? this.suite,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
      geo: geo ?? this.geo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo?.toMap(),
    };
  }

  factory UserAddressModel.fromMap(Map<String, dynamic> map) {
    return UserAddressModel(
      street: map['street'] != null ? map['street'] as String : null,
      suite: map['suite'] != null ? map['suite'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      zipcode: map['zipcode'] != null ? map['zipcode'] as String : null,
      geo: map['geo'] != null
          ? GeoModel.fromMap(map['geo'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAddressModel.fromJson(String source) =>
      UserAddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserAddressModel(street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo)';
  }

  @override
  bool operator ==(covariant UserAddressModel other) {
    if (identical(this, other)) return true;

    return other.street == street &&
        other.suite == suite &&
        other.city == city &&
        other.zipcode == zipcode &&
        other.geo == geo;
  }

  @override
  int get hashCode {
    return street.hashCode ^
        suite.hashCode ^
        city.hashCode ^
        zipcode.hashCode ^
        geo.hashCode;
  }
}

class UserCompanyModel {
  String? name;
  String? catchPhrase;
  String? bs;
  UserCompanyModel({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  UserCompanyModel copyWith({
    String? name,
    String? catchPhrase,
    String? bs,
  }) {
    return UserCompanyModel(
      name: name ?? this.name,
      catchPhrase: catchPhrase ?? this.catchPhrase,
      bs: bs ?? this.bs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }

  factory UserCompanyModel.fromMap(Map<String, dynamic> map) {
    return UserCompanyModel(
      name: map['name'] != null ? map['name'] as String : null,
      catchPhrase:
          map['catchPhrase'] != null ? map['catchPhrase'] as String : null,
      bs: map['bs'] != null ? map['bs'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserCompanyModel.fromJson(String source) =>
      UserCompanyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserCompanyModel(name: $name, catchPhrase: $catchPhrase, bs: $bs)';

  @override
  bool operator ==(covariant UserCompanyModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.catchPhrase == catchPhrase &&
        other.bs == bs;
  }

  @override
  int get hashCode => name.hashCode ^ catchPhrase.hashCode ^ bs.hashCode;
}

class GeoModel {
  String? lat;
  String? lng;
  GeoModel({
    this.lat,
    this.lng,
  });

  GeoModel copyWith({
    String? lat,
    String? lng,
  }) {
    return GeoModel(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lng': lng,
    };
  }

  factory GeoModel.fromMap(Map<String, dynamic> map) {
    return GeoModel(
      lat: map['lat'] != null ? map['lat'] as String : null,
      lng: map['lng'] != null ? map['lng'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeoModel.fromJson(String source) =>
      GeoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GeoModel(lat: $lat, lng: $lng)';

  @override
  bool operator ==(covariant GeoModel other) {
    if (identical(this, other)) return true;

    return other.lat == lat && other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}
