import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/constants.dart';

class LocationSearchTextField extends StatefulWidget {
  const LocationSearchTextField({super.key});

  @override
  State<LocationSearchTextField> createState() =>
      _LocationSearchTextFieldState();
}

class _LocationSearchTextFieldState extends State<LocationSearchTextField> {
  double _textFieldWidth = 0;
  @override
  void initState() {
    super.initState();
    Future.delayed(animationDelaySmall).then((value) => setState(() {
          _textFieldWidth = 200;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: animationDuration,
        width: _textFieldWidth,
        child: TextFormField(
          initialValue: 'Saint Petersburg',
          style: const TextStyle(color: Color(0xffA5957E)),
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.location_on_rounded,
              color: Color(0xffA4957E),
            ),
            filled: true,
            fillColor: Color(0xffFDFDFC),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
          ),
        ));
  }
}
