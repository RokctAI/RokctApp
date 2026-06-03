# API Reference: story_page

Source file: `lib/core/presentation/pages/story_page/story_page.dart`

## Classes

### class `StoryListPage`

### class `StoryPage`

## Whitelisted API Endpoints

### `StoryListPage({ super.key, required this.index, required this.controller, }); @override State<StoryListPage> createState() => _StoryListPageState(); } class _StoryListPageState extends State<StoryListPage> { PageController? pageController; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Consumer(builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 500), curve: Curves.easeIn, ); setState(()`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 500), curve: Curves.easeIn, ); setState(()`
*No documentation provided (generation failed).*

### `Duration(seconds: 7)) ..addListener(()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Stack(children: [ CachedNetworkImage( imageUrl: widget.story?[currentIndex]?.url ?? "", width: MediaQuery.sizeOf(context).width, height: MediaQuery.sizeOf(context).height, fit: BoxFit.cover, imageBuilder: (context, image)`
*No documentation provided (generation failed).*

### `Stack(key: imageKey, children: [ Container( width: double.infinity, height: double.infinity, decoration: BoxDecoration( image: DecorationImage(image: image, fit: BoxFit.fitWidth), ), ), Align( alignment: Alignment.topCenter, child: SafeArea( child: Container( height: 4.h, color: AppStyle.transparent, width: MediaQuery.sizeOf(context).width, margin: EdgeInsets.only(left: 20.w, top: 10.h), child: ListView.builder( scrollDirection: Axis.horizontal, itemCount: widget.story?.length ?? 0, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `AnimatedContainer(margin: EdgeInsets.only(right: 8.w), height: 4.h, width: (MediaQuery.sizeOf(context).width - (36.w + ((widget.story!.length == 1 ? widget.story!.length : (widget.story!.length - 1)) * 8.w))) / widget.story!.length, decoration: BoxDecoration( color: currentIndex >= index ? AppStyle.primary : AppStyle.white, borderRadius: BorderRadius.all( Radius.circular(122.r), ), ), duration: const Duration(milliseconds: 500), child: currentIndex == index ? ClipRRect( borderRadius: BorderRadius.all( Radius.circular(122.r), ), child: LinearProgressIndicator( value: controller.value, valueColor: AlwaysStoppedAnimation<Color>( AppStyle.primary, ), backgroundColor: AppStyle.white, ), ) : currentIndex > index ? ClipRRect( borderRadius: BorderRadius.all( Radius.circular(122.r), ), child: LinearProgressIndicator( value: 1, valueColor: AlwaysStoppedAnimation<Color>( AppStyle.primary, ), backgroundColor: AppStyle.white, ), ) : const SizedBox.shrink(), ); }, ), ), ), ), ], ); }, progressIndicatorBuilder: (context, url, progress)`
*No documentation provided (generation failed).*

### `Loading(); }, errorWidget: (context, url, error)`
*No documentation provided (generation failed).*

### `Stack(children: [ Container( decoration: BoxDecoration( color: AppStyle.textGrey, borderRadius: BorderRadius.all(Radius.circular(16.r)), ), alignment: Alignment.center, child: Column( mainAxisAlignment: MainAxisAlignment.center, children: [ Icon( FlutterRemix.image_line, color: AppStyle.white, size: 32.r, ), 8.verticalSpace, Text( AppHelpers.getTranslation(TrKeys.notFound), style: AppStyle.interNormal(color: AppStyle.white), ), ], ), ), Align( alignment: Alignment.topCenter, child: SafeArea( child: Container( height: 4.h, color: AppStyle.transparent, width: MediaQuery.sizeOf(context).width, margin: EdgeInsets.only(left: 20.w, top: 10.h), child: ListView.builder( scrollDirection: Axis.horizontal, itemCount: widget.story?.length ?? 0, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `AnimatedContainer(margin: EdgeInsets.only(right: 8.w), height: 4.h, width: (MediaQuery.sizeOf(context).width - (36.w + ((widget.story!.length == 1 ? widget.story!.length : (widget.story!.length - 1)) * 8.w))) / widget.story!.length, decoration: BoxDecoration( color: currentIndex >= index ? AppStyle.primary : AppStyle.white, borderRadius: BorderRadius.circular(122.r), ), duration: const Duration(milliseconds: 500), child: currentIndex == index ? ClipRRect( borderRadius: BorderRadius.circular(122.r), child: LinearProgressIndicator( value: controller.value, valueColor: AlwaysStoppedAnimation<Color>( AppStyle.primary, ), backgroundColor: AppStyle.white, ), ) : currentIndex > index ? ClipRRect( borderRadius: BorderRadius.all( Radius.circular(122.r), ), child: LinearProgressIndicator( value: 1, valueColor: AlwaysStoppedAnimation<Color>( AppStyle.primary, ), backgroundColor: AppStyle.white, ), ) : const SizedBox.shrink(), ); }, ), ), ), ), ], ); }, ), Row( children: [ GestureDetector( onLongPressStart: (s)`
*No documentation provided (generation failed).*

### `Spacer(), GestureDetector( onTap: ()`
*No documentation provided (generation failed).*

### `Icon(Icons.close, color: AppStyle.white), ), ), ), ], ), ), ), ), Align( alignment: Alignment.bottomCenter, child: SafeArea( child: Padding( padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 32.h), child: CustomButton( title: AppHelpers.getTranslation(TrKeys.order), onPressed: ()`
*No documentation provided (generation failed).*
