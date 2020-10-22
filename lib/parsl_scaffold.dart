import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_test/main.dart';
import 'package:getx_app_test/parsl_bottom_navigation_bar.dart';

enum ParslBottomBarAction { exit, help, actions }

extension ParslBottomBarActionInfo on ParslBottomBarAction {
  Icon get buttonIcon {
    IconData iconData;
    switch (this) {
      case ParslBottomBarAction.exit:
        iconData = Icons.close_sharp;
        break;
      case ParslBottomBarAction.help:
        iconData = Icons.help_outline_rounded;
        break;
      case ParslBottomBarAction.actions:
        iconData = Icons.local_attraction_sharp;
        break;
      default:
        iconData = Icons.error;
    }

    return Icon(
      iconData,
      color: Color(0xff808084),
    );
  }

  String get buttonTitle {
    switch (this) {
      case ParslBottomBarAction.exit:
        return "Exit";
      case ParslBottomBarAction.help:
        return "Help";
      case ParslBottomBarAction.actions:
        return "Actions";
      default:
        return "Not implemented";
    }
  }

  Future<dynamic> buttonAction() async {
    switch (this) {
      case ParslBottomBarAction.exit:
        return Icon(Icons.close_sharp);
      case ParslBottomBarAction.help:
        Get.to(SecondScreen());
        return null;
      case ParslBottomBarAction.actions:
        return Icon(Icons.local_attraction_sharp);
      default:
        return Icon(Icons.error);
    }
  }
}

enum FloatingButtonType { scanTag, scanPackage }

extension FloatingButtonInfo on FloatingButtonType {
  Icon get buttonIcon {
    switch (this) {
      case FloatingButtonType.scanTag:
        return Icon(Icons.qr_code_scanner);
      case FloatingButtonType.scanPackage:
        return Icon(Icons.settings_overscan);
      default:
        return Icon(Icons.error);
    }
  }

  Future<dynamic> floatingButtonAction() async {
    switch (this) {
      case FloatingButtonType.scanTag:
        return await Future.delayed(Duration(seconds: 2), () {
          return "vjwvqavz";
        });
      case FloatingButtonType.scanPackage:
        return await Future.delayed(Duration(seconds: 2), () {
          return 123;
        });
      default:
        return null;
    }
  }
}

class ParslScaffold extends Scaffold {
  ParslScaffold({
    Widget body,
    this.floatingButtonType,
    this.floatingButtonHandler,
    this.leftNavigationAction,
  }) : super(body: body);

  FloatingButtonType floatingButtonType;
  Function(dynamic) floatingButtonHandler;

  ParslBottomBarAction leftNavigationAction;

  @override
  bool get extendBody => true;

  @override
  Widget get floatingActionButton => FloatingActionButton(
        child: floatingButtonType.buttonIcon,
        elevation: 0,
        onPressed: () async {
          floatingButtonHandler(
              await floatingButtonType.floatingButtonAction());
        },
      );
  @override
  FloatingActionButtonLocation get floatingActionButtonLocation =>
      FloatingActionButtonLocation.centerDocked;

  @override
  Widget get bottomNavigationBar => ParslBottomNavigationBar(
        leftBottomBarAction: leftNavigationAction,
      );
}
