import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:web_app_dashboard/core/const_strings.dart';
import 'package:web_app_dashboard/core/theme.dart';
import 'package:web_app_dashboard/dashboard/controller/providers.dart';

import '../../../responsive/responsive_layout.dart';

class RandomWordWidget extends StatelessWidget {
  final TypeOfResponsive type;
  const RandomWordWidget({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, WidgetRef ref, child) {
        final wordList = ref.watch(randomWordProvider);
        final word = wordList[0];
        return (type == TypeOfResponsive.Desktop) ? desktopBodyRandomWidget(word: word, ref: ref,): tabletBodyRandomWidget(word: word, ref: ref,);
      },
    );
  }
}


class desktopBodyRandomWidget extends StatelessWidget {
  final word;
  final ref;
  FlutterTts flutterTts = FlutterTts();

  desktopBodyRandomWidget({Key? key, this.word, this.ref}) : super(key: key);

  speak (String text) async {
    await  flutterTts.setLanguage("en-US");
    await  flutterTts.setPitch(0.5);
    await  flutterTts.speak(text);
  }



  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 32, left: 8, right: 8),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12,sigmaY: 12),
            child: Container(
              height: 100,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white.withOpacity(0.8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Text(Strings.newWordTitle,
                      style: TextStyles.newWordTitleTextStyle, textAlign: TextAlign.center),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    word.value,
                    style: TextStyles.newWordValueTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    word.phoneticValue,
                    style: TextStyles.newWordPhoneticValueTextStyle,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 36,
                        icon: const Icon(Icons.refresh_sharp),
                        onPressed: () {
                          RandomWordController controller =
                          ref.read(randomWordProvider.notifier);
                          controller.updateWord(word.id);
                        },
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      IconButton(
                        iconSize: 36,
                        icon: const Icon(Icons.spatial_audio_rounded),
                        onPressed: () {
                          speak(word.value.toString());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class tabletBodyRandomWidget extends StatelessWidget {
  final word;
  final ref;
  FlutterTts flutterTts = FlutterTts();

  tabletBodyRandomWidget({Key? key, this.word, this.ref}) : super(key: key);

  speak (String text) async {
    await  flutterTts.setLanguage("en-US");
    await  flutterTts.setPitch(1);
    await  flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12,sigmaY: 12),
            child: Container(
             // height: 100,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white.withOpacity(0.8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Text(Strings.newWordTabletTitle,
                      style: TextStyles.newWordTabletTitleTextStyle, textAlign: TextAlign.center),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    word.value,
                    style: TextStyles.newWordTabletValueTextStyle,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    word.phoneticValue,
                    style: TextStyles.newWordTabletPhoneticValueTextStyle,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 20,
                        icon: const Icon(Icons.refresh_sharp),
                        onPressed: () {
                          RandomWordController controller =
                          ref.read(randomWordProvider.notifier);
                          controller.updateWord(word.id);
                        },
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      IconButton(
                        iconSize: 20,
                        icon: const Icon(Icons.spatial_audio_rounded),
                        onPressed: () {
                         speak(word.value.toString());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

