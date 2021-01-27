import 'package:flutter/cupertino.dart';

///
/// AppScrollViewFactory
class AppScrollViewFactory {
  ///
  /// createScrollView
  static Widget createScrollView({
    Widget child,
  }) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: child,
    );
  }
}
