import 'package:flutter/material.dart';

class HelperWidget {

static Text actorName( {
     required String name,
    required  Color color,
      String? fontFamily,
      FontWeight? wieght}) {
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


static Text noPhotoText({
  required  String name,
  required  Color color,
  required  FontWeight wieght}) {
  return Text(
    name,
    style: TextStyle(
      color: color,
      fontSize: 25,
      fontWeight: wieght,
    ),
  );
}
}