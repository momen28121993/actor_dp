import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '/features/actorPage/modelView/biography_provider.dart';
import '../../../movieHome/viewModel/actor_provider.dart';
import '../../../../common/widgets/text_widget.dart';
import '/common/widgets/waiting_widget.dart';
import '../../../../common/colors.dart';



class BiographyScreen extends StatelessWidget {
  const BiographyScreen({Key? key, required this.actorIndex, required this.actorId}) : super(key: key);
  final int? actorIndex ;
  final int? actorId ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor:AppColors.actorPageBackground ,
          title: HelperWidget.actorName(
              name: Provider.of<ActorProvider>(context).actorsList[actorIndex!].name,
              color:  AppColors.actorPageTitleName,
              fontFamily: 'DancingScript',
              wieght : FontWeight.bold),
        ),
      body:   SizedBox(
        height: double.infinity,
        width: double.infinity,
        child:  Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            future: Provider.of<BiographyProvider>(context).getBioforActor(actorId!),
            builder:(context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return const WaitingWidget();
              }
              else {
                return SingleChildScrollView(
                  child: Expanded(
                      child: Text(Provider.of<BiographyProvider>(context).biographyData,
                      style: const TextStyle(
                        fontSize: 25,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'LoraItalicVariableFont'
                      ),
                      )
                  ),
                );
              }
            },
          ) ,
        ),
      ),

    );
  }
}

