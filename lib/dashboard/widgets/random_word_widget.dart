import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_app_dashboard/core/const_strings.dart';
import 'package:web_app_dashboard/dashboard/controller/providers.dart';

class RandomWordWidget extends StatelessWidget {
  const RandomWordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, WidgetRef ref, child) {
        final wordList = ref.watch(randomWordProvider);
        final word = wordList[0];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 4,
            ),
            Text(Strings.newWordTitle,
                style: newWordTitleTextStyle, textAlign: TextAlign.center),
            SizedBox(
              height: 32,
            ),
            Text(
              word.value,
              style: newWordValueTextStyle,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              word.phoneticValue,
              style: newWordPhoneticValueTextStyle,
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 36,
                  icon: Icon(Icons.refresh_sharp),
                  onPressed: () {
                    RandomWordController controller =
                        ref.read(randomWordProvider.notifier);
                    controller.updateWord(word.id);
                  },
                ),
                SizedBox(
                  width: 8,
                ),
                IconButton(
                  iconSize: 36,
                  icon: Icon(Icons.spatial_audio_rounded),
                  onPressed: () {
                    RandomWordController controller =
                        ref.read(randomWordProvider.notifier);
                    controller.updateWord(word.id);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

const TextStyle newWordTitleTextStyle = TextStyle(
  letterSpacing: 1,
  fontSize: 34,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

final TextStyle newWordValueTextStyle = TextStyle(
  letterSpacing: 1,
  fontSize: 32,
  color: Colors.blueAccent.shade400,
  fontWeight: FontWeight.bold,
);

final TextStyle newWordPhoneticValueTextStyle = TextStyle(
  letterSpacing: 1,
  fontSize: 26,
  color: Colors.blueAccent,
  fontWeight: FontWeight.normal,
);
