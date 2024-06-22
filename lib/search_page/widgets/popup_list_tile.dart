import 'package:flutter/material.dart';

import 'wallet_button.dart';

class PopupLisTile extends StatelessWidget {
  final MapFilter label;
    final Function(MapFilter) onSelectMapFilter;
    final bool isSelected;

  const PopupLisTile({super.key, required this.label, required this.onSelectMapFilter, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelectMapFilter(label),
      child: FittedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.verified_user_outlined, color: isSelected?Color(0xffFCBB5F): Colors.black45,),
            SizedBox(width: 10,),
            Text(label.name,style: TextStyle(color: isSelected?Color(0xffFCBB5F): Colors.black45,),)
          ],
        ),
      ),
    );
  }
}