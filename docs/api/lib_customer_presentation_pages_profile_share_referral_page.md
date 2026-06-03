# API Reference: share_referral_page

Source file: `lib/customer/presentation/pages/profile/share_referral_page.dart`

## Classes

### class `ShareReferralPage`

## Whitelisted API Endpoints

### `ShareReferralPage({super.key}); @override ConsumerState<ShareReferralPage> createState() => _ShareReferralPageState(); } class _ShareReferralPageState extends ConsumerState<ShareReferralPage> { late RefreshController controller; final bool isLtr = LocalStorage.getLangLtr(); @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: CustomScaffold( body: (colors) => Column( children: [ CommonAppBar( child: Text( AppHelpers.getTranslation(TrKeys.referral), style: AppStyle.interNoSemi(size: 18, color: colors.textBlack), ), ), state.isReferralLoading ? Column(children: [200.verticalSpace, const Loading()]) : Padding( padding: EdgeInsets.all(16.r), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ if (!DateTime.parse( state.referralData?.expiredAt ?? DateTime.now().toString(), ).isBefore(DateTime.now())) Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ SizedBox( height: 200.h, width: double.infinity, child: CustomNetworkImage( url: state.referralData?.img ?? "", height: 42.r, width: 42.r, radius: 8.r, ), ), Text( state.referralData?.translation?.title ?? "", style: AppStyle.interNoSemi( size: 20, color: colors.textBlack, ), ), 16.verticalSpace, GestureDetector( onTap: ()`
*No documentation provided (generation failed).*
