import 'package:lawazem/Auth/Regitration/bloc/RegistrationEvent.dart';
import 'package:lawazem/Auth/Regitration/model/registration_user.dart';
import 'package:lawazem/Services/ApiNetwork.dart';

class RegistrationRepo {
  static Future<RegistrationUser> register(RegistrationEvent event) async {
    var body =
        '{"customer":{"facilities":"small_facilities","job_title":"Developer",'
        '"type_company":"startups","company":"${event.company}","phone":"${event.mobileNumber}",'
        '"commercial_No":"${event.crNumber}","email":"hadeer@gmail.com","first_name":"Hadeer",'
        '"last_name":"Mohamed","username":"hadeer","password":"${event.password}","billing_address":'
        '{"first_name":"John","last_name":"Doe","company":"${event.company}","address_1":"969 Market","address_2"'
        ':"","city":"San Francisco","state":"CA","postcode":"94103","country":"US","email"'
        ':"hadeer@gmail.com","phone":"${event.mobileNumber}"},"shipping_address":{"first_name":"John",'
        '"last_name":"Doe","company":"${event.company}","address_1":"969 Market","address_2":"","city":'
        '"San Francisco","state":"CA","postcode":"94103","country":"US"}}}';
    var response = await ApiNetworkService.networkRequest(
        ApiMethod.POST, "/wc-api/v3/customers",
        body: body);
    try {
      if (response["customer"] != null) {
        return RegistrationUser.fromJson(response);
      }
    } catch (ex) {
      return RegistrationUser();
    }
    return RegistrationUser();
  }
}
