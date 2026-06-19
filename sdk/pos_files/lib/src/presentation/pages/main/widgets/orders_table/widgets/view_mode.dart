import 'package:admin_desktop/src/presentation/components/buttons/button_effect_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:admin_desktop/src/core/utils/utils.dart';
import 'package:admin_desktop/src/presentation/theme/theme.dart';

class ViewMode extends StatelessWidget {
  final String title;
  final bool isActive;
  final bool isLeft;
  final IconData? icon;
  final VoidCallback onTap;
  final double textSize;

  const ViewMode({
    super.key,
    required this.title,
    required this.isActive,
    this.isLeft = true,
    this.icon,
    required this.onTap,
    this.textSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(isLeft ? 12 : 0),
          right: Radius.circular(isLeft ? 0 : 12),
        ),
        child: InkWell(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(isLeft ? 12 : 0),
            right: Radius.circular(isLeft ? 0 : 12),
          ),
          onTap: onTap,
          child: Container(
            //  width: 120.w,
            padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 16.r),
            decoration: BoxDecoration(
              color: isActive ? AppStyle.primary : AppStyle.transparent,
              border: Border.all(
                color: isActive ? AppStyle.primary : AppStyle.border,
              ),
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(isLeft ? 12 : 0),
                right: Radius.circular(isLeft ? 0 : 12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon != null
                    ? Icon(
                        icon,
                        color: isActive ? AppStyle.white : AppStyle.reviewText,
                        size: 20,
                      )
                    : const SizedBox.shrink(),
                icon != null ? 14.horizontalSpace : SizedBox.shrink(),
                Text(
                  AppHelpers.getTranslation(title),
                  style: AppStyle.interNormal(
                    size: textSize,
                    color: isActive
                        ? AppStyle.buttonFontColor
                        : AppStyle.reviewText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
