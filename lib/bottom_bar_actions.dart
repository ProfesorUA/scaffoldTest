part of 'parsl_scaffold.dart';

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
        Get.until((route) => route.isFirst);
        break;
      case ParslBottomBarAction.help:
        Get.to(SecondScreen());
        return null;
      case ParslBottomBarAction.actions:
        Get.to(ThirdScreen());
        return null;
      default:
        return Icon(Icons.error);
    }
  }
}
