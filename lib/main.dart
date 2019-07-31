import 'package:flutter/material.dart';
import './pages/index_page.dart';
import './provide/index_provide.dart';
import './provide/swiper_index_provide.dart';
import './provide/home_provide.dart';
import 'package:provide/provide.dart';
import './routers/application.dart';
import './routers/route_handlers.dart';
import './routers/routes.dart';
import 'package:fluro/fluro.dart';

void main() {
  final providers = Providers();
  providers
    ..provide(Provider.function((context) => IndexProvide()))
    ..provide(Provider.function((context) => HomeProvide()))
    ..provide(Provider.function((context) => SwiperIndexProvide()));

  runApp(ProviderNode(
    providers: providers,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    return MaterialApp(
      title: '想去',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.white),
      home: IndexPath(),
    );
  }
}
