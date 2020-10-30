import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidthSize;
  static double screenHeightSize;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  initSize(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidthSize = _mediaQueryData.size.width;
    screenHeightSize = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidthSize / 100;
    blockSizeVertical = screenHeightSize / 100;
  }
}
