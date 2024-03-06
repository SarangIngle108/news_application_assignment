import 'dart:ui';

class HexColor extends Color {
  /// Hexcolor class constructor
  HexColor(String hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String hexColor) {
    var color = hexColor;
    color = color.toUpperCase().replaceAll('#', '');
    if (color.length == 6) {
      color = 'FF$color';
    }
    return int.parse(color, radix: 16);
  }
}

class HexColors {
  static String headerColor = '#ffffff';
  static String headlineColor = '#f2f2f2';
  static String subHeadlineClor = '#bababa';
  static String appBarColor = '#000000';
  static String bodyBackgroundColor = '#464646';
}
