import 'dart:async';

import 'package:flutter/widgets.dart';

class RentOfferCountUpTimer extends StatefulWidget {
  RentOfferCountUpTimer({Key? key}) : super(key: key);

  @override
  State<RentOfferCountUpTimer> createState() => _RentOfferCountUpTimerState();
}

class _RentOfferCountUpTimerState extends State<RentOfferCountUpTimer> {

  int rentCount=800;
  final maxRentCount=2210;
  late Timer timer;
  @override
  void initState() {
    super.initState();
   timer= Timer.periodic(const Duration(milliseconds: 3), (timer) {
    setState(() {
            rentCount++;
    });
      if(rentCount>maxRentCount) {
        timer.cancel();
      }
    },);
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Text(rentCount.toString());
  }
}