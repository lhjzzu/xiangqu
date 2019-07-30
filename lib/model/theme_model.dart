class ThemeListModel {
  List<ThemeModel> data;
  ThemeListModel({this.data});

  ThemeListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<ThemeModel>();
      json['data'].forEach((v) {
        data.add(new ThemeModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ThemeModel {
  bool flag;
  int id;
  String image;
  String imageMin;
  String imageType;
  String keyword;
  String name;
  int tagid;
  int type;
  String url;

  ThemeModel(
      {this.flag,
      this.id,
      this.image,
      this.imageMin,
      this.imageType,
      this.keyword,
      this.name,
      this.tagid,
      this.type,
      this.url});

  ThemeModel.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    id = json['id'];
    image = json['image'];
    imageMin = json['imageMin'];
    imageType = json['imageType'];
    keyword = json['keyword'];
    name = json['name'];
    tagid = json['tagid'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flag'] = this.flag;
    data['id'] = this.id;
    data['image'] = this.image;
    data['imageMin'] = this.imageMin;
    data['imageType'] = this.imageType;
    data['keyword'] = this.keyword;
    data['name'] = this.name;
    data['tagid'] = this.tagid;
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}