import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_test/main.dart';

part 'bottom_bar_actions.dart';
part 'parsl_bottom_navigation_bar.dart';
part 'floating_button_types.dart';

class ParslScaffold extends Scaffold {
  ParslScaffold({
    Widget body,
    this.floatingButtonType,
    this.floatingButtonHandler,
    this.leftNavigationAction,
    this.rightNavigationAction,
    this.showBackButton = false,
    this.title = '',
  }) : super(body: body);

  final FloatingButtonType floatingButtonType;
  final Function(dynamic) floatingButtonHandler;

  final ParslBottomBarAction leftNavigationAction;
  final ParslBottomBarAction rightNavigationAction;
  final bool showBackButton;
  final String title;

  @override
  bool get extendBody => true;

  @override
  Widget get floatingActionButton => FloatingActionButton(
        backgroundColor: Color(0xff7bb62d),
        child: floatingButtonType.buttonIcon,
        elevation: 0,
        onPressed: () async {
          floatingButtonHandler == null
              ? await floatingButtonType.floatingButtonAction()
              : floatingButtonHandler(
                  await floatingButtonType.floatingButtonAction());
        },
      );
  @override
  FloatingActionButtonLocation get floatingActionButtonLocation =>
      FloatingActionButtonLocation.centerDocked;

  @override
  Widget get bottomNavigationBar => ParslBottomNavigationBar(
        leftBottomBarAction: leftNavigationAction,
        rightBottomBarAction: rightNavigationAction,
      );

  @override
  PreferredSizeWidget get appBar => AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xfff6f5f5),
        shadowColor: Colors.black.withOpacity(0.04),
        leading: showBackButton
            ? InkWell(
                borderRadius: BorderRadius.circular(40),
                onTap: () => Get.back(),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
              )
            : Container(),
      );
}
