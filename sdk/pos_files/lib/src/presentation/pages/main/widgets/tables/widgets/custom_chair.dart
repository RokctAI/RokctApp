import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:admin_desktop/src/core/constants/constants.dart';
import 'package:admin_desktop/src/presentation/theme/theme.dart';

import '../../../../../../core/utils/utils.dart';

class CustomChair extends StatelessWidget {
  final ChairPosition chairPosition;
  final double borderRadiusSize;
  final double chairSpace;
  final double chairHeight;
  final double chairWidth;

  const CustomChair({
    super.key,
    required this.chairPosition,
    this.borderRadiusSize = 16,
    this.chairHeight = 24,
    this.chairWidth = 64,
    required this.chairSpace,
  });

  @override
  Widget build(BuildContext context) {
    ChairPosition position = chairPosition;
    if (chairPosition == ChairPosition.left && !LocalStorage.getLangLtr()) {
      position = ChairPosition.right;
    }
    if (chairPosition == ChairPosition.right && !LocalStorage.getLangLtr()) {
      position = ChairPosition.left;
    }

    return Container(
      margin: position == ChairPosition.top || position == ChairPosition.bottom
          ? EdgeInsets.only(left: chairSpace.r)
          : position == ChairPosition.left || position == ChairPosition.right
          ? EdgeInsets.only(top: chairSpace.r)
          : null,
      height: position == ChairPosition.top || position == ChairPosition.bottom
          ? chairHeight.r
          : chairWidth.r,
      width: position == ChairPosition.top || position == ChairPosition.bottom
          ? chairWidth.r
          : chairHeight.r,
      decoration: BoxDecoration(
        color: AppStyle.white,
        borderRadius: BorderRadius.only(
          topLeft:
              position == ChairPosition.top || position == ChairPosition.left
              ? Radius.circular(borderRadiusSize.r)
              : Radius.zero,
          topRight:
              position == ChairPosition.top || position == ChairPosition.right
              ? Radius.circular(borderRadiusSize.r)
              : Radius.zero,
          bottomLeft:
              position == ChairPosition.bottom || position == ChairPosition.left
              ? Radius.circular(borderRadiusSize.r)
              : Radius.zero,
          bottomRight:
              position == ChairPosition.bottom ||
                  position == ChairPosition.right
              ? Radius.circular(borderRadiusSize.r)
              : Radius.zero,
        ),
      ),
    );
  }
}

class VerticalChair extends StatelessWidget {
  final ChairPosition chairPosition;
  final double borderRadiusSize;
  final double chairSpace;
  final double chairHeight;

  const VerticalChair({
    super.key,
    required this.chairPosition,
    this.borderRadiusSize = 16,
    this.chairHeight = 24,
    required this.chairSpace,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          chairPosition == ChairPosition.top ||
              chairPosition == ChairPosition.bottom
          ? EdgeInsets.only(left: chairSpace.r)
          : chairPosition == ChairPosition.left ||
                chairPosition == ChairPosition.right
          ? EdgeInsets.only(top: chairSpace.r)
          : null,
      height:
          chairPosition == ChairPosition.top ||
              chairPosition == ChairPosition.bottom
          ? chairHeight.r
          : null,
      width:
          chairPosition == ChairPosition.top ||
              chairPosition == ChairPosition.bottom
          ? null
          : chairHeight.r,
      decoration: BoxDecoration(
        color: AppStyle.white,
        borderRadius: BorderRadius.only(
          topLeft:
              chairPosition == ChairPosition.top ||
                  chairPosition == ChairPosition.left
              ? Radius.circular(borderRadiusSize.r)
              : Radius.zero,
          topRight:
              chairPosition == ChairPosition.top ||
                  chairPosition == ChairPosition.right
              ? Radius.circular(borderRadiusSize.r)
              : Radius.zero,
          bottomLeft:
              chairPosition == ChairPosition.bottom ||
                  chairPosition == ChairPosition.left
              ? Radius.circular(borderRadiusSize.r)
              : Radius.zero,
          bottomRight:
              chairPosition == ChairPosition.bottom ||
                  chairPosition == ChairPosition.right
              ? Radius.circular(borderRadiusSize.r)
              : Radius.zero,
        ),
      ),
    );
  }
}
