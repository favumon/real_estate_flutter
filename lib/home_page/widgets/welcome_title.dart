import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/constants.dart';

class WelcomeTitle extends StatefulWidget {
  const WelcomeTitle({super.key});

  @override
  State<WelcomeTitle> createState() => _WelcomeTitleState();
}

class _WelcomeTitleState extends State<WelcomeTitle> {
  double _hiTextOpacity = 0;

  @override
  void initState() {
    Future.delayed(animationDelayMedium).then((value) => setState(() {
          _hiTextOpacity = 1;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        duration: animationDuration,
        opacity: _hiTextOpacity,
        child: Text(
          'Hi, Marina',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Color(0xffA5957E), fontWeight: FontWeight.w400),
        ));
  }
}
