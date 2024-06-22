import 'package:flutter/material.dart';
import 'package:real_estate_app/search_page/widgets/filter_button.dart';
import 'package:real_estate_app/search_page/widgets/list_variants_button.dart';
import 'package:real_estate_app/search_page/widgets/map_marker.dart';
import 'package:real_estate_app/search_page/widgets/map_overlay_button.dart';
import 'package:real_estate_app/search_page/widgets/search_textfield.dart';
import 'package:real_estate_app/search_page/widgets/wallet_button.dart';
import 'dart:math' as math;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isPriceMode = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/map.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: SearchTextfield()),
                    FilterButton()
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                        left: 90,
                        top: 60,
                        child: MapMarker(
                          isPriceMode: isPriceMode,
                          label: '10,3 mn ₽',
                          key: UniqueKey(),
                        )),
                    Positioned(
                        left: 90,
                        top: 120,
                        child: MapMarker(
                          isPriceMode: isPriceMode,
                          label: '11 mn ₽',
                          key: UniqueKey(),
                        )),
                    Positioned(
                        right: 20,
                        top: 130,
                        child: MapMarker(
                          isPriceMode: isPriceMode,
                          label: '11 mn ₽',
                          key: UniqueKey(),
                        )),
                    Positioned(
                        right: 20,
                        top: 130,
                        child: MapMarker(
                          isPriceMode: isPriceMode,
                          label: '7,8 mn ₽',
                          key: UniqueKey(),
                        )),
                    Positioned(
                        right: 20,
                        top: 230,
                        child: MapMarker(
                          isPriceMode: isPriceMode,
                          label: '8,5 mn ₽',
                          key: UniqueKey(),
                        )),
                    Positioned(
                        left: 60,
                        top: 300,
                        child: MapMarker(
                          isPriceMode: isPriceMode,
                          label: '13,3 mn ₽',
                          key: UniqueKey(),
                        )),
                    Positioned(
                        right: 60,
                        top: 400,
                        child: MapMarker(
                          isPriceMode: isPriceMode,
                          label: '6,95 mn ₽',
                          key: UniqueKey(),
                        )),

            

                    WalletButton(
                      onChangeMapFilter: (filter) {
                        setState(() {
                          if (filter == MapFilter.price) {
                            isPriceMode = true;
                          } else {
                            isPriceMode = false;
                          }
                        });
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.rotate(
                      angle: 100,
                      child: MapOverlayButton(
                        icon: Icons.send_rounded,
                        onButtonTaped: () {},
                      ),
                    ),

                    ListVariantsButton()
               
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
