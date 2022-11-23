
import 'package:flutter/cupertino.dart';


class AppDimentions {

  static double mediaWidth (BuildContext context) =>
      MediaQuery.of(context).size.width ;

  static double mediaHieght (BuildContext context) =>
      MediaQuery.of(context).size.height ;

  static double topPadding (BuildContext context) =>
      MediaQuery.of(context).padding.top ;

  static double bottomPadding (BuildContext context) =>
      MediaQuery.of(context).padding.bottom ;


}


//double paddingview = MediaQuery.of(context).viewPadding.top+MediaQuery.of(context).viewPadding.bottom;
//     double widthpaddingview = MediaQuery.of(context).viewPadding.right+MediaQuery.of(context).viewPadding.left;
//     double deviceWidth = MediaQuery.of(context).size.width-widthpaddingview;
//     double deviceHieght =  MediaQuery.of(context).size.height -paddingview;
//     double wScale = deviceWidth/designeWidth ;
//     double hScale = deviceHieght/designeHeight ;