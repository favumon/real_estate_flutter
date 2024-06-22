import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/constants.dart';

import 'buy_offer_count_up_timer.dart';

class BuyOfferContainer extends StatefulWidget {
  const BuyOfferContainer({super.key});

  @override
  State<BuyOfferContainer> createState() => _BuyOfferContainerState();
}

class _BuyOfferContainerState extends State<BuyOfferContainer> {
  double _offerContainerHeight = 0;
  @override
  void initState() {
    super.initState();
    Future.delayed(animationDelayMedium).then((value) => setState(() {
          _offerContainerHeight = 160;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: (MediaQuery.of(context).size.width/2)-20,
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
          transformAlignment: Alignment.bottomCenter,
          duration: animationDuration,
          height: _offerContainerHeight,
          width: _offerContainerHeight,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xffFC9D11)),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 3000),
                    style: TextStyle(
                        fontSize: 15 * (_offerContainerHeight * 0.007),
                        color: Colors.white),
                    child: Text(
                      'BUY',
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 10 * (_offerContainerHeight * 0.0009),
                    ),
                    AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 3000),
                      style: TextStyle(
                          fontSize: 28 * (_offerContainerHeight * 0.007),
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                      child: BuyOfferCountUpTimer(),
                    ),
                    AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 2000),
                      style: TextStyle(
                          fontSize: 15 * (_offerContainerHeight * 0.007),
                          color: Colors.white),
                      child: Text(
                        'offers',
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
