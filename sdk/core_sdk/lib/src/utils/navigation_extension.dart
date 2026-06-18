import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

extension NavigationContext on BuildContext {
  void replaceRouteNamed(String routeName) {
    this.router.replacePath(routeName);
  }

  void pushRouteNamed(String routeName) {
    this.router.pushPath(routeName);
  }

  Future<bool> popRoute() async {
    return this.router.maybePop();
  }
}
