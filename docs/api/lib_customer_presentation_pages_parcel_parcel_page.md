# API Reference: parcel_page

Source file: `lib/customer/presentation/pages/parcel/parcel_page.dart`

## Classes

### class `ParcelPage`

## Whitelisted API Endpoints

### `ParcelPage({super.key}); @override ConsumerState<ParcelPage> createState() => _ParcelPageState(); } class _ParcelPageState extends ConsumerState<ParcelPage> { final TextEditingController fromUsername = TextEditingController( text: LocalStorage.getUser()?.firstname ?? '', ); final TextEditingController fromPhone = TextEditingController( text: LocalStorage.getUser()?.phone ?? '', ); final TextEditingController fromHouse = TextEditingController(); final TextEditingController fromFloor = TextEditingController(); final TextEditingController toUsername = TextEditingController(); final TextEditingController toPhone = TextEditingController(); final TextEditingController toHouse = TextEditingController(); final TextEditingController toFloor = TextEditingController(); final TextEditingController note = TextEditingController(); final TextEditingController comment = TextEditingController(); final TextEditingController itemValue = TextEditingController(); final TextEditingController instruction = TextEditingController(); final GlobalKey<FormState> formKey = GlobalKey<FormState>(); @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `CustomScaffold(body: (colors) => KeyboardDismisser( child: Column( children: [ CommonAppBar( child: Text( AppHelpers.getTranslation(TrKeys.doorToDoor), style: AppStyle.interNoSemi(size: 18, color: colors.textBlack), ), ), AppHelpers.getParcel() ? Expanded( child: ListView( padding: EdgeInsets.only(top: 16.r), shrinkWrap: true, children: [ Container( color: colors.backgroundColor, padding: EdgeInsets.all(16.r), child: Form( key: formKey, child: Column( children: [ Row( children: [ Expanded( child: Column( children: [ SenderWidget( state: state, event: event, username: fromUsername, phone: fromPhone, house: fromHouse, flour: fromFloor, comment: comment, colors: colors, ), 10.verticalSpace, RecipientWidget( state: state, event: event, username: toUsername, phone: toPhone, house: toHouse, flour: toFloor, description: note, addInstruction: instruction, value: itemValue, colors: colors, ), ], ), ), if (state.addressTo != null && state.addressFrom != null && !state.expand) InkWell( onTap: () => event.switchAddress( context: context, ), child: const Padding( padding: EdgeInsets.all(8.0), child: Icon( FlutterRemix.arrow_up_down_line, ), ), ), ], ), 10.verticalSpace, if (state.expand) CustomButton( icon: const Icon( FlutterRemix.wallet_2_line, color: AppStyle.black, ), background: AppStyle.bgGrey, isLoading: state.isButtonLoading, title: AppHelpers.getTranslation( state.selectPayment?.tag ?? TrKeys.paymentMethods, ), onPressed: ()`
*No documentation provided (generation failed).*

### `Padding(padding: EdgeInsets.symmetric(horizontal: 16.w), child: Row( children: [ const PopButton(), if (state.types.isNotEmpty && (state.addressFrom?.isNotEmpty ?? false) && (state.addressTo?.isNotEmpty ?? false)) Expanded( child: Padding( padding: EdgeInsets.only(left: 16.r), child: CustomButton( borderColor: !state.error ? AppStyle.transparent : AppStyle.textGrey, background: !state.error ? colors.primary : AppStyle.white, textColor: !state.error ? AppStyle.black : AppStyle.textGrey, title: "${state.expand ? AppHelpers.getTranslation(TrKeys.order) : AppHelpers.getTranslation(TrKeys.continueText)} ${AppHelpers.numberFormat(state.calculate?.data?.price ?? 0)}", onPressed: ()`
*No documentation provided (generation failed).*
