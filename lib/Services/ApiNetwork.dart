import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

enum AppFlavour { staging, prod }
// String loginUrl = "https://170b60cc93.nxcli.net/wp-json/woo-jwt/v1/login?username=mohamedimbabyimbo99@gmail.com&password=mohamedimbaby201";
// String registerUrl = "https://170b60cc93.nxcli.net/wc-api/v3/customers";

class ApiNetworkService {
  static String baseUrl = "";
  static setAppFlavour(AppFlavour appFlavour) {
    switch (appFlavour) {
      case AppFlavour.prod:
        baseUrl = "https://lawazem.com/wp-json/wc/v3/";
        break;
      case AppFlavour.staging:
        baseUrl = "https://170b60cc93.nxcli.net";
        break;
    }
  }

  static String basicAuth = 'Basic ' +
      base64Encode(utf8.encode(
          "ck_f12b27c52c6bd7cc607e9bad85fe6b1ec403ca2a:cs_ca312b6b4d32db5f89914255a56d857c92655909"));
  static var dio = Dio();

  static networkRequest(ApiMethod apiMethod, String service,
      {dynamic parameter, dynamic body}) async {
    final response;
    switch (apiMethod) {
      case ApiMethod.GET:
        response = await applyGetRequest(service, parameter: parameter);
        break;
      case ApiMethod.POST:
        response =
            await applyPostRequest(service, parameter: parameter, body: body);
        break;
      case ApiMethod.DELETE:
        response = await applyDeleteRequest();
        break;
    }
    return response;
  }

  static applyGetRequest(String service, {dynamic parameter}) async {
    if (parameter == null) {
      printRequestDetails(service, parameter);
      var response = await dio.get(baseUrl + service,
          options:
              Options(headers: <String, String>{'authorization': basicAuth}));
      return checkIsValidResponse(response);
    } else {
      printRequestDetails(service, parameter);
      var response = await dio.get(baseUrl + service + parameter,
          options:
              Options(headers: <String, String>{'authorization': basicAuth}));
      return checkIsValidResponse(response);
    }
  }

  static applyPostRequest(String service,
      {dynamic parameter, dynamic body}) async {
    if (parameter == null && body == null) {
      printRequestDetails(service, parameter);
      var response = await dio.post(baseUrl + service,
          options:
              Options(headers: <String, String>{'authorization': basicAuth}));
      return checkIsValidResponse(response);
    } else if (parameter != null && body == null) {
      printRequestDetails(service + parameter, parameter);
      var response = await dio.post(baseUrl + service + parameter,
          options:
              Options(headers: <String, String>{'authorization': basicAuth}));
      return checkIsValidResponse(response);
    } else {
      try {
        printRequestDetails(service + body, body);
        var response = await dio.post(baseUrl + service,
            data: body,
            options:
                Options(headers: <String, String>{'authorization': basicAuth}));
        return checkIsValidResponse(response);
      } catch (ex) {
        return "An undefined error happened";
      }
    }
  }

  static applyDeleteRequest() {}

  static checkIsValidResponse(Response<dynamic> response) {
    printResponseDetails(response);
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        return response.statusMessage;
      case 401:
        throw Exception("Un Authorized Response");
      case 404:
        throw Exception("Not Found");
    }
  }

  static void printRequestDetails(String services, dynamic parameter) {
    debugPrint("Api End Point ");
    debugPrint(baseUrl + services);
    if (parameter != null) debugPrint("Parameter : " + parameter.toString());
  }

  static void printResponseDetails(Response<dynamic> response) {
    debugPrint("Api Response ");
    debugPrint(response.toString());
  }
}

enum ApiMethod { GET, POST, DELETE }
