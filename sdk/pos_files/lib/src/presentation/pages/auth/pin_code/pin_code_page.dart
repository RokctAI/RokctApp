// ignore_for_file: unrelated_type_equality_checks

import 'package:admin_desktop/generated/assets.dart';
import 'package:admin_desktop/src/core/constants/constants.dart';
import 'package:admin_desktop/src/core/routes/app_router.dart';
import 'package:admin_desktop/src/core/utils/app_helpers.dart';
import 'package:admin_desktop/src/presentation/components/login_button.dart';
import 'package:admin_desktop/src/presentation/pages/auth/pin_code/riverpod/provider/pin_code_provider.dart';
import 'package:admin_desktop/src/presentation/theme/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:admin_desktop/src/core/utils/local_storage.dart';
import 'components/pin_button.dart';
import 'components/pin_container.dart';

@RoutePage()
class PinCodePage extends ConsumerStatefulWidget {
  final bool isNewPassword;

  const PinCodePage(this.isNewPassword, {super.key});

  @override
  ConsumerState<PinCodePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends ConsumerState<PinCodePage> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  final Map<LogicalKeyboardKey, String> numberKeys = {
    LogicalKeyboardKey.digit0: '0',
    LogicalKeyboardKey.digit1: '1',
    LogicalKeyboardKey.digit2: '2',
    LogicalKeyboardKey.digit3: '3',
    LogicalKeyboardKey.digit4: '4',
    LogicalKeyboardKey.digit5: '5',
    LogicalKeyboardKey.digit6: '6',
    LogicalKeyboardKey.digit7: '7',
    LogicalKeyboardKey.digit8: '8',
    LogicalKeyboardKey.digit9: '9',

    LogicalKeyboardKey.numpad0: '0',
    LogicalKeyboardKey.numpad1: '1',
    LogicalKeyboardKey.numpad2: '2',
    LogicalKeyboardKey.numpad3: '3',
    LogicalKeyboardKey.numpad4: '4',
    LogicalKeyboardKey.numpad5: '5',
    LogicalKeyboardKey.numpad6: '6',
    LogicalKeyboardKey.numpad7: '7',
    LogicalKeyboardKey.numpad8: '8',
    LogicalKeyboardKey.numpad9: '9',
  };

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(pinCodeProvider.notifier);
    final state = ref.watch(pinCodeProvider);
    return Scaffold(
      body: RawKeyboardListener(
        focusNode: _focusNode,
        autofocus: true,
        onKey: (event) {
          if (event is RawKeyDownEvent) {
            final key = event.logicalKey;

            if (numberKeys.containsKey(key)) {
              if (widget.isNewPassword) {
                notifier.setNewPinCode(
                  code: numberKeys[key]!,
                  onSuccess: () {
                    context.replaceRoute(const MainRoute());
                  },
                );
              } else {
                notifier.setPinCode(
                  code: numberKeys[key]!,
                  onSuccess: () {
                    context.replaceRoute(const MainRoute());
                  },
                );
              }
            }

            if (key == LogicalKeyboardKey.backspace) {
              notifier.removePinCode();
            }

            // if (key == LogicalKeyboardKey.enter ||
            //     key == LogicalKeyboardKey.numpadEnter) {
            //   onSubmit();
            // }
          }
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 500.r),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      28.verticalSpace,
                      Row(
                        children: [
                          36.horizontalSpace,
                          Text(
                            AppHelpers.getAppName(),
                            style: GoogleFonts.inter(
                              color: AppStyle.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp,
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Column(
                          children: [
                            60.verticalSpace,
                            Text(
                              AppHelpers.getTranslation(
                                widget.isNewPassword
                                    ? TrKeys.enterNewPinCode
                                    : state.isPinCodeNotValid == false
                                    ? TrKeys.enterPinCode
                                    : TrKeys.enterPinCodeError,
                              ),
                              style: GoogleFonts.inter(
                                color: state.isPinCodeNotValid == false
                                    ? AppStyle.black
                                    : AppStyle.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 28.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            12.verticalSpace,
                            Text(
                              AppHelpers.getTranslation(
                                state.isPinCodeNotValid == false
                                    ? TrKeys.pinCodeDesc
                                    : TrKeys.pinCodeDescError,
                              ),
                              style: GoogleFonts.inter(
                                color: state.isPinCodeNotValid == false
                                    ? AppStyle.black
                                    : AppStyle.red,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                            24.verticalSpace,
                            SizedBox(
                              height: 28.r,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 4,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return PinContainer(
                                    isActive: state.pinCode.length > index,
                                  );
                                },
                              ),
                            ),
                            GridView.builder(
                              padding: EdgeInsets.symmetric(
                                vertical: 24.r,
                                horizontal: 68.r,
                              ),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 12,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 28.r,
                                    mainAxisSpacing: 24.r,
                                    mainAxisExtent: 72.r,
                                  ),
                              itemBuilder: (context, index) {
                                return PinButton(
                                  title: index != 9 && index != 11
                                      ? AppHelpers.getPinCodeText(index)
                                      : null,
                                  iconData: index == 9
                                      ? FlutterRemix.close_circle_line
                                      : index == 11
                                      ? FlutterRemix.delete_back_2_line
                                      : null,
                                  onTap: () {
                                    if (index == 9) {
                                      notifier.clearPinCode();
                                    } else if (index == 11) {
                                      notifier.removePinCode();
                                    } else {
                                      if (widget.isNewPassword) {
                                        notifier.setNewPinCode(
                                          code: AppHelpers.getPinCodeText(
                                            index,
                                          ),
                                          onSuccess: () {
                                            context.replaceRoute(
                                              const MainRoute(),
                                            );
                                          },
                                        );
                                      } else {
                                        notifier.setPinCode(
                                          code: AppHelpers.getPinCodeText(
                                            index,
                                          ),
                                          onSuccess: () {
                                            context.replaceRoute(
                                              const MainRoute(),
                                            );
                                          },
                                        );
                                      }
                                    }
                                  },
                                );
                              },
                            ),
                            24.verticalSpace,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 48.r),
                              child: LoginButton(
                                title: AppHelpers.getTranslation(
                                  widget.isNewPassword
                                      ? TrKeys.save
                                      : TrKeys.apply,
                                ),
                                onPressed: () {
                                  if (widget.isNewPassword) {
                                    notifier.checkNewCode(
                                      onSuccess: () {
                                        context.replaceRoute(const MainRoute());
                                      },
                                    );
                                  } else {
                                    notifier.checkCode(
                                      onSuccess: () {
                                        context.replaceRoute(const MainRoute());
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                            if (!widget.isNewPassword)
                              Column(
                                children: [
                                  12.verticalSpace,
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 48.r,
                                    ),
                                    child: LoginButton(
                                      bgColor: AppStyle.transparent,
                                      titleColor: AppStyle.black,
                                      title: AppHelpers.getTranslation(
                                        TrKeys.logout,
                                      ),
                                      onPressed: () {
                                        context.replaceRoute(
                                          const LoginRoute(),
                                        );
                                        LocalStorage.clearStore();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Image.asset(
                  Assets.pngManImage,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
