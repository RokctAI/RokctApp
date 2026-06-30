import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';
import 'package:${package}/presentation/theme/app_style.dart';
import 'package:${package}/infrastructure/services/utils/app_helpers.dart';
import 'package:${package}/infrastructure/services/utils/local_storage.dart';
import 'package:${package}/app_constants.dart';
import 'package:${package}/application/main/main_provider.dart';
import 'package:${package}/application/main/main_notifier.dart';
import 'package:${package}/presentation/components/keyboard_dismisser.dart';
import 'package:flutter_remix/flutter_remix.dart';
import '../../../widgets/bottom_navigator_item.dart';

class MainPageConfig {
  final List<IndexedStackChild> pages;
  final Widget? fab;
  final Widget? bottomExtras;
  final VoidCallback? onInit;

  MainPageConfig({
    required this.pages,
    this.fab,
    this.bottomExtras,
    this.onInit,
  });
}

@RoutePage()
class MainPage extends StatefulWidget {
  final MainPageConfig config;
  const MainPage({super.key, required this.config});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    widget.config.onInit?.call();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Consumer(
          builder: (context, ref, child) {
            final index = ref.watch(mainProvider).selectIndex;
            return ProsteIndexedStack(
              index: index,
              children: widget.config.pages,
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: widget.config.fab,
        bottomNavigationBar: widget.config.bottomExtras,
      ),
    );
  }
}
