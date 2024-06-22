import 'package:flutter/material.dart';
import 'package:real_estate_app/search_page/widgets/map_overlay_button.dart';
import 'package:real_estate_app/search_page/widgets/popup_list_tile.dart';

class WalletButton extends StatefulWidget {
      final Function(MapFilter) onChangeMapFilter;

  const WalletButton({super.key, required this.onChangeMapFilter});

  @override
  State<WalletButton> createState() => _WalletButtonState();
}

class _WalletButtonState extends State<WalletButton> {
  double popupHeight = 0;
  double popupWidth = 0;
  MapFilter selectedFilter = MapFilter.price;
  void togglePopup({bool show = true}) {
    setState(() {
      popupHeight = show ? 200 : 0;
      popupWidth = show ? 170 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        togglePopup(show: false);
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MapOverlayButton(
                    icon: Icons.wallet,
                    onButtonTaped: () {
                      togglePopup();
                    },
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffFBF5EB),
                ),
                height: popupHeight,
                width: popupWidth,
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      4,
                      (index) => PopupLisTile(
                        label: MapFilter.values[index],
                        isSelected: MapFilter.values[index] == selectedFilter,
                        onSelectMapFilter: (p0) {
                          selectedFilter = p0;
                          togglePopup(show: false);
                          widget.onChangeMapFilter(p0);
                        },
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum MapFilter {
  cosyAreas('Cosy areas', Icons.verified_user_outlined),
  price('Price', Icons.verified_user_outlined),
  infra('Infrastructure', Icons.verified_user_outlined),
  withoutLayer('Without any layer', Icons.verified_user_outlined);

  final String name;
  final IconData icon;
  const MapFilter(this.name, this.icon);
}
