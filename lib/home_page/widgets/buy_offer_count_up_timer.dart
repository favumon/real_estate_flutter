import 'dart:async';

import 'package:flutter/widgets.dart';

class BuyOfferCountUpTimer extends StatefulWidget {
  BuyOfferCountUpTimer({Key? key}) : super(key: key);

  @override
  State<BuyOfferCountUpTimer> createState() => _BuyOfferCountUpTimerState();
}

class _BuyOfferCountUpTimerState extends State<BuyOfferCountUpTimer> {

  int _buyCount=0;
  final _maxBuyCount=1034;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
   _timer= Timer.periodic(const Duration(milliseconds: 5), (timer) {
    setState(() {
            _buyCount++;
    });
      if(_buyCount>_maxBuyCount) {
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
    return Text(_buyCount.toString());
  }
}