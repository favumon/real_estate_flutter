import 'package:flutter/material.dart';

enum TabBarTab { search, message, home, favorite, profile }

class TabBarIcon extends StatefulWidget {
  final TabBarTab type;
  final bool isSelected;
  final Function(TabBarTab tab) onTabSelected;
  const TabBarIcon({super.key, required this.type, required this.isSelected, required this.onTabSelected});

  @override
  State<TabBarIcon> createState() => _TabBarIconState();
  
  //Function<void> onTabSelected;
}

class _TabBarIconState extends State<TabBarIcon> {
  double borderWidth = 0;
  double border2Width = 0;
    bool isSelected = false;

  @override
  Widget build(BuildContext context) {
   // if(widget.isSelected)
    isSelected=widget.isSelected;
    return GestureDetector(
      onTap: () => setState(() {
        borderWidth = 7;
      }),
      child: Container(
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xff232220)),
        child: AnimatedContainer(
          width: 50,
          height: 50,
          onEnd: () => setState(() {
            border2Width=0;
          }),
          duration: Duration(milliseconds: 300),
          // color: Colors.white,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color:border2Width==0?Colors.transparent: Colors.white,
                width: border2Width
              ),
              color: widget.isSelected && isSelected
                  ? Color(0xffFBA616)
                  : Color(0xffFBA616).withAlpha(0)),
          child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInQuint,
              onEnd: () {
                widget.onTabSelected(widget.type);
                setState(() {
                  borderWidth = 0;
                                          border2Width=3;

                  Future.delayed(Duration(milliseconds: 300)).then(
                    (value) {
                      setState(() {
                        isSelected = true;
                      });
                    },
                  );
                });
              },
              margin: EdgeInsets.all(borderWidth * 0.80),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: borderWidth == 0
                          ? Colors.transparent
                          : Colors.white.withOpacity(0.9),
                      width: borderWidth),
                  shape: BoxShape.circle,
                  color: Colors.transparent),
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
      return  Icons.favorite_rounded;
      case TabBarTab.home:
      return  Icons.home_filled;
      case TabBarTab.message:
      return  Icons.message_rounded;
      case TabBarTab.profile:
      return  Icons.person_rounded;
      case TabBarTab.search:
      return  Icons.search_rounded;
      default:
            return  Icons.home_filled;

    }
    
  }


}
