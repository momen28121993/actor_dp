
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '/features/movieHome/viewModel/actor_provider.dart';
import '../../../../common/widgets/text_widget.dart';
import '../../../../common/colors.dart';
import '../widgets/image_gallary_grid.dart';
import '../widgets/actor_info_row.dart';

class ActorScreen extends StatelessWidget {
  static String routName = 'ActorScreen' ;
  final int? actorListIndex ;
  final int? actorId ;
  const ActorScreen({Key? key, required this.actorListIndex, this.actorId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor:AppColors.actorPageBackground ,
        title: HelperWidget.actorName(
             name: Provider.of<ActorProvider>(context).actorsList[actorListIndex!].name,
            color:  AppColors.actorPageTitleName,
             fontFamily: 'DancingScript',
             wieght : FontWeight.bold),
        ),

      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: AppColors.actorPageBackground,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:10,left: 10,right: 10),
              child: ActorInfoRow(
                  actorListIndex: actorListIndex,
                  actorId: actorId,

              ),
            ),
            const Divider(
              color: Colors.black87,
              endIndent: 20,
              indent: 20,
              thickness: 2,
            ),
            const SizedBox(
              height: 15,
            ),
            ImageGallaryGrid(actorId: actorId)
          ],
        ),
      ),
    );
  }
}






