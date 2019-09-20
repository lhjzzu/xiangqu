import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:xiangqu/model/deginer_category_model.dart';
import 'package:xiangqu/network/network.dart';
import 'package:xiangqu/pages/designer_page/designer_category.dart';
import 'package:xiangqu/utils/common_util.dart';
import '../model/recommend_designer_model.dart';
import '../provide/designer_provider.dart';
import '../pages/designer_page/designer_header.dart';
import '../pages/designer_page/designer_segment.dart';
class DesignerPage extends StatelessWidget {
  const DesignerPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: FutureBuilder(
      future: getdata(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Provide<DesignerProvide>(builder: (context, child, provide) {
            String tagstr = "";
            String imageUrl;
            String shopName;
            String userNick;
            String opTag;
            if (provide.recommendModel != null) {
              provide.recommendModel.tags.forEach((model) {
                tagstr += model.name + " ";
              });
              imageUrl = provide.recommendModel.banner;
              shopName = provide.recommendModel.shopName;
              userNick = provide.recommendModel.userNick;
              opTag = provide.recommendModel.opTag;
            }  
            else {
              imageUrl = "https://www.itying.com/images/flutter/3.png";
              shopName = "这是木木的小店铺";
              userNick = "小木木";
              opTag = "TAG";
              tagstr = "新鲜 美味 有趣";
            }
            return Container(
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  DesignerHeader(
                    imageUrl: imageUrl,
                    shopName: shopName,
                    userNick: userNick,
                    opTag: opTag,
                    tagstr: tagstr,
                  ),
                  DesignerSegment(
                    onTap: (index){
                      print("index = $index");
                      provide.setSelectedIndex(index);
                    },
                  ),

                  DesignerCategory(),
                ],
              ),
            );
          });
        } else {
          return Center(
            child: Text('加载中....'),
          );
        }
      },
    ));
  }

  Future getdata(BuildContext context) async {
    var result = await Network.recommendDesigner();
    if (result["data"] != null) {
      var model = RecommendDesignerModel.fromJson(result["data"]);
      Provide.value<DesignerProvide>(context).setRecommendModel(model);
    }
    var result2 = await Network.designerCategory();
    if (result2["data"] != null) {
      var model = DesignerCategoryDataModel.fromJson(result2);
      Provide.value<DesignerProvide>(context).setCategoryDataModel(model);
    }
    return "end";
  }
}
