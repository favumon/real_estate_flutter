import 'dart:async';

import 'package:flutter/widgets.dart';

class RentOfferCountUpTimer extends StatefulWidget {
  RentOfferCountUpTimer({Key? key}) : super(key: key);

  @override
  State<RentOfferCountUpTimer> createState() => _RentOfferCountUpTimerState();
}

class _RentOfferCountUpTimerState extends State<RentOfferCountUpTimer> {

  int _rentCount=800;
  final _maxRentCount=2210;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
   _timer= Timer.periodic(const Duration(milliseconds: 3), (timer) {
    setState(() {
            _rentCount++;
    });
      if(_rentCount>_maxRentCount) {
        timer.cancel();
      }
    },);
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Text(_rentCount.toString());
  }
}