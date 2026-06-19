import 'package:admin_desktop/src/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'buttons/button_effect_animation.dart';

class CategoryTabBarItem extends StatelessWidget {
  final String? title;
  final bool isActive;
  final bool isHaveChildren;
  final Function() onTap;

  const CategoryTabBarItem({
    super.key,
    this.title,
    required this.isActive,
    this.isHaveChildren = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      child: GestureDetector(
        onTap: isActive ? null : onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 36.r,
          decoration: BoxDecoration(
            color: isActive ? AppStyle.primary : AppStyle.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: AppStyle.white.withOpacity(0.07),
                spreadRadius: 0,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 18.r),
          margin: EdgeInsets.only(right: 8.r),
          child: Row(
            children: [
              Text(
                '$title',
                style: AppStyle.interNormal(
                  size: 12,
                  color: isActive ? AppStyle.buttonFontColor : AppStyle.black,
                ),
              ),
              if (isHaveChildren)
                Icon(
                  FlutterRemix.arrow_down_s_line,
                  color: isActive ? AppStyle.white : AppStyle.black,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
