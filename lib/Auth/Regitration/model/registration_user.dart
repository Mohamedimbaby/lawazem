/// customer : {"id":95,"created_at":"2022-03-16T16:37:08Z","last_update":"2022-03-16T16:37:08Z","email":"hadeer.didi@gmail.com","first_name":"Hadeer","last_name":"Mohamed","username":"DIiiDI","role":"small_facilities","last_order_id":null,"last_order_date":null,"orders_count":0,"total_spent":"0.00","avatar_url":"https://secure.gravatar.com/avatar/eddea44691f29075b9888185fd68b416?s=96&d=mm&r=g","billing_address":{"first_name":"John","last_name":"Doe","company":"","address_1":"969 Market","address_2":"","city":"San Francisco","state":"CA","postcode":"94103","country":"US","email":"hadeer.didi@gmail.com","phone":"(555) 555-5555"},"shipping_address":{"first_name":"John","last_name":"Doe","company":"","address_1":"969 Market","address_2":"","city":"San Francisco","state":"CA","postcode":"94103","country":"US"}}

class RegistrationUser {
  RegistrationUser({
      Customer? customer,}){
    _customer = customer;
}

  RegistrationUser.fromJson(dynamic json) {
    _customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
  }
  Customer? _customer;

  Customer? get customer => _customer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_customer != null) {
      map['customer'] = _customer?.toJson();
    }
    return map;
  }

}

/// id : 95
/// created_at : "2022-03-16T16:37:08Z"
/// last_update : "2022-03-16T16:37:08Z"
/// email : "hadeer.didi@gmail.com"
/// first_name : "Hadeer"
/// last_name : "Mohamed"
/// username : "DIiiDI"
/// role : "small_facilities"
/// last_order_id : null
/// last_order_date : null
/// orders_count : 0
/// total_spent : "0.00"
/// avatar_url : "https://secure.gravatar.com/avatar/eddea44691f29075b9888185fd68b416?s=96&d=mm&r=g"
/// billing_address : {"first_name":"John","last_name":"Doe","company":"","address_1":"969 Market","address_2":"","city":"San Francisco","state":"CA","postcode":"94103","country":"US","email":"hadeer.didi@gmail.com","phone":"(555) 555-5555"}
/// shipping_address : {"first_name":"John","last_name":"Doe","company":"","address_1":"969 Market","address_2":"","city":"San Francisco","state":"CA","postcode":"94103","country":"US"}

class Customer {
  Customer({
      int? id, 
      String? createdAt, 
      String? lastUpdate, 
      String? email, 
      String? firstName, 
      String? lastName, 
      String? username, 
      String? role, 
      dynamic lastOrderId, 
      dynamic lastOrderDate, 
      int? ordersCount, 
      String? totalSpent, 
      String? avatarUrl, 
      Billing_address? billingAddress, 
      Shipping_address? shippingAddress,}){
    _id = id;
    _createdAt = createdAt;
    _lastUpdate = lastUpdate;
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _username = username;
    _role = role;
    _lastOrderId = lastOrderId;
    _lastOrderDate = lastOrderDate;
    _ordersCount = ordersCount;
    _totalSpent = totalSpent;
    _avatarUrl = avatarUrl;
    _billingAddress = billingAddress;
    _shippingAddress = shippingAddress;
}

  Customer.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['created_at'];
    _lastUpdate = json['last_update'];
    _email = json['email'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _username = json['username'];
    _role = json['role'];
    _lastOrderId = json['last_order_id'];
    _lastOrderDate = json['last_order_date'];
    _ordersCount = json['orders_count'];
    _totalSpent = json['total_spent'];
    _avatarUrl = json['avatar_url'];
    _billingAddress = json['billing_address'] != null ? Billing_address.fromJson(json['billingAddress']) : null;
    _shippingAddress = json['shipping_address'] != null ? Shipping_address.fromJson(json['shippingAddress']) : null;
  }
  int? _id;
  String? _createdAt;
  String? _lastUpdate;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _username;
  String? _role;
  dynamic _lastOrderId;
  dynamic _lastOrderDate;
  int? _ordersCount;
  String? _totalSpent;
  String? _avatarUrl;
  Billing_address? _billingAddress;
  Shipping_address? _shippingAddress;

