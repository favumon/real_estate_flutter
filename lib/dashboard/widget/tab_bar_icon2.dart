import 'package:flutter/material.dart';

enum TabBarTab { search, message, home, favorite, profile }

class TabBarIcon extends StatefulWidget {
  final TabBarTab type;
  final bool isSelected;
  final Function(TabBarTab tab) onTabSelected;
  const TabBarIcon(
      {super.key,
      required this.type,
      required this.isSelected,
      required this.onTabSelected});

  @override
  State<TabBarIcon> createState() => _TabBarIconState();

  //Function<void> onTabSelected;
}

class _TabBarIconState extends State<TabBarIcon> {
  double borderWidth = 0;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    isSelected = widget.isSelected;
    return GestureDetector(
      onTap: () => setState(() {
        borderWidth = 7;
      }),
      child: SizedBox(
        height: 48,
        width: 48,
        child: AnimatedContainer(
          margin: EdgeInsets.all(borderWidth * 0.9),
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isSelected && widget.isSelected
                ? const Color(0xffFBA616)
                : const Color(0xff232220),
            border: Border.all(
                color: borderWidth == 0 ? Colors.transparent : Colors.white,
                width: borderWidth*.1),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(1),
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.ease,
              onEnd: () {
                setState(() {
                  isSelected = true;
                  borderWidth = 0;
                });

                Future.delayed(const Duration(milliseconds: 100)).then(
                  (value) {
                    widget.onTabSelected(widget.type);
                  },
                );
                // });
              },
              decoration: BoxDecoration(
                border: Border.all(
                    color: borderWidth == 0
                        ? Colors.transparent
                        : Colors.white.withOpacity(0.9),
                    width: borderWidth * 0.85),
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.type.fromTabType(),
                color: Colors.white,
                size: 20,
              )),
        ),
      ),
    );
  }
}

extension TabIcon on TabBarTab {
  IconData fromTabType() {
    switch (this) {
      case TabBarTab.favorite:
        return Icons.favorite_rounded;
      case TabBarTab.home:
        return Icons.home_filled;
      case TabBarTab.message:
        return Icons.message_rounded;
      case TabBarTab.profile:
        return Icons.person_rounded;
      case TabBarTab.search:
        return Icons.search_rounded;
      default:
        return Icons.home_filled;
    }
  }
}
