import 'package:flutter/cupertino.dart';

///write in this variable the dimensions of design
const double designWidth = 400;
const double designHeight = 600;

class AppDimentions {
  static double mediaWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double mediaHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // static double topPadding (BuildContext context) =>
  //     MediaQuery.of(context).padding.top ;
  //
  // static double bottomPadding (BuildContext context) =>
  //     MediaQuery.of(context).padding.bottom ;

  /// here we calculate the scale ratio between design (which in xd or figma design) and the device dimensions (which change depend on the type of device)
  static double totalPadding(BuildContext context) =>
      MediaQuery.of(context).viewPadding.top +
      MediaQuery.of(context).viewPadding.bottom;

  static double widthPaddingView(BuildContext context) =>
      MediaQuery.of(context).viewPadding.right +
      MediaQuery.of(context).viewPadding.left;

  static double deviceWidth(BuildContext context) =>
      MediaQuery.of(context).size.width - widthPaddingView(context);

  static double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height - totalPadding(context);

  /// multiply the scale by th dimension of my app in resource files

  static double wScale(BuildContext context) =>
      deviceWidth(context) / designWidth;

  static double hScale(BuildContext context) =>
      deviceHeight(context) / designHeight;

//     double widthPaddingView = MediaQuery.of(context).viewPadding.right+MediaQuery.of(context).viewPadding.left;
//     paddingView = MediaQuery.of(context).viewPadding.top+MediaQuery.of(context).viewPadding.bottom;
//     double deviceWidth = MediaQuery.of(context).size.width-widthPaddingView;
//     double deviceHeight =  MediaQuery.of(context).size.height -paddingView;
//     double wScale = deviceWidth/designWidth ;
//     double hScale = deviceHeight/designHeight ;

}
