import 'package:flutter/material.dart';

typedef void DesignerSegmentOnTap(int index);
class DesignerSegment extends StatefulWidget {
  final DesignerSegmentOnTap onTap;
  DesignerSegment({Key key, this.onTap}) : super(key: key);

  _DesignerSegmentState createState() => _DesignerSegmentState(this.onTap);
}
class _DesignerSegmentState extends State<DesignerSegment> {
  var selectedIndex = 0;
  DesignerSegmentOnTap _onTap; 
  _DesignerSegmentState(this._onTap);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10,bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _button("行业",0),
          SizedBox(width: 70),
          _button("风格",1),
        ],
      ),
    );
  }

  Widget _button(String title, int index) {
    return InkWell(
      onTap: (){
        setState(() {
           selectedIndex = index;
        });
        if (this._onTap != null) {
          this._onTap(index);
        }
      },
      child: Container(

        padding: EdgeInsets.only(bottom: 2 ),
        child: Text(
          title,
          style: TextStyle(
            color: index == selectedIndex?Color.fromARGB(255, 216, 182, 76): Colors.black,
            ),
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 2, color: index == selectedIndex?Color.fromARGB(255, 216, 182, 76): Colors.white )
          ),
        ),
      ),
    );
  }
}
