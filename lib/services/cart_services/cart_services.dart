import 'dart:convert';
import 'dart:developer';

import 'package:crocs/services/api/api.dart';
import 'package:dio/dio.dart';

class CartServices extends Api {
  fetchingCart() async {
    try {
      //user data don't forget
      const userId = "62fa98b43a6dd631f329240b";
      final response = await Dio().get('$uriAndroid/cart/$userId',
          options: Options(headers: {
            "Authorization":
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjYyZjA0N2FjMGFiOTRhM2YwNWE4YjMyNiIsIm5hbWUiOiJzYWxhaHUiLCJlbWFpbCI6ImN2c2FsYWh1MTJAZ21haWwuY29tIiwicGFzc3dvcmQiOiIkMmIkMTAkQVVGang3RGY3N0FnN1ZxOWQ2emxLZTVsOEhtbFZKWkJlQnNjTHVtSzRVOEw3TjFSbFgzQUsiLCJfX3YiOjB9LCJpYXQiOjE2NTk5MjM0NDZ9.NK9Gyn8SueB3Qwcm6StL3Bf9HrzygJvE_cwoSLqVG5g"
          }));
      log(response.statusCode.toString());
      log(response.data.toString());
    } catch (e) {
      log('exeption : $e');
    }
  }

  addToCart() async {
    try {
      //user data don't forget
      const userId = "62fa98b43a6dd631f329240b";
      final data = jsonEncode(
          {"productId": "62fa98b43a6dd631f329240b", "productQuantity": "3"});
      final response = await Dio().post('$uriAndroid/cart/$userId', data: data,options: Options(headers:  {
            "Authorization":
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjYyZjA0N2FjMGFiOTRhM2YwNWE4YjMyNiIsIm5hbWUiOiJzYWxhaHUiLCJlbWFpbCI6ImN2c2FsYWh1MTJAZ21haWwuY29tIiwicGFzc3dvcmQiOiIkMmIkMTAkQVVGang3RGY3N0FnN1ZxOWQ2emxLZTVsOEhtbFZKWkJlQnNjTHVtSzRVOEw3TjFSbFgzQUsiLCJfX3YiOjB9LCJpYXQiOjE2NTk5MjM0NDZ9.NK9Gyn8SueB3Qwcm6StL3Bf9HrzygJvE_cwoSLqVG5g"
          }));
      log(response.statusCode.toString());
      log(response.data.toString());
    } catch (e) {
      log('exeption : $e');
    }
  }
}
