
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modelView/images_provider.dart';

class DowenloadButton extends StatelessWidget {
  const DowenloadButton({
    Key? key,
    required this.imageIndex,
  }) : super(key: key);

  final int imageIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        String theName = 'name';
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('file name'),
            content: TextField(
              onChanged: (value) {
                theName = value;
              },
              decoration: const InputDecoration(hintText: 'type here'),
            ),
            actionsAlignment: MainAxisAlignment.spaceAround,
            backgroundColor: Colors.white,
            actionsPadding: const EdgeInsets.only(bottom: 15),
            actions: [
              InkWell(
                onTap: () {
                  Provider.of<ImagePathProvider>(context, listen: false)
                      .dowenloadImage(imageIndex, theName);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.cyan),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.cyan),
                ),
              )
            ],
          ),
        );
      },
      child: const Icon(Icons.download_for_offline, size: 40),
    );
  }
}