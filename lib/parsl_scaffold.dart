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
  }) : super(body: body);

  final FloatingButtonType floatingButtonType;
  final Function(dynamic) floatingButtonHandler;

  final ParslBottomBarAction leftNavigationAction;
  final ParslBottomBarAction rightNavigationAction;

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
        rightBottomBarAction: rightNavigationAction,
      );
}
