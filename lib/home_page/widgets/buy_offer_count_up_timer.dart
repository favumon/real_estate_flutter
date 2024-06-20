import 'dart:async';

import 'package:flutter/widgets.dart';

class BuyOfferCountUpTimer extends StatefulWidget {
  BuyOfferCountUpTimer({Key? key}) : super(key: key);

  @override
  State<BuyOfferCountUpTimer> createState() => _BuyOfferCountUpTimerState();
}

class _BuyOfferCountUpTimerState extends State<BuyOfferCountUpTimer> {

  int buyCount=0;
  final maxBuyCount=1034;
  late Timer timer;
  @override
  void initState() {
    super.initState();
   timer= Timer.periodic(const Duration(milliseconds: 5), (timer) {
    setState(() {
            buyCount++;
    });
      if(buyCount>maxBuyCount) {
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
    return Text(buyCount.toString());
  }
}