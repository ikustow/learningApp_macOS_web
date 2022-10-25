import 'package:flutter/material.dart';
import 'package:web_app_dashboard/core/const_strings.dart';
import 'package:web_app_dashboard/core/theme.dart';

class AdvertisingBannerMobileWidget extends StatelessWidget {
  const AdvertisingBannerMobileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecorationStyles.advMobileStyle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 8.0,top: 8.0),
                  child: AdvTitleStringMobile(),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0,top: 8.0, bottom: 8.0),
                  child: AdvDescriptionTextMobileWidget(),
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}

class AdvTitleStringMobile extends StatelessWidget {
  const AdvTitleStringMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Text(
      Strings.advTitle,
      style: TextStyles.advTitleTextStyle,
    );
  }
}


class AdvDescriptionTextMobileWidget extends StatelessWidget {
  const AdvDescriptionTextMobileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      Strings.advDescription,
      style: TextStyles.advDescriptionTextStyle,
    );
  }
}

