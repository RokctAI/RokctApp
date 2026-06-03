# API Reference: career_data_page

Source file: `lib/customer/presentation/pages/profile/careers/career_data_page.dart`

## Classes

### class `CareerDataPage`

## Whitelisted API Endpoints

### `CareerDataPage({super.key, required this.id}); @override ConsumerState<CareerDataPage> createState() => _CareerDataPageState(); } class _CareerDataPageState extends ConsumerState<CareerDataPage> { @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `CustomScaffold(body: (colors) => Column( children: [ CommonAppBar( child: Text( AppHelpers.getTranslation( state.selectedCareer?.translation?.title ?? "", ), style: AppStyle.interNoSemi(size: 18, color: colors.textBlack), ), ), 20.verticalSpace, state.isLoading ? Column(children: [200.verticalSpace, Loading()]) : ListView( padding: EdgeInsets.symmetric(horizontal: 20.r), shrinkWrap: true, children: [ Text( state.selectedCareer?.translation?.address ?? "", style: AppStyle.interNormal( size: 14, color: colors.textBlack, ), ), 12.verticalSpace, Html( data: state.selectedCareer?.translation?.description ?? "", style: {"body": Style(color: colors.textBlack)}, ), Container( margin: EdgeInsets.only(top: 16.h), padding: EdgeInsets.all(16.r), width: double.infinity, decoration: BoxDecoration( color: AppStyle.transparent, borderRadius: BorderRadius.circular(10.r), border: Border.all(color: AppStyle.textGrey), ), child: Column( children: [ Row( crossAxisAlignment: CrossAxisAlignment.start, children: [ SvgPicture.asset( "assets/svgs/contact.svg", colorFilter: ColorFilter.mode( colors.textBlack, BlendMode.srcIn, ), ), 20.horizontalSpace, Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( AppHelpers.getTranslation( TrKeys.stillHaveQuestions, ), style: AppStyle.interSemi( size: 14, color: colors.textBlack, ), ), 10.verticalSpace, SizedBox( width: MediaQuery.sizeOf(context).width / 1.5, child: Text( AppHelpers.getTranslation( TrKeys.cantFindTheAnswer, ), style: AppStyle.interRegular( size: 12, color: colors.textBlack, ), ), ), ], ), ], ), 16.verticalSpace, CustomButton( title: AppHelpers.getTranslation(TrKeys.helpCenter), background: AppStyle.black, textColor: AppStyle.white, onPressed: ()`
*No documentation provided (generation failed).*
