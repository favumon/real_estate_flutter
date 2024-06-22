import 'dart:ui';

import 'package:flutter/material.dart';

class ListingContainer extends StatefulWidget {
  final double height;

  final String thumbNail;
  final String buttonText;

  final BoxFit fit;

  const ListingContainer(
      {super.key,
      required this.height,
      required this.thumbNail,
      this.fit = BoxFit.cover, required this.buttonText});

  @override
  State<ListingContainer> createState() => _ListingContainerState();
}

class _ListingContainerState extends State<ListingContainer> {
  double _sliderButtonWidth=40;
  double _textOpacity=0;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      setState(() {
              _sliderButtonWidth=1000;
      });
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          image: DecorationImage(fit: widget.fit, image: AssetImage(widget.thumbNail)),
          borderRadius: BorderRadius.circular(25)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            onEnd: () => setState(() {
              _textOpacity=1;
            }),
            curve: Curves.easeInOut,
            width: _sliderButtonWidth,
            decoration: BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.7),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(50)),
            height: 40,
            alignment: Alignment.centerRight,
            child: Stack(
              children: [
                AnimatedOpacity(
                  opacity: _textOpacity,
                  duration: const Duration(milliseconds: 100),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(widget.buttonText),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 40,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFFBF5EB)),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 12,
                    ),
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
