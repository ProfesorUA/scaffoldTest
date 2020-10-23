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
  final CounterState counterState = Get.put(CounterState());

  @override
  Widget build(BuildContext context) {
    return ParslScaffold(
      floatingButtonType: FloatingButtonType.scanTag,
      floatingButtonHandler: (result) {
        print(result);
      },
      leftNavigationAction: ParslBottomBarAction.help,
      rightNavigationAction: ParslBottomBarAction.actions,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Container(
                width: 200,
                height: 50,
                child: Center(child: Text('Go to next screen')),
              ),
              onTap: () {
                Get.to(SecondScreen());
              },
            ),
            InkWell(
              child: Container(
                width: 200,
                height: 50,
                child: Center(child: Text('Show snackbar')),
              ),
              onTap: () {
                Get.snackbar(null, null,
                    backgroundColor: Color(0xff6492a3),
                    messageText: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.white,
                          ),
                          SizedBox(width: 20),
                          Text(
                            'Action completed successfully',
                            style: TextStyle(color: Colors.white),
                          )
                        ]),
                    borderRadius: 60,
                    margin: EdgeInsets.only(top: 60, left: 20, right: 20));
              },
            ),
            Container(
              height: 600,
            ),
            InkWell(
              child: Container(
                width: 200,
                height: 50,
                child: Center(child: Text('Show dialog')),
              ),
              onTap: () {
                Get.defaultDialog(
                    title: "Alert", content: Text('This is a dialog'));
              },
            ),
            InkWell(
              child: Container(
                width: 200,
                height: 50,
                child: Center(child: Text('Show bottom sheet')),
              ),
              onTap: () {
                Get.bottomSheet(
                    Container(
                      child: Wrap(
                        children: [
                          ListTile(
                            title: Text('Music'),
                          ),
                          ListTile(
                            title: Text('Video'),
                          ),
                          SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                    backgroundColor: Colors.white);
              },
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Obx(() => Text(
                  '${counterState.counter}',
                  style: Theme.of(context).textTheme.headline4,
                )),
            Material(
              child: InkWell(
                child: Ink(
                  height: 100,
                  color: Colors.green,
                ),
                onTap: () {
                  print('asd');
                },
              ),
            ),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation
      //     .centerDocked, // his trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CounterState extends GetxController {
  RxInt counter = 0.obs;

  void increment() => counter += 1;
}

class SecondScreen extends StatelessWidget {
  final SecondController controller = Get.put(SecondController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("2nd"),
      ),
      backgroundColor: Color(0xffF6F5F5),
      body: ListView(children: [
        FlatButton(
            onPressed: () {
              Get.off(ThirdScreen());
            },
            child: Text("go to third and remove from stack")),
        FlatButton(
            onPressed: () {
              Get.offAll(ThirdScreen());
            },
            child: Text("go to third and remove everything")),
        FlatButton(
            onPressed: () async {
              controller.setResult(await Get.to(FourthScreen()));
            },
            child: Text("return data from the fourth screen")),
        Obx(() => Text(controller.result.string)),
      ]),
    );
  }
}

class SecondController extends GetxController {
  var result = 'yoben'.obs;

  void setResult(String value) {
    result.value = value;
    print(result);
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("3rd"),
      ),
      body: ListView(children: [
        FlatButton(
            onPressed: () {
              Get.offAll(MyHomePage(title: 'title'));
            },
            child: Text("go to home")),
      ]),
    );
  }
}

class FourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("4th"),
      ),
      body: ListView(children: [
        FlatButton(
            onPressed: () => Get.back(result: "hello"),
            child: Text("return hello")),
        FlatButton(
            onPressed: () => Get.back(result: "world"),
            child: Text("return world")),
      ]),
    );
  }
}
