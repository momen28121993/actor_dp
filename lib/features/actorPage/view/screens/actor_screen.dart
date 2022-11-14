import 'package:dp_move/features/movieHome/viewModel/actor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/colors.dart';
import '../../../../common/widgets/text_widget.dart';
import '../widgets/actor_info_row.dart';
import '../widgets/image_gallary_grid.dart';

class ActorScreen extends StatelessWidget {
  static String id = 'ActorScreen' ;
  final int? actorListIndex ;
  final int? actorId ;
  const ActorScreen({Key? key, required this.actorListIndex, this.actorId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor:AppColors.actorPageBackground ,
        title: actorName(
              '${Provider.of<ActorProvider>(context).actorsList[actorListIndex!].name}',
              AppColors.actorPageTitleName,
              'DancingScript',
              FontWeight.bold),
        ),

      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: AppColors.actorPageBackground,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:10,left: 10,right: 10),
              child: ActorInfoRow(actorListIndex: actorListIndex),
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






