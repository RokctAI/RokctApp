import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokctapp/customer/models/response/pages_response.dart';
import 'package:rokctapp/customer/application/profile/profile_provider.dart';
import 'package:rokctapp/core/infrastructure/utils/app_helpers.dart';
import 'package:rokctapp/core/infrastructure/constants/tr_keys.dart';
import 'package:rokctapp/core/presentation/theme/theme.dart';
import 'package:rokctapp/core/presentation/theme/color_set.dart';

import 'package:rokctapp/customer/presentation/components/components.dart';

class AboutPage extends ConsumerStatefulWidget {
  const AboutPage({super.key});

  @override
  ConsumerState<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends ConsumerState<AboutPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((s) {
      ref.read(profileProvider.notifier).getAbout();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileProvider);
    return CustomScaffold(
      body: (colors) => ListView(
        children: [
          CommonAppBar(
            child: Text(
              AppHelpers.getTranslation(TrKeys.about),
              style: AppStyle.interNoSemi(size: 18, color: colors.textBlack),
            ),
          ),
          12.verticalSpace,
          state.isLoading
              ? Column(children: [200.verticalSpace, Loading()])
              : ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 20.r),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.about.length,
                  itemBuilder: (context, index) {
                    return _aboutItem(state.about[index], colors);
                  },
                ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: (colors) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: const PopButton(),
      ),
    );
  }

  Widget _aboutItem(PageData data, CustomColorSet colors) {
    return Column(
      children: [
        CustomNetworkImage(url: data.img, radius: 12, height: 320, width: 250),
        20.verticalSpace,
        Text(
          data.translation?.title ?? "",
          style: AppStyle.interSemi(color: colors.textBlack),
        ),
        12.verticalSpace,
        Html(
          data: data.translation?.description ?? "",
          style: {
            "body": Style(color: colors.textBlack, fontSize: FontSize(14.sp)),
          },
        ),
      ],
    );
  }
}

