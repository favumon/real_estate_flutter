import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/constants.dart';

class WelcomeContent extends StatefulWidget {
  const WelcomeContent({super.key});

  @override
  State<WelcomeContent> createState() => _WelcomeContentState();
}

class _WelcomeContentState extends State<WelcomeContent> {
  double _selectPlaceTextHeight = 0;
  @override
  void initState() {
    super.initState();
    Future.delayed(animationDelayMedium).then((value) => setState(() {
          _selectPlaceTextHeight = 40;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
            height: _selectPlaceTextHeight,
            duration: animationDuration,
            child: Text(
              'let\'s select your',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            )),
        AnimatedContainer(
            height: _selectPlaceTextHeight,
            duration: animationDuration,
            child: Text(
              'perfect place',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            )),
      ],
    );
  }
}
