import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/constants.dart';

enum TabBarTab { search, message, home, favorite, profile }

class MapOverlayButton extends StatefulWidget {
  final Function() onButtonTaped;
  final IconData icon;
  const MapOverlayButton(
      {super.key,
      required this.onButtonTaped, required this.icon});

  @override
  State<MapOverlayButton> createState() => _MapOverlayButtonState();

}

class _MapOverlayButtonState extends State<MapOverlayButton> {
  double borderWidth = 0;
  double buttonSize=0;

  @override
  void initState() {
    Future.delayed(animationDelayMedium).then((value) => setState(() {
      buttonSize=48;
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        borderWidth = 7;
      }),
      child: AnimatedContainer(
        duration: animationDuration,
        height: buttonSize,
        width: buttonSize,
        child: AnimatedContainer(
          margin: EdgeInsets.all(borderWidth * 0.9),
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: Colors.grey[700]?.withOpacity(0.7),
            border: Border.all(
                color: borderWidth == 0 ? Colors.transparent : Colors.white,
                width: borderWidth*.1),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(1),
          child: FittedBox(
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease,
                onEnd: () {
                  setState(() {
                    borderWidth = 0;
                  });
            
                  Future.delayed(const Duration(milliseconds: 100)).then(
                    (value) {
                      widget.onButtonTaped();
                    },
                  );
                  // });
                },
                decoration: BoxDecoration(
                  border: Border.all(
                      color: borderWidth == 0
                          ? Colors.transparent
                          : Colors.white.withOpacity(0.9),
                      width: borderWidth * 0.85),
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(12),
                child: Icon(
                  widget.icon,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}


