import 'package:flutter/material.dart';
import 'package:real_estate_app/home_page/widgets/buy_offer_count_up_timer.dart';
import 'package:real_estate_app/home_page/widgets/rent_offer_count_up_timer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 800)).then((value) => setState(() {
          textFieldWidth = 200;
          avatarHeight = 60;
          hiTextOpacity = 1;
          selectPlaceTextHeight = 40;
          offerContainerHeight = 160;
        }));
  }

  double textFieldWidth = 0;
  double avatarHeight = 30;
  double hiTextOpacity = 0;
  double selectPlaceTextHeight = 0;
  double offerContainerHeight = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 100,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: textFieldWidth,
                          child: TextFormField(
                            initialValue: 'Saint Petersburg',
                            style: const TextStyle(color: Color(0xffA5957E)),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.location_on_rounded,
                                color: Color(0xffA4957E),
                              ),
                              filled: true,
                              fillColor: Color(0xffFDFDFC),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                            ),
                          )),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: avatarHeight,
                          width: avatarHeight,
                          child: Image.asset('assets/images/avatar.png')),
                    )
                  ],
                ),
              )),

          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: AnimatedOpacity(
                duration: Duration(milliseconds: 600),
                opacity: hiTextOpacity,
                child: Text(
                  'Hi, Marina',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Color(0xffA5957E), fontWeight: FontWeight.w400),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20),
          //   child: AnimatedOpacity(
          //     duration: Duration(milliseconds: 600),
          //     opacity: hiTextOpacity,
          //     child: Text('let\'s select your\nperfect place',style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),)),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: AnimatedContainer(
                height: selectPlaceTextHeight,
                duration: Duration(milliseconds: 600),
                child: Text(
                  'let\'s select your',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: AnimatedContainer(
                height: selectPlaceTextHeight,
                duration: Duration(milliseconds: 600),
                child: Text(
                  'perfect place',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                )),
          ),
          SizedBox(
            height: 30,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                    transformAlignment: Alignment.center,
                    duration: Duration(milliseconds: 3000),
                    height: offerContainerHeight,
                    width: offerContainerHeight,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffFC9D11)),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: AnimatedDefaultTextStyle(
                              duration: Duration(milliseconds: 3000),
                              style: TextStyle(
                                  fontSize: 15 * (offerContainerHeight * 0.007),
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
                                height: 10,
                              ),
                              AnimatedDefaultTextStyle(
                                duration: Duration(milliseconds: 3000),
                                style: TextStyle(
                                    fontSize:
                                        28 * (offerContainerHeight * 0.007),
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                                child: BuyOfferCountUpTimer(),
                              ),
                              AnimatedDefaultTextStyle(
                                duration: Duration(milliseconds: 3000),
                                style: TextStyle(
                                    fontSize:
                                        15 * (offerContainerHeight * 0.007),
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
                AnimatedContainer(
                    transformAlignment: Alignment.center,
                    duration: Duration(milliseconds: 3000),
                    height: offerContainerHeight,
                    width: offerContainerHeight,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xffFDF7F1), Colors.white]),
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
                                  fontSize: 15 * (offerContainerHeight * 0.007),
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
                                height: 10,
                              ),
                              AnimatedDefaultTextStyle(
                                                         duration: Duration(milliseconds: 3000),
                                style: TextStyle(
                                    fontSize:
                                        28 * (offerContainerHeight * 0.007),
                                    color: Color(0xffA5957E),
                                    fontWeight: FontWeight.w700),
                                child:RentOfferCountUpTimer()
                              ),
                              AnimatedDefaultTextStyle(
                                           duration: Duration(milliseconds: 3000),
                                style: TextStyle(
                                    fontSize:
                                        15 * (offerContainerHeight * 0.007),
                                    color: Color(0xffA5957E)),
                                child: Text(
                                  'offers',
                               
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
