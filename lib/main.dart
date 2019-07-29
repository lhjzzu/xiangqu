import 'package:flutter/material.dart';
import './pages/index_page.dart';
import './provide/index_provide.dart';
import 'package:provide/provide.dart';


void main() {

  var providers = Providers();

  providers
  ..provide(Provider.function((context) => IndexProvide()));
 runApp(ProviderNode(
   providers: providers,
   child: MyApp(),
 ));
}
// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '想去',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor:Colors.white
      ),
      home: IndexPath(),
    );
  }
}

