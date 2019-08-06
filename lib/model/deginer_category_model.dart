
class DesignerCategoryDataModel {
  List<DesignerCategoryListModel> data;
   DesignerCategoryDataModel(
    {
      this.data,
    }
  );
  DesignerCategoryDataModel.fromJson(Map<String, dynamic> json){
     this.data = new List<DesignerCategoryListModel>();
     if (json["data"] != null) {
       json["data"].forEach((v) {
        data.add(new DesignerCategoryListModel.fromJson(v));
      });
     }
  }
}

class DesignerCategoryListModel{
  int id;
  String name;
  List<DesignerCategoryModel> tags;

   DesignerCategoryListModel(
    {
      this.id,
      this.name,
      this.tags
    }
  );

  DesignerCategoryListModel.fromJson(Map<String, dynamic> json){
    id = json["id"];
    name = json["name"];
    var tagss = json["tags"];
    if (tagss != null){
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
  String name;
  String image;

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