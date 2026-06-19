import 'package:admin_desktop/src/core/constants/constants.dart';
import 'package:admin_desktop/src/presentation/components/custom_scaffold.dart';
import 'package:admin_desktop/src/presentation/pages/main/riverpod/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/utils.dart';
import '../../../theme/theme.dart';
import 'categories_tab.dart';
import 'orders_table/widgets/view_mode.dart';
import 'products_list.dart';
import 'right_side/right_side.dart';
import 'tables/widgets/custom_refresher.dart';

class PostPage extends ConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(mainProvider);
    final notifier = ref.read(mainProvider.notifier);
    return CustomScaffold(
      body: (colors) => Padding(
        padding: REdgeInsets.only(left: 16, right: 16, top: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          AppHelpers.getTranslation(TrKeys.categories),
                          style: AppStyle.interNormal(size: 14),
                        ),
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          ViewMode(
                            title: TrKeys.products,
                            isActive: !state.isCombo,
                            textSize: 14,
                            onTap: () {
                              notifier.changeCombo(false);
                              notifier.setSelectedMainCategory(context, null);
                            },
                          ),
                          ViewMode(
                            title: TrKeys.combo,
                            isActive: state.isCombo,
                            textSize: 14,
                            isLeft: false,
                            onTap: () {
                              notifier.changeCombo(true);
                              notifier.setSelectedMainCategory(context, null);
                            },
                          ),
                          12.horizontalSpace,
                          CustomRefresher(
                            onTap: () {
                              notifier.fetchProducts(context, isRefresh: true);
                              notifier.fetchComboProducts(
                                context: context,
                                isRefresh: true,
                              );
                            },
                            isLoading: state.isProductsLoading,
                          ),
                          10.horizontalSpace,
                        ],
                      ),
                    ],
                  ),
                  8.verticalSpace,
                  !state.isCombo
                      ? Row(
                          children: [
                            Expanded(
                              child: CategoriesTab(
                                title: TrKeys.categories,
                                categories:
                                    (state
                                            .selectedMainCategory
                                            ?.children
                                            ?.isNotEmpty ??
                                        false)
                                    ? state.selectedMainCategory!.children!
                                    : state.categories,
                                selectedCategory: state.selectedCategory,
                                selectedMainCategory:
                                    state.selectedMainCategory,
                                onSelect: (value) {
                                  if (value?.type == 'main') {
                                    notifier.setSelectedMainCategory(
                                      context,
                                      value,
                                    );
                                  } else {
                                    notifier.setSelectedCategory(
                                      context,
                                      value,
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      : CategoriesTab(
                          title: TrKeys.comboCategories,
                          categories: state.comboCategories,
                          selectedCategory: state.selectedCategory,
                          onSelect: (value) {
                            notifier.setSelectedCategory(context, value);
                          },
                          selectedMainCategory: state.selectedMainCategory,
                        ),
                  4.verticalSpace,
                  Expanded(child: ProductsList(colors: colors)),
                ],
              ),
            ),
            16.horizontalSpace,
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 3.2,
              child: const RightSide(),
            ),
          ],
        ),
      ),
    );
  }
}
