import 'dart:developer';
import 'dart:io';

import 'package:crocs/src/model/category_model.dart';
import 'package:crocs/src/model/product_model.dart';
import 'package:dio/dio.dart';

import '../api_credentials/api.dart';

class DataServices extends Api {
  fetchingCategory() async {
    try {
      final response = await Dio().get('$uri/category');
      if (response.statusCode == 200) {
        final List<CategoryModel> res = categoryListFromJson(response.data);
        return res;
      }
      log(response.statusCode.toString());
    } on SocketException {
      return 'network error';
    } on DioError {
      return 'error';
    }
  }

  fetchingProduct({required String id}) async {
    try {
      final response = await Dio().get('$uri/products/$id');
      if (response.statusCode == 200) {
        final ProductModel res = ProductModel.fromJson(response.data);
        return res;
      }
      log(response.statusCode.toString());
    } on SocketException {
      return 'network error';
    } on DioError {
      return 'error';
    }
  }
}
