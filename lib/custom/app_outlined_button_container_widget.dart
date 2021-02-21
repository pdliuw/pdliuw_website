import 'package:flutter/material.dart';

///
/// AppOutlinedButtonContainerWidget
class AppOutlinedButtonContainerWidget extends StatefulWidget {
  Widget child;
  Widget icon;
  VoidCallback onPressed;
  Color fillColor;
  Color borderColor;
  Color textColor;
  Decoration decoration;
  AppOutlinedButtonContainerWidget.defaultStyle({
    Key key,
    @required this.child,
    IconData iconData = Icons.remove_red_eye,
    this.onPressed,
    this.fillColor,
    this.borderColor = Colors.blue,
    this.textColor = Colors.white,
    this.decoration,
  }) : super(key: key) {
    this.icon = Icon(
      iconData,
      size: 18,
      color: textColor,
    );
    if (child is Text) {
      Text text = child;
      child = Text(
        text.data,
        style: text.style == null
            ? TextStyle(color: textColor)
            : text.style.copyWith(color: textColor),
      );
    }
  }
  @override
  _AppOutlinedButtonContainerWidgetState createState() =>
      _AppOutlinedButtonContainerWidgetState();
}

class _AppOutlinedButtonContainerWidgetState
    extends State<AppOutlinedButtonContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.decoration,
      child: OutlinedButton.icon(
        key: widget.key,
        style: OutlinedButton.styleFrom(
            backgroundColor: widget.fillColor,
            padding: EdgeInsets.only(
              left: 18,
              top: 18,
              right: 18,
              bottom: 18,
            ),
            side: BorderSide(width: 2, color: widget.borderColor),
            shape: StadiumBorder()),
        onPressed: widget.onPressed,
        icon: widget.icon,
        label: widget.child,
      ),
    );
  }
}
