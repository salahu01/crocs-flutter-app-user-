import 'dart:developer';

import 'package:crocs/model/category_model.dart';
import 'package:crocs/model/product_model.dart';
import 'package:crocs/services/api/api.dart';
import 'package:dio/dio.dart';

class DataServices extends Api {
  fetchingCategory() async {
    try {
      final response = await Dio().get('$uriLinux/category');
      if (response.statusCode == 200) {
        final List<CategoryModel> res = categoryListFromJson(response.data);
        return res;
      }
      log(response.statusCode.toString());
    } catch (e) {
      log('exeption : $e');
      return 'e';
    }
  }

  fetchingProduct({required String id}) async {
    try {
      final response = await Dio().get('$uriLinux/products/$id');
      if (response.statusCode == 200) {
        final ProductModel res = ProductModel.fromJson(response.data);
        return res;
      }
      log(response.statusCode.toString());
    } catch (e) {
      log('exeption : $e');
    }
  }

}
