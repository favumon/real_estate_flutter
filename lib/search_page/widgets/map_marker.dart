import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/constants.dart';

class MapMarker extends StatefulWidget {
  const MapMarker({super.key, required this.label, required this.isPriceMode});
  final String label;
  final bool isPriceMode;

  @override
  State<MapMarker> createState() => _MapMarkerState();
}

class _MapMarkerState extends State<MapMarker> {
  double markerHeight = 0;
  double markerWidth = 0;
  @override
  void initState() {
    Future.delayed(animationDelayMedium).then(
      (value) => setState(() {
        markerHeight = 40;

        if (widget.isPriceMode) {
          markerWidth = 70;
        } else {
          markerWidth = 30;
        }
      }),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 70,
      alignment: Alignment.bottomLeft,
      child: AnimatedContainer(
        duration: animationDuration,
        transformAlignment: Alignment.bottomLeft,
        height: markerHeight,
        width: markerWidth,
        alignment: Alignment.center,
        child: FittedBox(
          child: widget.isPriceMode
              ? Text(
                  widget.label,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              : Icon(
                  Icons.location_city_rounded,
                  color: Colors.white70,
                ),
        ),
        decoration: BoxDecoration(
            color: Color(0xffFC9D11),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(8),
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            )),
      ),
    );
  }
}
