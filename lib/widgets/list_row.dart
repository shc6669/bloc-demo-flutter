import 'package:flutter/material.dart';
import 'package:bloc_flutter/models/album_list.dart';
import 'package:bloc_flutter/widgets/txt.dart';

class ListRow extends StatelessWidget {
  final Album? album;

  ListRow({this.album});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Txt(text: album?.title),
          const Divider(),
        ],
      ),
    );
  }
}
