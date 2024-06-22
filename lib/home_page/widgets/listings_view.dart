import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/constants.dart';

import 'listing_container.dart';

class ListingsView extends StatefulWidget {
  const ListingsView({super.key});

  @override
  State<ListingsView> createState() => _ListingsViewState();
}

class _ListingsViewState extends State<ListingsView> {
  final DraggableScrollableController _controller =
      DraggableScrollableController();
  double minChildSize = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(animationDelayMedium).then(
        (value) => Future.delayed(const Duration(seconds: 3)).then((value) {
              _controller
                  .animateTo(.6,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.decelerate)
                  .then(
                    (value) => setState(() => minChildSize = .4),
                  );
            }));
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: .6,
      minChildSize: minChildSize,
      initialChildSize: minChildSize,
      controller: _controller,
      builder: (BuildContext context, scrollController) {
        return Container(
          clipBehavior: Clip.hardEdge,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: CustomScrollView(
            controller: scrollController,
              physics:  ClampingScrollPhysics(),

            slivers: [
              SliverList.list(children: const [
                ListingContainer(
                  height: 200,
                  thumbNail: 'assets/images/real_estate01.png',
                  buttonText: 'Gladkova St., 25',
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ListingContainer(
                      height: 300,
                      thumbNail: 'assets/images/real_estate02.jpg',
                      fit: BoxFit.fitHeight,
                      buttonText: 'Gubina St., 11',
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          ListingContainer(
                            height: 150,
                            thumbNail: 'assets/images/real_estate03.jpg',
                            buttonText: 'Trefoleva St., 43',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListingContainer(
                            height: 150,
                            thumbNail: 'assets/images/real_estate04.jpg',
                            buttonText: 'Sedova St., 22',
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ])
            ],
          ),
        );
      },
    );
  }
}
