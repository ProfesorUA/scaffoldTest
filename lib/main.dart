import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_test/parsl_scaffold.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ParslScaffold(
      title: title,
      floatingButtonType: FloatingButtonType.scanTag,
      floatingButtonHandler: (result) {
        print(result);
      },
      leftNavigationAction: ParslBottomBarAction.help,
      rightNavigationAction: ParslBottomBarAction.actions,
      body: Center(
        child: Text('Home page with custom scaffold'),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("2nd"),
        ),
        backgroundColor: Color(0xffF6F5F5),
        body: Center(
          child: Text('Help with default scaffold'),
        ));
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ParslScaffold(
        title: 'Actions',
        showBackButton: true,
        body: Center(
          child: Text('Actions with custom scaffold'),
        ));
  }
}
