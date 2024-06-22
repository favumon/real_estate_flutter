import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:real_estate_app/utils/constants.dart';

class ListVariantsButton extends StatefulWidget {
  const ListVariantsButton({super.key});

  @override
  State<ListVariantsButton> createState() => _ListVariantsButtonState();
}

class _ListVariantsButtonState extends State<ListVariantsButton> {
  double _containerHeight = 0;
  double _containerWidth = 20;
  @override
  void initState() {
    Future.delayed(animationDelayMedium).then(
      (value) {
        setState(() {
          _containerHeight = 40;
          _containerWidth = 150;
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      height: _containerHeight,
      width: _containerWidth,
      child: TextButton.icon(
          style: ButtonStyle(
              padding: WidgetStateProperty.all(EdgeInsets.zero),
              foregroundColor:
                  WidgetStateProperty.all(Colors.white.withOpacity(0.7)),
              backgroundColor:
                  WidgetStateProperty.all(Colors.grey[700]?.withOpacity(0.7))),
          icon: FittedBox(child: Icon(Icons.segment_rounded)),
          onPressed: () {},
          label: FittedBox(child: Text('List of Variants'))),
    );
  }
}
