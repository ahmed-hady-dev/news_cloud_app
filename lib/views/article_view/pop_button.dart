import 'package:flutter/material.dart';

class PopButton extends StatelessWidget {
  const PopButton({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: width * 0.03,
      top: height * 0.06,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: BackButton(
          color: Colors.white,
        ),
      ),
    );
  }
}
