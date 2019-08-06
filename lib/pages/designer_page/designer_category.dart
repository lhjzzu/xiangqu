
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../provide/designer_provider.dart';
import '../../model/deginer_category_model.dart';

class DesignerCategory extends StatelessWidget {
  const DesignerCategory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    var selectedIndex = Provide.value<DesignerProvide>(context).selectedIndex;
    var _items = Provide.value<DesignerProvide>(context).categoryDataModel.data[selectedIndex].tags;
    return Container(
      height: (_items.length%2 == 0 ?_items.length/2: _items.length/2+1)*(ScreenUtil().setWidth(375)-2)/2.0,
       child: GridView.builder(
         padding: EdgeInsets.all(0),
         physics: NeverScrollableScrollPhysics(),
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 1/1,
         ),
         itemCount: _items.length,
         itemBuilder: (BuildContext context, int index){
           var model = _items[index];
           return _gridViewItem(model);
         },
       ),
    );
  }

    Widget _gridViewItem(DesignerCategoryModel model) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          _backgroundImage(model.image),
          _mask(),
          _title(model.name)
        ],
      )
    );
  }

  Widget _backgroundImage(String imageUrl) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 0,
      child: Image.network(imageUrl != null ? imageUrl:""),
    );
  }

  Widget _mask() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 0,
      child: Container(
        color: Color.fromARGB(100, 0, 0, 0),
      ),
    );
  }

   Widget _title(String title) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 0,
      child: Center(
        child: Text(
          title != null ? title:"",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15
          ),
        ),
      )
    );
  }
} 
