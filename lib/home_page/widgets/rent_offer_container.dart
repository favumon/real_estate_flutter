import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/constants.dart';

import 'rent_offer_count_up_timer.dart';

class RentOfferContainer extends StatefulWidget {
  const RentOfferContainer({super.key});

  @override
  State<RentOfferContainer> createState() => _RentOfferContainerState();
}

class _RentOfferContainerState extends State<RentOfferContainer> {
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
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xffFDF7F1), Colors.white]),
              borderRadius: BorderRadius.circular(20),
              shape: BoxShape.rectangle,
              color: Color(0xffFC9D11)),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 3000),
                    style: TextStyle(
                        fontSize: 15 * (_offerContainerHeight * 0.007),
                        color: Color(0xffA5957E)),
                    child: Text(
                      'RENT',
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
                      height: 10 * (_offerContainerHeight * 0.001),
                    ),
                    AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 3000),
                        style: TextStyle(
                            fontSize: 28 * (_offerContainerHeight * 0.007),
                            color: Color(0xffA5957E),
                            fontWeight: FontWeight.w700),
                        child: RentOfferCountUpTimer()),
                    AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 3000),
                      style: TextStyle(
                          fontSize: 15 * (_offerContainerHeight * 0.007),
                          color: Color(0xffA5957E)),
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
