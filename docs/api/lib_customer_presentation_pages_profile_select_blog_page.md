# API Reference: select_blog_page

Source file: `lib/customer/presentation/pages/profile/select_blog_page.dart`

## Classes

### class `SelectBlogPage`

## Whitelisted API Endpoints

### `SelectBlogPage({ super.key, required this.blogUuid, required this.colors, }); @override ConsumerState<SelectBlogPage> createState() => _SelectBlogPageState(); } class _SelectBlogPageState extends ConsumerState<SelectBlogPage> { @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Scaffold(backgroundColor: colors.backgroundColor, body: Column( children: [ CommonAppBar( child: Text( AppHelpers.getTranslation( state.selectBlog?.translation?.title ?? "", ), style: AppStyle.interNoSemi(size: 18, color: colors.textBlack), ), ), state.isLoading ? Column(children: [200.verticalSpace, Loading()]) : ListView( padding: EdgeInsets.symmetric( horizontal: 20.r, vertical: 10.r, ), shrinkWrap: true, children: [ Text( state.selectBlog?.translation?.title ?? "", style: AppStyle.interSemi( size: 14, color: colors.textBlack, ), ), 16.verticalSpace, if (state.selectBlog?.img != null) CustomNetworkImage( url: state.selectBlog!.img!, height: 200.h, width: double.infinity, fit: BoxFit.cover, radius: 12, ), 12.verticalSpace, CustomButton( title: "Share", icon: Icon(FlutterRemix.share_line), background: AppStyle.black, textColor: AppStyle.white, onPressed: ()`
*No documentation provided (generation failed).*
