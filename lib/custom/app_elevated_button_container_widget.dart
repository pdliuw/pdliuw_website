import 'package:flutter/material.dart';

///
/// AppElevatedButtonContainerWidget
class AppElevatedButtonContainerWidget extends StatefulWidget {
  Widget child;
  Widget icon;
  VoidCallback onPressed;
  Color fillColor;
  Color borderColor;
  Color textColor;

  AppElevatedButtonContainerWidget.defaultStyle({
    Key key,
    @required this.child,
    IconData iconData = Icons.remove_red_eye,
    this.onPressed,
    this.fillColor = Colors.red,
    this.borderColor = Colors.blue,
    this.textColor = Colors.white,
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
  _AppElevatedButtonContainerWidgetState createState() =>
      _AppElevatedButtonContainerWidgetState();
}

class _AppElevatedButtonContainerWidgetState
    extends State<AppElevatedButtonContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.green, Colors.blue],
          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(45))),
      child: ElevatedButton.icon(
        key: widget.key,
        style: ElevatedButton.styleFrom(
          primary: widget.fillColor,
          padding: EdgeInsets.only(
            left: 18,
            top: 18,
            right: 18,
            bottom: 18,
          ),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: widget.borderColor, width: 2.0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              )),
        ),
        onPressed: widget.onPressed,
        icon: widget.icon,
        label: widget.child,
      ),
    );
  }
}
