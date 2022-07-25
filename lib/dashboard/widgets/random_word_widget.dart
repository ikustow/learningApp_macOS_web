
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_app_dashboard/dashboard/controller/providers.dart';

class RandomWordValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Consumer(
      builder: (context,  WidgetRef ref, child){
        final wordList = ref.watch(randomWordProvider);
        final word = wordList[0];
        return Column(children: [
          Text(word.value),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              RandomWordController controller =
              ref.read(randomWordProvider.notifier);
              controller.updateWord(word.id);
            },
          )
        ],);
      },
    );
  }
}
