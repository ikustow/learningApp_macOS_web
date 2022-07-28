import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_app_dashboard/core/theme.dart';
import 'package:web_app_dashboard/responsive/responsive_layout.dart';

import '../../../core/const_strings.dart';

class AdvertisingBannerWidget extends StatelessWidget {
  final TypeOfResponsive type;

  const AdvertisingBannerWidget({Key? key, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey _globalKey = GlobalKey();
    return Expanded(

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
        child: Container(
           decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.orange[400],
          ),
          child: Padding(
            padding: const EdgeInsets.all(0.4),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 12, sigmaX: 12),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.white.withOpacity(.1),
                      padding: const EdgeInsets.all(48),
                    ),
                  ),
                ),
                Align(
                  alignment: (type == TypeOfResponsive.Desktop) ? Alignment.topLeft: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AdvTitleString(),
                        const SizedBox(
                          height: 8,
                        ),
                        (type == TypeOfResponsive.Desktop)
                            ? const AdvDescriptionTextWidget()
                            : const SizedBox.shrink(),
                        const SizedBox(
                          height: 24,
                        ),
                        const GetPremiumButtonWidget()
                      ],
                    ),
                  ),
                ),
                (type == TypeOfResponsive.Tablet )
                    ? const PictureWidget(height: AdvPictureSettings.mainTabletHeight, width: AdvPictureSettings.mainTabletWidth,)
                    : const SizedBox.shrink(),
                (type == TypeOfResponsive.Desktop)
                    ? const PictureWidget(height: AdvPictureSettings.mainHeight, width: AdvPictureSettings.mainWidth,)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class AdvTitleString extends StatelessWidget {
  const AdvTitleString({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Text(
      Strings.advTitle,
      style: TextStyles.advTitleTextStyle,
    );
  }
}


class AdvDescriptionTextWidget extends StatelessWidget {
  const AdvDescriptionTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      Strings.advDescription,
      style: TextStyles.advDescriptionTextStyle,
    );
  }
}



class GetPremiumButtonWidget extends StatelessWidget {
  const GetPremiumButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyles.advButton,
      child: Text(
        Strings.advButtonTitle,
        style: TextStyles.advButtonTitleTextStyle,
      ),
    );
  }
}

class PictureWidget extends StatelessWidget {

  final double height;
  final double width;

  const PictureWidget({Key? key, required this.height, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Image.asset(
            'assets/flutter_illustration.png',
            width: width,
            height: height,
          )),
    );
  }
}
