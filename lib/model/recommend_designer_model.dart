// import './deginer_category_model.dart';
class RecommendDesignerModel {

  String banner;
  int fansNum;
  int id;
  String intro;
  bool isFollow;
  String opTag;
  int productNum;
  String shopId;
  String shopName;
  String userAvatar;
  int userId;
  String userNick;
  List<DesignerCategoryModel> tags;

  RecommendDesignerModel(
    {
      this.banner,
      this.fansNum,
      this.id,
      this.intro,
      this.isFollow,
      this.opTag,
      this.productNum,
      this.shopId,
      this.shopName,
      this.userAvatar,
      this.userId,
      this.userNick,
      this.tags,
    }
  );

  RecommendDesignerModel.fromJson(Map<String, dynamic> json){
    banner = json["banner"];
    fansNum = json["fansNum"];
    id = json["id"];
    intro = json["intro"];
    isFollow = json["isFollow"];
    opTag = json["opTag"];
    productNum = json["productNum"];
    shopId = json["shopId"];
    shopName = json["shopName"];
    userAvatar = json["userAvatar"];
    userId = json["userId"];
    userNick = json["userNick"];
    var tagss = json["tags"];
    if (tagss != null) {
      this.tags = new List<DesignerCategoryModel>();
      tagss.forEach((v) {
        tags.add(new DesignerCategoryModel.fromJson(v));
      });
    }
  }
}

class DesignerCategoryModel {
  int categoryId;
  int id;
  String image;
  String name;

  DesignerCategoryModel(
    {
      this.categoryId,
      this.id,
      this.image,
      this.name,
    }
  );

  DesignerCategoryModel.fromJson(Map<String, dynamic> json){
    categoryId = json["categoryId"];
    id = json["id"];
    image = json["image"];
    name = json["name"];
  }
}