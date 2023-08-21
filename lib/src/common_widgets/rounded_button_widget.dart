import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../configs/configs.dart';
import '../utils/methods.dart';

class RoundedButtonWidget extends StatelessWidget {
  const RoundedButtonWidget({
    super.key,
    this.iconPadding = EdgeInsets.zero,
    this.icon,
    this.onTap,
    this.size,
  });

  final EdgeInsets? iconPadding;
  final IconData? icon;
  final VoidCallback? onTap;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(smPadding + 3.0),
      child: InkWell(
        onTap: onTap ?? back,
        borderRadius: BorderRadius.circular(defaultRadius * 5),
        child: Padding(
          padding: iconPadding!,
          child: Icon(
            icon ?? CupertinoIcons.back,
            color: primarySwatch,
            size: size,
          ),
        ),
      ),
    );
  }
}
