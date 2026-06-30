import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:core_sdk/core_sdk.dart';

class Loading extends StatelessWidget {
  final Color? color;
  final double? width;
  final double strokeWidth;
  final Color? cupertinoColor;

  const Loading({
    super.key,
    this.color,
    this.width,
    this.strokeWidth = 3.r,
    this.cupertinoColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid
          ? SizedBox(
              height: width?.r ?? 24.r,
              width: width?.r ?? 24.r,
              child: CircularProgressIndicator(
                color: color ?? AppStyle.primary,
                strokeWidth: strokeWidth,
              ),
            )
          : CupertinoActivityIndicator(
              radius: 12.r,
              color: cupertinoColor,
            ),
    );
  }
}
