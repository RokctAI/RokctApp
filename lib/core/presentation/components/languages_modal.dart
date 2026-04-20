import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokctapp/customer/models/models.dart';
import 'package:rokctapp/core/infrastructure/utils/services.dart';
import 'package:rokctapp/customer/presentation/components/components.dart';
import 'package:rokctapp/core/application/language/language_provider.dart';

class LanguageScreen extends ConsumerStatefulWidget {
  final Function(LanguageData?)? afterUpdate;

  const LanguageScreen({super.key, required this.afterUpdate});

  @override
  ConsumerState<LanguageScreen> createState() => _LanguagePageState();
}

class _LanguagePageState extends ConsumerState<LanguageScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(languagesProvider.notifier).getLanguages(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isLtr = LocalStorage.getLangLtr();
    final event = ref.read(languagesProvider.notifier);
    final state = ref.watch(languagesProvider);
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDismisser(
        child: Container(
          decoration: BoxDecoration(
            color: AppStyle.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
          ),
          child: state.isLoading
              ? const SizedBox(height: 200, child: Loading())
              : SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ModalDrag(),
                      AppBarBottomSheet(
                        title: AppHelpers.getTranslation(TrKeys.language),
                      ),
                      24.verticalSpace,
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.list.length,
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return SelectItem(
                            onTap: () => event.change(index),
                            isActive: state.index == index,
                            title: state.list[index].title ?? '',
                          );
                        },
                      ),
                      24.verticalSpace,
                      CustomButton(
                        title: AppHelpers.getTranslation(TrKeys.save),
                        onPressed: () async {
                          await ref
                              .read(languagesProvider.notifier)
                              .makeSelectedLang(
                                context,
                                afterUpdate: widget.afterUpdate,
                              );
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        },
                      ),
                      36.verticalSpace,
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
