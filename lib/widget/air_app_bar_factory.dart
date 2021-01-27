import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///
/// AirAppBarFactory
///  create appBar instance method/function
class AirAppBarFactory {
  ///
  ///create air bar instance.
  static AppBar appBar({
    @required String titleName,
    Widget title,
    PreferredSizeWidget bottom,
    double elevation = 2,
    List<Widget> actions = const [],
  }) {
    return AppBar(
      title: title ??
          Text(
            "${titleName ?? ''}",
            style: TextStyle(color: Colors.white),
          ),
      centerTitle: true,
      elevation: elevation,
      iconTheme: IconThemeData(color: Colors.white),
      bottom: bottom,
      actions: actions,
    );
  }
}
