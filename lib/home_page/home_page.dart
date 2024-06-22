import 'package:flutter/material.dart';
import 'package:real_estate_app/home_page/widgets/buy_offer_container.dart';
import 'package:real_estate_app/home_page/widgets/buy_offer_count_up_timer.dart';
import 'package:real_estate_app/home_page/widgets/listing_container.dart';
import 'package:real_estate_app/home_page/widgets/listings_view.dart';
import 'package:real_estate_app/home_page/widgets/location_search_text_field.dart';
import 'package:real_estate_app/home_page/widgets/rent_offer_container.dart';
import 'package:real_estate_app/home_page/widgets/rent_offer_count_up_timer.dart';
import 'package:real_estate_app/home_page/widgets/user_avatar.dart';
import 'package:real_estate_app/home_page/widgets/welcome_content.dart';
import 'package:real_estate_app/home_page/widgets/welcome_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 100,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: LocationSearchTextField()
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child:UserAvatar()
                        )
                      ],
                    ),
                  )),

              Padding(
                padding: EdgeInsets.only(left: 20),
                child: WelcomeTitle()
              ),
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: EdgeInsets.only(left: 20),
                child:WelcomeContent()
              ),
              
              SizedBox(
                height: 30,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BuyOfferContainer(),
                    RentOfferContainer()
                  ],
                ),
              )
            ],
          ),
        ),
       ListingsView()
      ],
    );
  }
}
