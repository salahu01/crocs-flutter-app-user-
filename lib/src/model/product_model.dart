class ProductModel {
  String? id;
  String? productName;
  String? category;
  String? subCategory;
  String? image;
  String? actualPrice;
  String? currentPrice;
  String? offInPercentage;

  ProductModel(
      {this.id,
      this.productName,
      this.category,
      this.subCategory,
      this.image,
      this.actualPrice,
      this.currentPrice,
      this.offInPercentage});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        productName: json["product"],
        category: json["categary"],
        subCategory: json["subCategary"],
        image: json["image"],
        actualPrice: json["actualPrice"],
        currentPrice: json["currentPrice"],
        offInPercentage: json["offInPercentage"],
      );
}
