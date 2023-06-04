import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class GuideBadge extends StatelessWidget {
  final Widget child;
  final String badgeText;

  const GuideBadge({Key? key, required this.child, required this.badgeText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeContent: Text(badgeText, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 10)),
      badgeColor: Colors.black,
      position: BadgePosition.topStart(top: -12),
      child: child,
    );
  }
}
