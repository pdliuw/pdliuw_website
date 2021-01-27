import 'package:flutter/material.dart';

///
/// AirTextWidget
class AirTextWidget extends StatelessWidget {
  String _data;
  bool _isLight;
  bool _isBold;
  AirTextSize _textSize;
  Color _color;
  double _lineHeight;
  AirTextWidget.defaultStyle({
    @required String data,
    bool isLight = false,
    AirTextSize textSize = AirTextSize.small1,
    bool isBold = false,
    Color color,
    double lineHeight = 2,
  }) {
    _data = data;
    _isLight = isLight;
    _textSize = textSize;
    _isBold = isBold;
    _color = color;
    _lineHeight = lineHeight;
  }
  @override
  Widget build(BuildContext context) {
    return Text(
      _data,
      style: TextStyle(
        color: _isLight
            ? Theme.of(context).primaryColor
            : _color ?? Theme.of(context).textTheme.button.color,
        fontSize: getFontSize(_textSize),
        fontWeight: _isBold ? FontWeight.bold : FontWeight.normal,
        height: _lineHeight, //行高比例，两行文字间的举例
      ),
    );
  }
}

enum AirTextSize {
  small1,
  small2,
  small3,
  middle1,
  middle2,
  middle3,
  middle4,
  middle5,
  middle6,
  large1,
  large2,
  large3,
}

/// 通过[AirTextSize]类型去获取相对应的文字大小/尺寸
double getFontSize(AirTextSize airTextSize) {
  double fontSize;
  switch (airTextSize) {
    case AirTextSize.small1:
      fontSize = 12;
      break;
    case AirTextSize.small2:
      fontSize = 10;
      break;
    case AirTextSize.small3:
      fontSize = 8;
      break;
    case AirTextSize.middle1:
      fontSize = 18;
      break;
    case AirTextSize.middle2:
      fontSize = 17;
      break;
    case AirTextSize.middle3:
      fontSize = 16;
      break;
    case AirTextSize.middle4:
      fontSize = 15;
      break;
    case AirTextSize.middle5:
      fontSize = 14;
      break;
    case AirTextSize.middle6:
      fontSize = 13;
      break;
    case AirTextSize.large1:
      fontSize = 24;
      break;
    case AirTextSize.large2:
      fontSize = 22;
      break;
    case AirTextSize.large3:
      fontSize = 20;
      break;
  }
  return fontSize;
}
