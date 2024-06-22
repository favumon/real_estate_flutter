import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({super.key});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  double buttonWidth = 0;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then(
      (value) {
        setState(() {
          buttonWidth = 50;
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 50,
      alignment: Alignment.center,
      child: AnimatedContainer(
        alignment: Alignment.center,
        child: FittedBox(
          child: Icon(
            Icons.tune_rounded,
          ),
        ),
        duration: Duration(milliseconds: 1000),
        width: buttonWidth,
        height: 100,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white, ),
      ),
    );
  }
}

