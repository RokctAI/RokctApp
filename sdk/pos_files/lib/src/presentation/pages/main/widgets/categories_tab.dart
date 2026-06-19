import 'package:admin_desktop/src/core/constants/constants.dart';
import 'package:admin_desktop/src/presentation/components/category_tab_bar_item.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/utils.dart';
import '../../../../models/models.dart';
import '../../../theme/theme.dart';
import '../riverpod/provider/main_provider.dart';

class CategoriesTab extends ConsumerWidget {
  final String title;
  final List<CategoryData> categories;
  final ValueChanged<CategoryData?> onSelect;
  final CategoryData? selectedCategory;
  final CategoryData? selectedMainCategory;

  const CategoriesTab({
    super.key,
    required this.title,
    required this.categories,
    required this.onSelect,
    required this.selectedCategory,
    required this.selectedMainCategory,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSub = selectedMainCategory?.children?.isNotEmpty ?? false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        categories.isEmpty
            ? const SizedBox.shrink()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                            color: AppStyle.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          height: 52.r,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                if (isSub)
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.r),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () => ref
                                              .read(mainProvider.notifier)
                                              .setSelectedMainCategory(
                                                context,
                                                null,
                                              ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                FlutterRemix.arrow_left_s_line,
                                                size: 24,
                                              ),
                                              Text(
                                                AppHelpers.getTranslation(
                                                  TrKeys.back,
                                                ),
                                                style: AppStyle.interNormal(
                                                  size: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: categories.length + 1,
                                  itemBuilder: (context, index) {
                                    return index == 0
                                        ? CategoryTabBarItem(
                                            isActive:
                                                selectedCategory == null ||
                                                (selectedCategory
                                                        ?.children
                                                        ?.isNotEmpty ??
                                                    false),
                                            onTap: () => onSelect.call(
                                              isSub
                                                  ? selectedMainCategory
                                                  : null,
                                            ),
                                            title: AppHelpers.getTranslation(
                                              TrKeys.all,
                                            ),
                                          )
                                        : Builder(
                                            builder: (context) {
                                              final category =
                                                  categories[index - 1];
                                              return CategoryTabBarItem(
                                                isActive:
                                                    category.id ==
                                                    selectedCategory?.id,
                                                onTap: () =>
                                                    onSelect.call(category),
                                                title:
                                                    category.translation?.title,
                                                isHaveChildren:
                                                    category
                                                        .children
                                                        ?.isNotEmpty ??
                                                    false,
                                              );
                                            },
                                          );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      12.horizontalSpace,
                    ],
                  ),
                ],
              ),
      ],
    );
  }
}
