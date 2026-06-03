# API Reference: blog_page

Source file: `lib/customer/presentation/pages/profile/blog_page.dart`

## Classes

### class `BlogPage`

## Whitelisted API Endpoints

### `BlogPage({super.key}); @override ConsumerState<BlogPage> createState() => _BlogPageState(); } class _BlogPageState extends ConsumerState<BlogPage> { @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `CustomScaffold(body: (colors) => Column( children: [ CommonAppBar( child: Text( AppHelpers.getTranslation(TrKeys.blogs), style: AppStyle.interNoSemi(size: 18, color: colors.textBlack), ), ), state.isLoading ? Column(children: [200.verticalSpace, Loading()]) : ListView.builder( padding: EdgeInsets.symmetric( horizontal: 20.r, vertical: 10.r, ), itemCount: state.blogs.length, shrinkWrap: true, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `InkWell(onTap: ()`
*No documentation provided (generation failed).*