  int? get id => _id;
  String? get createdAt => _createdAt;
  String? get lastUpdate => _lastUpdate;
  String? get email => _email;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get username => _username;
  String? get role => _role;
  dynamic get lastOrderId => _lastOrderId;
  dynamic get lastOrderDate => _lastOrderDate;
  int? get ordersCount => _ordersCount;
  String? get totalSpent => _totalSpent;
  String? get avatarUrl => _avatarUrl;
  Billing_address? get billingAddress => _billingAddress;
  Shipping_address? get shippingAddress => _shippingAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created_at'] = _createdAt;
    map['last_update'] = _lastUpdate;
    map['email'] = _email;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['username'] = _username;
    map['role'] = _role;
    map['last_order_id'] = _lastOrderId;
    map['last_order_date'] = _lastOrderDate;
    map['orders_count'] = _ordersCount;
    map['total_spent'] = _totalSpent;
    map['avatar_url'] = _avatarUrl;
    if (_billingAddress != null) {
      map['billing_address'] = _billingAddress?.toJson();
    }
    if (_shippingAddress != null) {
      map['shipping_address'] = _shippingAddress?.toJson();
    }
    return map;
  }

}

/// first_name : "John"
/// last_name : "Doe"
/// company : ""
/// address_1 : "969 Market"
/// address_2 : ""
/// city : "San Francisco"
/// state : "CA"
/// postcode : "94103"
/// country : "US"

class Shipping_address {
  Shipping_address({
      String? firstName, 
      String? lastName, 
      String? company, 
      String? address1, 
      String? address2, 
      String? city, 
      String? state, 
      String? postcode, 
      String? country,}){
    _firstName = firstName;
    _lastName = lastName;
    _company = company;
    _address1 = address1;
    _address2 = address2;
    _city = city;
    _state = state;
    _postcode = postcode;
    _country = country;
}

  Shipping_address.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _company = json['company'];
    _address1 = json['address_1'];
    _address2 = json['address_2'];
    _city = json['city'];
    _state = json['state'];
    _postcode = json['postcode'];
    _country = json['country'];
  }
  String? _firstName;
  String? _lastName;
  String? _company;
  String? _address1;
  String? _address2;
  String? _city;
  String? _state;
  String? _postcode;
  String? _country;

  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get company => _company;
  String? get address1 => _address1;
  String? get address2 => _address2;
  String? get city => _city;
  String? get state => _state;
  String? get postcode => _postcode;
  String? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['company'] = _company;
    map['address_1'] = _address1;
    map['address_2'] = _address2;
    map['city'] = _city;
    map['state'] = _state;
    map['postcode'] = _postcode;
    map['country'] = _country;
    return map;
  }

}

/// first_name : "John"
/// last_name : "Doe"
/// company : ""
/// address_1 : "969 Market"
/// address_2 : ""
/// city : "San Francisco"
/// state : "CA"
/// postcode : "94103"
/// country : "US"
/// email : "hadeer.didi@gmail.com"
/// phone : "(555) 555-5555"

class Billing_address {
  Billing_address({
      String? firstName, 
      String? lastName, 
      String? company, 
      String? address1, 
      String? address2, 
      String? city, 
      String? state, 
      String? postcode, 
      String? country, 
      String? email, 
      String? phone,}){
    _firstName = firstName;
    _lastName = lastName;
    _company = company;
    _address1 = address1;
    _address2 = address2;
    _city = city;
    _state = state;
    _postcode = postcode;
    _country = country;
    _email = email;
    _phone = phone;
}

  Billing_address.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _company = json['company'];
    _address1 = json['address_1'];
    _address2 = json['address_2'];
    _city = json['city'];
    _state = json['state'];
    _postcode = json['postcode'];
    _country = json['country'];
    _email = json['email'];
    _phone = json['phone'];
  }
  String? _firstName;
  String? _lastName;
  String? _company;
  String? _address1;
  String? _address2;
  String? _city;
  String? _state;
  String? _postcode;
  String? _country;
  String? _email;
  String? _phone;

  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get company => _company;
  String? get address1 => _address1;
  String? get address2 => _address2;
  String? get city => _city;
  String? get state => _state;
  String? get postcode => _postcode;
  String? get country => _country;
  String? get email => _email;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['company'] = _company;
    map['address_1'] = _address1;
    map['address_2'] = _address2;
    map['city'] = _city;
    map['state'] = _state;
    map['postcode'] = _postcode;
    map['country'] = _country;
    map['email'] = _email;
    map['phone'] = _phone;
    return map;
  }

}