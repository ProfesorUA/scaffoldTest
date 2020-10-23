part of 'parsl_scaffold.dart';

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