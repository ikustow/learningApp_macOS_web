import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:text_to_speech/text_to_speech.dart';
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
        return (type == TypeOfResponsive.Desktop) ? DesktopBodyRandomWidget(word: word, ref: ref,): TabletBodyRandomWidget(word: word, ref: ref,);
      },
    );
  }
}


class DesktopBodyRandomWidget extends StatelessWidget {
  final word;
  final ref;
  TextToSpeech tts = TextToSpeech();

  String text = '';
  double volume = 1; // Range: 0-1
  double rate = 1.0; // Range: 0-2
  double pitch = 1.0; // Range: 0-2
  final String defaultLanguage = 'en-US';

  DesktopBodyRandomWidget({Key? key, this.word, this.ref}) : super(key: key);

  void speak(text) {
    tts.setVolume(volume);
    tts.setRate(rate);
    tts.setLanguage(defaultLanguage);
    tts.setPitch(pitch);
    tts.speak(text);
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
                  const Text(Strings.newWordTitle,
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

class TabletBodyRandomWidget extends StatelessWidget {
  final word;
  final ref;

  TextToSpeech tts = TextToSpeech();
  String text = '';
  double volume = 1; // Range: 0-1
  double rate = 1.0; // Range: 0-2
  double pitch = 1.0; // Range: 0-2
  final String defaultLanguage = 'en-US';

  TabletBodyRandomWidget({Key? key, this.word, this.ref}) : super(key: key);

  void speak(text) {
    tts.setVolume(volume);
    tts.setRate(rate);
    tts.setLanguage(defaultLanguage);
    tts.setPitch(pitch);
    tts.speak(text);
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
                  const Text(Strings.newWordTabletTitle,
                      style: TextStyles.newWordTabletTitleTextStyle, textAlign: TextAlign.center),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    word.value,
                    style: TextStyles.newWordTabletValueTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    word.phoneticValue,
                    style: TextStyles.newWordTabletPhoneticValueTextStyle,
                  ),
                  const SizedBox(
                    height: 16,
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

