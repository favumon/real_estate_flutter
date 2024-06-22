import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/constants.dart';

class UserAvatar extends StatefulWidget {
  const UserAvatar({super.key});

  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  double _avatarSize = 30;

  @override
  void initState() {
    super.initState();
    Future.delayed(animationDelaySmall).then((value) => setState(() {
          _avatarSize = 60;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: animationDuration,
        height: _avatarSize,
        width: _avatarSize,
        child: Image.asset('assets/images/avatar.png'));
  }
}
