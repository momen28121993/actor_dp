import 'package:flutter/material.dart';

Text actorName(
      String name,
      Color color,
      String fontFamily,
      FontWeight wieght) {
    return Text(
      name,
      style: TextStyle(
        color: color,
        fontSize: 25,
        fontFamily: fontFamily,
        fontWeight: wieght,
      ),
    );
  }


Text noPhotoText(
    String name,
    Color color,
    FontWeight wieght) {
  return Text(
    name,
    style: TextStyle(
      color: color,
      fontSize: 25,
      fontWeight: wieght,
    ),
  );
}
