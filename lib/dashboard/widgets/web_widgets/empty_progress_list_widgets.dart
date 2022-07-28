import 'package:flutter/material.dart';

class EmptyProgressList extends StatelessWidget {
  const EmptyProgressList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return const EmptyTile();
        },
      ),
    );
  }
}


class EmptyTile extends StatelessWidget {
  const EmptyTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 78,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.grey[200]),
      ),
    );
  }
}