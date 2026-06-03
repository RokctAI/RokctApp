# API Reference: banner_three

Source file: `lib/customer/presentation/pages/home/home_three/banner_three.dart`

## Classes

### class `BannerThree`

## Whitelisted API Endpoints

### `BannerThree({ super.key, required this.bannerController, required this.pageController, required this.banners, required this.notifier, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Column(children: [ Container( height: banners.isNotEmpty ? 160.h : 0, margin: EdgeInsets.only(bottom: banners.isNotEmpty ? 8.h : 0), child: SmartRefresher( scrollDirection: Axis.horizontal, enablePullDown: false, enablePullUp: true, controller: bannerController, onLoading: () async { await notifier.fetchBannerPage(context, bannerController); }, child: AnimationLimiter( child: PageView.builder( controller: pageController, scrollDirection: Axis.horizontal, itemCount: banners.length, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: BannerItemThree(banner: banners[index]), ), ), ); }, ), ), ), ), if (banners.length > 2) SizedBox( height: 8.r, child: SmoothPageIndicator( controller: pageController, count: banners.length, effect: ExpandingDotsEffect( expansionFactor: 2.2, dotWidth: 8.r, strokeWidth: 10.r, dotHeight: 4.r, activeDotColor: AppStyle.black, dotColor: AppStyle.dot, paintStyle: PaintingStyle.fill, ), onDotClicked: (index)`
*No documentation provided (generation failed).*
