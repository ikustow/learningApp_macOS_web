import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_app_dashboard/core/theme.dart';

import '../../core/const_strings.dart';

class AdvertisingBannerWidget extends StatelessWidget {

  const AdvertisingBannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.orange[400],
          ),
          child:Padding(
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
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(Strings.advTitle, style: TextStyles.advTitleTextStyle,),
                      SizedBox(height: 8,),
                      Text(Strings.advDescription, style: TextStyles.advDescriptionTextStyle,),
                      SizedBox(height: 16,),
                      ElevatedButton(onPressed: (){}, child: Text(Strings.advButtonTitle, style: TextStyles.advButtonTitleTextStyle,), style: ButtonStyles.advButton,)
                    ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Image.asset('assets/flutter_illustration.png', width: 200,height: 150,)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

