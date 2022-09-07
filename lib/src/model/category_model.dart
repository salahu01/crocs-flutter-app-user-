List<CategoryModel> categoryListFromJson(List<dynamic> json) =>
    List<CategoryModel>.from(json.map((x) => CategoryModel.fromJson(x)));

class CategoryModel {
  String? categaryName;
  String? categoryId;
  List? productIds;

  CategoryModel({
    this.categaryName,
    this.categoryId,
    this.productIds,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categaryName: json["categary"],
        productIds: json["productid"],
        categoryId: json["_id"],
      );
}
