part of 'parsl_scaffold.dart';

enum FloatingButtonType { scanTag, scanPackage }

extension FloatingButtonInfo on FloatingButtonType {
  Icon get buttonIcon {
    IconData data;
    switch (this) {
      case FloatingButtonType.scanTag:
        data = Icons.qr_code_scanner;
        break;
      case FloatingButtonType.scanPackage:
        data = Icons.settings_overscan;
        break;
      default:
        data = Icons.error;
        break;
    }

    return Icon(
      data,
      color: Colors.white,
    );
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
